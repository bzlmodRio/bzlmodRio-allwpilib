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
JNI_PATTERN=[
    "**/*jni.dll",
    "**/*jni.so*",
    "**/*jni.dylib",
    "**/*_java*.dll",
    "**/lib*_java*.dylib",
    "**/lib*_java*.so",
]

static_srcs = glob([
        "**/*.lib",
        "**/*.a"
    ],
    exclude=["**/*jni.lib"]
)
shared_srcs = glob([
        "**/*.dll",
        "**/*.so*",
        "**/*.dylib",
    ],
    exclude=JNI_PATTERN + ["**/*.so.debug"]
)
shared_jni_srcs = glob(JNI_PATTERN, exclude=["**/*.so.debug"])

filegroup(
    name = "static_libs",
    srcs = static_srcs,
    visibility = ["//visibility:public"],
)

filegroup(
    name = "shared_libs",
    srcs = shared_srcs,
    visibility = ["//visibility:public"],
)

filegroup(
    name = "shared_jni_libs",
    srcs = shared_jni_srcs,
    visibility = ["//visibility:public"],
)
"""

def __setup_bzlmodrio_allwpilib_cpp_dependencies(mctx):
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.3/wpiutil-cpp-2023.4.3-headers.zip",
        sha256 = "7113d30fe24c3bd2b89e135b5c170e532a7a4ac5d41cc82a5ed47a4075025905",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.3/wpiutil-cpp-2023.4.3-sources.zip",
        sha256 = "a20a04517ff22d2c47024cb2a808d26ae49010710a5c8f52c92e93993b4ddd40",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.3/wpiutil-cpp-2023.4.3-linuxarm32.zip",
        sha256 = "f4ffa8dce9c7f0057b68d66e41b69b239025a9253874287b28a4a7e0feb7b3bd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.3/wpiutil-cpp-2023.4.3-linuxarm64.zip",
        sha256 = "41e35da9c7b3cb6648af17e36661bd42244d0774b106b6cc3c7348863aa01e80",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.3/wpiutil-cpp-2023.4.3-linuxx86-64.zip",
        sha256 = "eb8861775238780a1c40fce8668bec78683107d0a4f98c29a358aefc97b1494c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.3/wpiutil-cpp-2023.4.3-osxuniversal.zip",
        sha256 = "8a5959e78358a3d02b45fd97f2b202065643fb3827af81dc72d5f1affa736a37",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.3/wpiutil-cpp-2023.4.3-windowsx86-64.zip",
        sha256 = "6ed8ea807ac46cbafa423d4c96a3576417ea808267df6b9923a20aebe6294e4a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.3/wpiutil-cpp-2023.4.3-linuxarm32static.zip",
        sha256 = "b408097d37dafd7fa557afcaffbe42112fee9fcc24e2308056c3e6e250d375be",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.3/wpiutil-cpp-2023.4.3-linuxarm64static.zip",
        sha256 = "4696bec82434d92411296d4121ce63cf5b80e2b6f63e36e680378b5700a85486",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.3/wpiutil-cpp-2023.4.3-linuxx86-64static.zip",
        sha256 = "507c739793c8515ba9a90b3a52d8ef2832373849e74f108b44340df134ebab98",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.3/wpiutil-cpp-2023.4.3-osxuniversalstatic.zip",
        sha256 = "d8cc63525746e3e36cb20a7889534a3b2547ef259262ceaf7ac59e7438ac87b5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.3/wpiutil-cpp-2023.4.3-windowsx86-64static.zip",
        sha256 = "43e663078a0d7df5acece9df7a0aac239964bcae96b5110f7e14f195997f2c8b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.3/wpiutil-cpp-2023.4.3-linuxarm32debug.zip",
        sha256 = "1c9ab1e31f6fd7ae1538fb67c046fbef550f9d8c41ee170c1fe28f1081695c34",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.3/wpiutil-cpp-2023.4.3-linuxarm64debug.zip",
        sha256 = "bd9d21de961989bba0273e0ca2c3a3a6f92a023cae4c3a2e585c3505942357ea",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.3/wpiutil-cpp-2023.4.3-linuxx86-64debug.zip",
        sha256 = "f46eb03e50d3c58ae227aba6a516b7b54f32c5f1154c37452db1e1980d0d73ee",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.3/wpiutil-cpp-2023.4.3-osxuniversaldebug.zip",
        sha256 = "a3279b552a3a2fa6430a19109e8949cc5a2eb1a871ebc2558e5def95d5eaa834",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.3/wpiutil-cpp-2023.4.3-windowsx86-64debug.zip",
        sha256 = "1b6b3c310b1f0c2b76bdd715c64f6b645c6a99ed317b3512c46e3b8cf6529608",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.3/wpiutil-cpp-2023.4.3-linuxarm32staticdebug.zip",
        sha256 = "61f6f54c604a4de73f508347ce768827a73bfea65a0cc7bb4d740198bb54c0d7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.3/wpiutil-cpp-2023.4.3-linuxarm64staticdebug.zip",
        sha256 = "99014a370df3cc48df853a7266a26c76bdf3a1ade5346a8d71364ddf2793828a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.3/wpiutil-cpp-2023.4.3-linuxx86-64staticdebug.zip",
        sha256 = "ab5a0ba20cd0514ea2f9abb13a7651216aebf9c6407569d2c59602fc280c3b1e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.3/wpiutil-cpp-2023.4.3-osxuniversalstaticdebug.zip",
        sha256 = "e71a736821f2765a26837725d2216e6900cbdf0919cb699dbed523a4a63f0f29",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.3/wpiutil-cpp-2023.4.3-windowsx86-64staticdebug.zip",
        sha256 = "b1eaaceca84c261de598c07630c576dbbfc3a954cd241284637bbba6a8a29571",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.3/wpiutil-cpp-2023.4.3-linuxathena.zip",
        sha256 = "8bce4c34c101a5a0eb1790979986632e56e4ce2413d1c845653a3d44c7c268da",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.3/wpiutil-cpp-2023.4.3-linuxathenastatic.zip",
        sha256 = "2fb35a23edd9ef5c8ac3e65813428f3b6cc5729d7e990ebc150d5d392215976e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.3/wpiutil-cpp-2023.4.3-linuxathenadebug.zip",
        sha256 = "ee7bfb485d3013b919b1093a16b88e89d655caa489cd816a3bd7e3439f2f93df",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2023.4.3/wpiutil-cpp-2023.4.3-linuxathenastaticdebug.zip",
        sha256 = "c9f91fab9cc243023cccefa76cddff4cf0b2133da71a9de1e9947c1b228d6494",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.3/wpinet-cpp-2023.4.3-headers.zip",
        sha256 = "58f9559f02f1881349308b5714cdd0ccf2b3d7b7bf07b66b42c4ed668a020d86",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.3/wpinet-cpp-2023.4.3-sources.zip",
        sha256 = "f4026771d64fe66462dd5b4a1b6c3dd02e6f13e4df743f60b48c112777fa7510",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.3/wpinet-cpp-2023.4.3-linuxarm32.zip",
        sha256 = "51b63cdc883e4f090d0efeabe5f4c41f5b22a89b5f30f2d8fcbe13c909a20bc4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.3/wpinet-cpp-2023.4.3-linuxarm64.zip",
        sha256 = "75c4e2863e166eb6c0e190361739ce4173b4af83470be37dc516f33384632667",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.3/wpinet-cpp-2023.4.3-linuxx86-64.zip",
        sha256 = "1bdcc590214071fac2cc7d512009094f476367395637046b1e5513d984dec15f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.3/wpinet-cpp-2023.4.3-osxuniversal.zip",
        sha256 = "2be2837927f2e594d851b0fe1945ff183d05a979be1d2a928d6ee194fe98e96a",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.3/wpinet-cpp-2023.4.3-windowsx86-64.zip",
        sha256 = "97c17d707fc598429a8cee7f9ae74d79e192bbc9c4df2293420a46124cfe507e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.3/wpinet-cpp-2023.4.3-linuxarm32static.zip",
        sha256 = "9f2ae29c6aa135e6e712a49576a6fb6d3fe13d8496d9170f9c393385c4a50cbf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.3/wpinet-cpp-2023.4.3-linuxarm64static.zip",
        sha256 = "97a8bafbfd5ba8f9ebe290966f45235a4ce9f59aca19c09c3fe860627e72abe4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.3/wpinet-cpp-2023.4.3-linuxx86-64static.zip",
        sha256 = "50be6abaca94a402f00ce3f0bd3f14c3235ebdd311a0e4f4612db5bce61e82d5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.3/wpinet-cpp-2023.4.3-osxuniversalstatic.zip",
        sha256 = "3dcbb6d4f982f8ab458f2d8324dc80e153dbea2c3c1b3f4f998744d2e9e291f5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.3/wpinet-cpp-2023.4.3-windowsx86-64static.zip",
        sha256 = "c558b9be256e47adfdde6ad0d407f7e308dd842b7606d058453f811ed78d977f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.3/wpinet-cpp-2023.4.3-linuxarm32debug.zip",
        sha256 = "40d2acb111117f6f3b032f1d8f6eea188addcc713eeb7c402550ce0aae490de2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.3/wpinet-cpp-2023.4.3-linuxarm64debug.zip",
        sha256 = "f9f3c6c57ab96b8fa6800722ba3882b4c76e1b2ad067026cb7f7e675d2dd90a2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.3/wpinet-cpp-2023.4.3-linuxx86-64debug.zip",
        sha256 = "7e18d2a861ec89a6ac5f089cef968e081990ff7effb8dbb7a53a4d98665e8eb8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.3/wpinet-cpp-2023.4.3-osxuniversaldebug.zip",
        sha256 = "400b65b5c612cf51e6f395ddf5ed478239261967c20c5a4d73b260dfb1f7c627",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.3/wpinet-cpp-2023.4.3-windowsx86-64debug.zip",
        sha256 = "d963650a1110df915367f025f1d9ced9593d6a9ab0c23a3823ddb125652e65e7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.3/wpinet-cpp-2023.4.3-linuxarm32staticdebug.zip",
        sha256 = "55be2b56fc8c013cb44f49c76b4ea76e989dbece5ed62cba8d04b5ea090f3f81",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.3/wpinet-cpp-2023.4.3-linuxarm64staticdebug.zip",
        sha256 = "83975eff3a118451ca8554a6c49bbf8d1bcbd17f48784c3e7353b50733233e63",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.3/wpinet-cpp-2023.4.3-linuxx86-64staticdebug.zip",
        sha256 = "481922ab7f277273ad264b8d3ece5a7b8f95d36d0cad3780ea2714ff25f9f401",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.3/wpinet-cpp-2023.4.3-osxuniversalstaticdebug.zip",
        sha256 = "e3d103b56c4ae120938d54cf01542e5fd8af9e965d70e783c7016f0430969625",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.3/wpinet-cpp-2023.4.3-windowsx86-64staticdebug.zip",
        sha256 = "d23dc90293153c25a5300dee98704057a5de1de0eb50d0efb4640f4954962de4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.3/wpinet-cpp-2023.4.3-linuxathena.zip",
        sha256 = "f1c2bcc9cc857acd026c4b8c3479610e64a1267c3d328b84a1df9facc3bf8fd7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.3/wpinet-cpp-2023.4.3-linuxathenastatic.zip",
        sha256 = "c64e8c21102e42ecb640946e1875bfe4b0b18805cb830740cab4048b5da53ced",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.3/wpinet-cpp-2023.4.3-linuxathenadebug.zip",
        sha256 = "51d19b3e8fd62632067f200a28993973216529c8b8847a00d85ad0a3d5386884",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2023.4.3/wpinet-cpp-2023.4.3-linuxathenastaticdebug.zip",
        sha256 = "00db9295e108b962c3243779b09690069536ee07b73de09bfeec91a218196143",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.3/wpimath-cpp-2023.4.3-headers.zip",
        sha256 = "fd0694d5f0f44a0e6830d776fd06bf1fa4ba1215e56f03157d6f1b2dbe4a49c5",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.3/wpimath-cpp-2023.4.3-sources.zip",
        sha256 = "65ad55aca7d474095196e088bf510d6f0e75093247c058b6957282a111d34904",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.3/wpimath-cpp-2023.4.3-linuxarm32.zip",
        sha256 = "528211cf9a4d96016263465378e3d707c0c3569c0b613b78a599cc96c058b496",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.3/wpimath-cpp-2023.4.3-linuxarm64.zip",
        sha256 = "62e3a6344ea9649eda30f6e508bd130aa2aa1a6ae85c750866dd272df6cd5986",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.3/wpimath-cpp-2023.4.3-linuxx86-64.zip",
        sha256 = "804d47f3a690781496341497114f13ba01cd195517f48b8428d349f5d8ba95cc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.3/wpimath-cpp-2023.4.3-osxuniversal.zip",
        sha256 = "68672750258083ceef750a889445c2eb529d3c4e8ac6281f1fdcaac12277a0b0",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.3/wpimath-cpp-2023.4.3-windowsx86-64.zip",
        sha256 = "77176fdfe09d9d37883ae2c13885aa78b8cce68fb6bca32b5b4a4bf5440a1334",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.3/wpimath-cpp-2023.4.3-linuxarm32static.zip",
        sha256 = "52a1b08b89f80eec7e2c6e7e04e50475fc0dbbe5dfac21e0f41e910d5a774df1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.3/wpimath-cpp-2023.4.3-linuxarm64static.zip",
        sha256 = "c5d52dd6754f071a8e275ed2a10aa67c42c75a049c466d03f3db42398b5f63cf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.3/wpimath-cpp-2023.4.3-linuxx86-64static.zip",
        sha256 = "b0a007948b43cacf888dc50fadee67cd063434fa83027b4cb3079b62933acf7e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.3/wpimath-cpp-2023.4.3-osxuniversalstatic.zip",
        sha256 = "ab83efc9bb1205ad85b1722f2ef93b2c89478caef2aef5290969c92cbeb1ed7b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.3/wpimath-cpp-2023.4.3-windowsx86-64static.zip",
        sha256 = "a7c4e4e9568ada099b8ca66c37eb8d0d75622c2a562cc6488c777059ef060acc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.3/wpimath-cpp-2023.4.3-linuxarm32debug.zip",
        sha256 = "5339296a9dfc459431ed9e6c8631c0252900028b73cbb56fdda9747a701d41b2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.3/wpimath-cpp-2023.4.3-linuxarm64debug.zip",
        sha256 = "825d8bf8a6abf0f403deb0501742e7d8c6f6e71e7b8fdb64b65a5ca12cf9547f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.3/wpimath-cpp-2023.4.3-linuxx86-64debug.zip",
        sha256 = "cf2e9ba71be51103073431ef579244357c14b9af7db2f948098e638c5f3bd4e3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.3/wpimath-cpp-2023.4.3-osxuniversaldebug.zip",
        sha256 = "1d954cc145c9de78d9be9d62997d771c643051d9e9998e693b11a2611ef2ebe0",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.3/wpimath-cpp-2023.4.3-windowsx86-64debug.zip",
        sha256 = "af8eae2007a3fc670475495cdf51065390d7658b38f6291402d6964dabca72eb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.3/wpimath-cpp-2023.4.3-linuxarm32staticdebug.zip",
        sha256 = "5d95af8aa314706853d0417e2a047ab818a77cdc74c8ced975f3e57f050fa395",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.3/wpimath-cpp-2023.4.3-linuxarm64staticdebug.zip",
        sha256 = "94c3819f9c739b582a3679e327c0778f540d4d1695a7dd0d8fa688ec33a3e8f9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.3/wpimath-cpp-2023.4.3-linuxx86-64staticdebug.zip",
        sha256 = "2279329ccdf889df013632c674df3d0015db11d0937d84f740ee5e1d3d90c217",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.3/wpimath-cpp-2023.4.3-osxuniversalstaticdebug.zip",
        sha256 = "5d187b299030a1c2652dcd0c9362b7a0100eab270a8ca06054800def276ee11f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.3/wpimath-cpp-2023.4.3-windowsx86-64staticdebug.zip",
        sha256 = "c2a4b9d545dd6e6b09dd9401206cf93d5d4ffe67dab869211e6a06a2b83b8ee6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.3/wpimath-cpp-2023.4.3-linuxathena.zip",
        sha256 = "09db15a544793597aae8d78cbd26a11fbfda41e73b0f9b395592d1dc85bf86b5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.3/wpimath-cpp-2023.4.3-linuxathenastatic.zip",
        sha256 = "1ddc860ae3a1408ec08fe5be45b0783996fc19635c6f36c6c13d055b18ab49e4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.3/wpimath-cpp-2023.4.3-linuxathenadebug.zip",
        sha256 = "526dd033a5f88cc8268ef4d5204b56ec4f2477e7ce7359506fc10c2421b4a14d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2023.4.3/wpimath-cpp-2023.4.3-linuxathenastaticdebug.zip",
        sha256 = "20299b32c118704c9cd93d882e126a030c37d910a8c2cef852333545d8b5d26e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.3/apriltag-cpp-2023.4.3-headers.zip",
        sha256 = "82544e84009030cf72cdc38c0269cb50a374cc9f6f9e1286a925a9aebb41f3d0",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.3/apriltag-cpp-2023.4.3-sources.zip",
        sha256 = "256de7b06a62642c8e68c18a2642788c5ad83f64f84a4820435a42a9c5495b64",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.3/apriltag-cpp-2023.4.3-linuxarm32.zip",
        sha256 = "601c92f9d87ee60497acb2d3f8fae36928b77c78d59041bece463577334ca5a2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.3/apriltag-cpp-2023.4.3-linuxarm64.zip",
        sha256 = "7a2ac5cb023a4f9fd2f7038e069a76cc4a00c723a698b5f8a13de33f78b77e5f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.3/apriltag-cpp-2023.4.3-linuxx86-64.zip",
        sha256 = "ad9e6089da3528ac352793ea9b66ec2b90c5f4c9e2879d2031b5508c21d6fcf1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.3/apriltag-cpp-2023.4.3-osxuniversal.zip",
        sha256 = "9237c2d64decb0561862014598854ac322dbe4843d431633ed3cb0d1a194bbd8",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libapriltag.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libapriltag.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.3/apriltag-cpp-2023.4.3-windowsx86-64.zip",
        sha256 = "87b17d29bf4335db11c8f3672c097ea70d7694738af27b76d0fc3021c53c4f97",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.3/apriltag-cpp-2023.4.3-linuxarm32static.zip",
        sha256 = "6c5c9eedd56e77976435e1a245a592274cbc166fd9ea79ed39293778b6f3a9ce",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.3/apriltag-cpp-2023.4.3-linuxarm64static.zip",
        sha256 = "42712953da3a7b93a7d34b73b49078f3a2bc6f41a9e921f00d975e578472168b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.3/apriltag-cpp-2023.4.3-linuxx86-64static.zip",
        sha256 = "28a6e5830a2e1e0e76257d08355ffe00ae85b23d3cdc79b75f6c2fb3f2ca1520",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.3/apriltag-cpp-2023.4.3-osxuniversalstatic.zip",
        sha256 = "bcd564b2af07c1a90c05caf501c00bc0d76a4b35405012f9ed9afabf58bf6560",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.3/apriltag-cpp-2023.4.3-windowsx86-64static.zip",
        sha256 = "0b29a2dfd7cd8080ba178fbb7fea858df1c1ab2f5d142ca17effa3f1c29ca9a9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.3/apriltag-cpp-2023.4.3-linuxarm32debug.zip",
        sha256 = "2b528be006943279e182f6b662f032447810d81bf697dddb3f1dfdcbb9327049",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.3/apriltag-cpp-2023.4.3-linuxarm64debug.zip",
        sha256 = "996b3be7ceb380c72ab73b2891f7268640b23bb4d339f2c86410ead738c8d02a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.3/apriltag-cpp-2023.4.3-linuxx86-64debug.zip",
        sha256 = "c9fdb5868cb20e0a56b766873c377aeb75532c0bd1f9494f01d3655f5ff0351f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.3/apriltag-cpp-2023.4.3-osxuniversaldebug.zip",
        sha256 = "f291e08d115225ca0d2c93b703b77bd8314debce258cc0a8cf6949f9ee81afbf",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libapriltag.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libapriltag.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libapriltag.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.3/apriltag-cpp-2023.4.3-windowsx86-64debug.zip",
        sha256 = "c0894c7126c3b32113c1145f243c9a44ca18334b5cd00537ac87f3c33bcda180",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.3/apriltag-cpp-2023.4.3-linuxarm32staticdebug.zip",
        sha256 = "2d0c22c3e52d7306cd8edd9d0fa2328c9cfea4aeee9bd03519ba0672b4c3d817",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.3/apriltag-cpp-2023.4.3-linuxarm64staticdebug.zip",
        sha256 = "1dfeb461edbb7d77a6457747666b4ca123c499b55dcb2a7c55ebd175c27705c4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.3/apriltag-cpp-2023.4.3-linuxx86-64staticdebug.zip",
        sha256 = "ee800754ff3cdec5caca5e0fe539aae350844a03c147a4120ae85d6d1d08b988",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.3/apriltag-cpp-2023.4.3-osxuniversalstaticdebug.zip",
        sha256 = "3e2dc138df5ede4c01327392e4e0304d9a48adfeecc744d73a3f26cbb5b915d9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.3/apriltag-cpp-2023.4.3-windowsx86-64staticdebug.zip",
        sha256 = "195449b7730099db2b06eeb447588a964afc3443ede032abd3981fecb1009c41",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.3/apriltag-cpp-2023.4.3-linuxathena.zip",
        sha256 = "438a9aeea98ef51e4b8060cbc01bc8ec4b5de33354c7b4ffd7468af3ef49d090",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.3/apriltag-cpp-2023.4.3-linuxathenastatic.zip",
        sha256 = "9579cdd902ce6f9583d834c583860655b0dc10ca935cf74a2a439d441e313c9d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.3/apriltag-cpp-2023.4.3-linuxathenadebug.zip",
        sha256 = "f5961c19e5abdca9de130fa335bb07e6f939ff0dc4d956a66723be536a0964b6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2023.4.3/apriltag-cpp-2023.4.3-linuxathenastaticdebug.zip",
        sha256 = "1eaabe6e7b254f907814918c37bd59acd324381d2a6f0609135495e3a3af3ca7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.3/hal-cpp-2023.4.3-headers.zip",
        sha256 = "eea8464f8829258371429e2b79f2de3946ff749ae00bd3e4e2f0714138f8f8a2",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.3/hal-cpp-2023.4.3-sources.zip",
        sha256 = "4ea2fed708114b91af89e42e8ae47d7d25d001802a151984ffd1e7737c6aac29",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.3/hal-cpp-2023.4.3-linuxarm32.zip",
        sha256 = "211141e499934d5a91375dd834ef07d4ed3ddc72a7d201d667ef0bb5668d794b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.3/hal-cpp-2023.4.3-linuxarm64.zip",
        sha256 = "597d3a13fd085f693732057c92ebe5210cdbf5db1977d7cf3fd58ed2a88fdbb6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.3/hal-cpp-2023.4.3-linuxx86-64.zip",
        sha256 = "51a75655e7bd9eb8440b506c3494ab4351d43c97dc92a5f160c42cd3fdf1c84b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.3/hal-cpp-2023.4.3-osxuniversal.zip",
        sha256 = "91aa1cdf9cd5fa4c707e0ca6fb7843e46645239624b7f2dd78ff864e15bfcbb7",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.3/hal-cpp-2023.4.3-windowsx86-64.zip",
        sha256 = "208dfeed75fd04db913cdc4dc27d728c29e63890c24e3d6f2f7e1c9549891d7d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.3/hal-cpp-2023.4.3-linuxarm32static.zip",
        sha256 = "009c614a49843e4545a31affb3f27da2adc0f5f357d39c593b053078c33d50e6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.3/hal-cpp-2023.4.3-linuxarm64static.zip",
        sha256 = "fb8f5df906a34c49b0b652a494fbf02cc0c543d1ac9158f8daad756948585c22",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.3/hal-cpp-2023.4.3-linuxx86-64static.zip",
        sha256 = "2cf1fc05c0ba6202b45c5d067d86ad393edcffa9ade08934a4a125544d18ad3f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.3/hal-cpp-2023.4.3-osxuniversalstatic.zip",
        sha256 = "aecc4566e922409116791c88f8f01426a7aa179c6cf45ebaea316e59445ff5ef",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.3/hal-cpp-2023.4.3-windowsx86-64static.zip",
        sha256 = "73d9b8d8040a82db8f0ac71d74b88ee8f97dc0bd7efd094236de054358212847",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.3/hal-cpp-2023.4.3-linuxarm32debug.zip",
        sha256 = "74e086c010c370185747a9168c484ff8a39797d90661d36f6b7b3ee360854688",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.3/hal-cpp-2023.4.3-linuxarm64debug.zip",
        sha256 = "2d1ff0560824a825bc29bafb1ffddaeaf161164ad03a7f4f2f670606364310c5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.3/hal-cpp-2023.4.3-linuxx86-64debug.zip",
        sha256 = "4b664160037de79766f5f05cad9f4ed151b0ab5d9717d5e253f62c0aec942be6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.3/hal-cpp-2023.4.3-osxuniversaldebug.zip",
        sha256 = "4da373078bc0015b096d25fea6e22391fa481eca352de58fb49d0ac2aacd6954",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.3/hal-cpp-2023.4.3-windowsx86-64debug.zip",
        sha256 = "2c8f4e4e713239fb382a0e4310b5dce2ad2a492b6db92fcf6103f026cadf0361",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.3/hal-cpp-2023.4.3-linuxarm32staticdebug.zip",
        sha256 = "947dc12e563c52c216751f020a5310fa45deaed59625de7847007c5d58b9fd71",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.3/hal-cpp-2023.4.3-linuxarm64staticdebug.zip",
        sha256 = "e7d6e4ec1c7c3128e7fc1b741c1878fff383807c7662beb740b96a98185c298c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.3/hal-cpp-2023.4.3-linuxx86-64staticdebug.zip",
        sha256 = "5a9b8683c30deb36da7ba496d70ae51de65598d68d5c262810b5e0769ff63b20",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.3/hal-cpp-2023.4.3-osxuniversalstaticdebug.zip",
        sha256 = "05e122f3ecd80cafa9e27c1e89ced3e572aac039df4cbc027af00a9fdd4c6ab5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.3/hal-cpp-2023.4.3-windowsx86-64staticdebug.zip",
        sha256 = "46d02b4404a9ff7bbd3e6980155a8f9f885a604900537ad5b2b9fb614de65a1e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.3/hal-cpp-2023.4.3-linuxathena.zip",
        sha256 = "f72aa8bcadaef7d3c872f8645ed1d7886abadd4148425f19a4a640a9cee8beeb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.3/hal-cpp-2023.4.3-linuxathenastatic.zip",
        sha256 = "0e14b1d18a5f1d24e9ae116c620fae2b268cec5ff9e67f15d620c2a388be6409",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.3/hal-cpp-2023.4.3-linuxathenadebug.zip",
        sha256 = "57806f7483e9aaa181f6e67804bc58f2f90290094951a6422e2d743c1f7de3f4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2023.4.3/hal-cpp-2023.4.3-linuxathenastaticdebug.zip",
        sha256 = "d4bd618e835d9ab8b58aad33df489e3d04a73c5c1d11ad0fcb45bffb76e937c8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.3/ntcore-cpp-2023.4.3-headers.zip",
        sha256 = "973650cd57cb27ef95a827d466e566b82942a01b83b5dc8a425a9b698f2c8d36",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.3/ntcore-cpp-2023.4.3-sources.zip",
        sha256 = "fc0551a0fd45ba39d2589551b5957cfe603b18671ac3f591d2bc7fcda87a540c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.3/ntcore-cpp-2023.4.3-linuxarm32.zip",
        sha256 = "43b6b6d9ca5033fdde234cd970806a1cbd5e1097c60e9a3236c95301708ed995",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.3/ntcore-cpp-2023.4.3-linuxarm64.zip",
        sha256 = "f2cbb5b530351894562f00cab4158dfa36123c1191db57880a7033f54fbca25e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.3/ntcore-cpp-2023.4.3-linuxx86-64.zip",
        sha256 = "e1644b3c86199880c245af165d09e6d7351a6b8a287e31f7b4373b821def7a3d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.3/ntcore-cpp-2023.4.3-osxuniversal.zip",
        sha256 = "1b441a797222e906797b837265036f3c3c1645dc549c079e2eda327fbbdcd664",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libntcore.dylib osx/universal/shared/libntcore.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libntcore.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libntcore.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.3/ntcore-cpp-2023.4.3-windowsx86-64.zip",
        sha256 = "6def4dd75fe56e68ec0c8bbf67c57597a5a00f7d67be82ed610989babfaad19b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.3/ntcore-cpp-2023.4.3-linuxarm32static.zip",
        sha256 = "71102d47d5a3eff70d52f90c40d6500aafc6ad3569e35510c13f564676327d35",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.3/ntcore-cpp-2023.4.3-linuxarm64static.zip",
        sha256 = "f9939ceb5112bbe251432055d528a9623be58120dc818f33ca5beb616f5b2aa9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.3/ntcore-cpp-2023.4.3-linuxx86-64static.zip",
        sha256 = "beeb17f99b539e7e50110a2ac4673984c1593fd7071984988eeef969d94a2c34",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.3/ntcore-cpp-2023.4.3-osxuniversalstatic.zip",
        sha256 = "4e632e68f0cad7da10cb16125927b6069614f7b748f03daa24f86f6686953e38",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.3/ntcore-cpp-2023.4.3-windowsx86-64static.zip",
        sha256 = "6af2d23e28c26d173c082b27558e04975470aea3d9d3a7dd6468e23a42f14e3f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.3/ntcore-cpp-2023.4.3-linuxarm32debug.zip",
        sha256 = "8e6f6ce49251390fd01cc867fe0d4e509a3e06c3d698d33ad70247c171fc3624",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.3/ntcore-cpp-2023.4.3-linuxarm64debug.zip",
        sha256 = "8a8e574296b74e9a72584567c864a5a3cf26706e5d848467b2dc2b8d74a891a0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.3/ntcore-cpp-2023.4.3-linuxx86-64debug.zip",
        sha256 = "ab4a582999a1c2d971a81ee59b7ac2a4131a51c2545ce7c7718d2342729de37e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.3/ntcore-cpp-2023.4.3-osxuniversaldebug.zip",
        sha256 = "edbc3cf8ee5ce7c1e7810d5f45b7e10d497920219c7e535c4aec70280ded9245",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libntcore.dylib osx/universal/shared/libntcore.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libntcore.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libntcore.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.3/ntcore-cpp-2023.4.3-windowsx86-64debug.zip",
        sha256 = "515d226cccb746b0d74fb019d1416b0541b764e63a5b351739b773162b34fa16",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.3/ntcore-cpp-2023.4.3-linuxarm32staticdebug.zip",
        sha256 = "58a79e340b0c82800d09d0ff52f7ba0d4aed30231b7ed6440f724ca7b4e019d2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.3/ntcore-cpp-2023.4.3-linuxarm64staticdebug.zip",
        sha256 = "42279ac9750003cce2feb4903868c49fb8501d2ff2b8f094d75a524f2186e196",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.3/ntcore-cpp-2023.4.3-linuxx86-64staticdebug.zip",
        sha256 = "25154d978204fdd62696666b40a27f5d3a6d7277b42554ad90e9fe55ae300c80",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.3/ntcore-cpp-2023.4.3-osxuniversalstaticdebug.zip",
        sha256 = "884f0de4f01a7f778e4b11058929a9b1f6694c4cc32c027e2edae5dce8548d2b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.3/ntcore-cpp-2023.4.3-windowsx86-64staticdebug.zip",
        sha256 = "f546c4b01bdd92cdaf0de16791893a15b3fcbde582926b348d061080b03f7fbd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.3/ntcore-cpp-2023.4.3-linuxathena.zip",
        sha256 = "29de9ebe0681ad5939a27cdbcc6654f736fbc0d23f9c86cfc1db818b95ccb3bd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.3/ntcore-cpp-2023.4.3-linuxathenastatic.zip",
        sha256 = "e5ffef99a452983843d84d613ed71d158f1df7aace701b6cec89854ce4e6d001",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.3/ntcore-cpp-2023.4.3-linuxathenadebug.zip",
        sha256 = "38b5a1de882d9ca196b76445d4c000eb5c97567d694e555da734f2ef33b901bb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2023.4.3/ntcore-cpp-2023.4.3-linuxathenastaticdebug.zip",
        sha256 = "d128f06eb2ed92dc0acd7518e7570a7f7976c5518308dc83e9f426a8965c471a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.3/cscore-cpp-2023.4.3-headers.zip",
        sha256 = "417288760f92db3be7be546ec62ff177d2c0fd213194515518a4b5cf00a3c8a0",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.3/cscore-cpp-2023.4.3-sources.zip",
        sha256 = "663f7be66abf0cabcffe06997d1105b647c1f67d859e5aa34ef337606c5a06ce",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.3/cscore-cpp-2023.4.3-linuxarm32.zip",
        sha256 = "39b032f6972950e23ef03f82398f9adfd92a4cc61c11b90e7d61c79ae948fafc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.3/cscore-cpp-2023.4.3-linuxarm64.zip",
        sha256 = "80edab7823b842fd9efffdf300d010017ac38154dc7c8fb05be223c304fcef8c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.3/cscore-cpp-2023.4.3-linuxx86-64.zip",
        sha256 = "f8a122cf5b8371e1e63aa7bfb7d3465e04a03b34032f0507476c060f8e30dfcc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.3/cscore-cpp-2023.4.3-osxuniversal.zip",
        sha256 = "33e15be28b7d41e84bdae0fb585722cd7790e229cb01305b0440d20f770a7da5",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libcscore.dylib osx/universal/shared/libcscore.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libcscore.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libcscore.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.3/cscore-cpp-2023.4.3-windowsx86-64.zip",
        sha256 = "7d15e3ce93f75a630d57310141dc5c3bb1bca94a47a16b662f6f9f218ebbd633",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.3/cscore-cpp-2023.4.3-linuxarm32static.zip",
        sha256 = "dffd5a6ea107a890afb34d7a776397f2f8dcd63ad952cf34f8c22520fe938898",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.3/cscore-cpp-2023.4.3-linuxarm64static.zip",
        sha256 = "65753b54b244009176524a8194c03eb445b225e9096dd4034432b0af9bb08b78",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.3/cscore-cpp-2023.4.3-linuxx86-64static.zip",
        sha256 = "adc3ba42beb9ed2ee66dc7c1e539387b786fb6a023742a8e9bfc6516faa6c72b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.3/cscore-cpp-2023.4.3-osxuniversalstatic.zip",
        sha256 = "23c34b2a751974ecb183e7929cff6b9cdd28bc9aa809819596a0388d2a8ff953",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.3/cscore-cpp-2023.4.3-windowsx86-64static.zip",
        sha256 = "c023246628a9a83299a1ae6cf3b6ed3cfc4dc1ad96d2ab2c0a813c8e9591cb9c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.3/cscore-cpp-2023.4.3-linuxarm32debug.zip",
        sha256 = "e6725ad193c8b3d186440449cdf27f80428b9580ed8f7dfcdb73dbc84aa113c1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.3/cscore-cpp-2023.4.3-linuxarm64debug.zip",
        sha256 = "0c9245d61cbfb21210e9bd5a911fedba3667b5467d9380787aaa39565b92e616",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.3/cscore-cpp-2023.4.3-linuxx86-64debug.zip",
        sha256 = "dc3afafbdbf7803214a17981b5a82aaae1cfd4bfc39fc115725ae93ad89cd578",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.3/cscore-cpp-2023.4.3-osxuniversaldebug.zip",
        sha256 = "c82ccec0f66d10d171904cbe75fed68c90fdf59ca80fe4bfb31a92d8b6097eaf",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libcscore.dylib osx/universal/shared/libcscore.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libcscore.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libcscore.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.3/cscore-cpp-2023.4.3-windowsx86-64debug.zip",
        sha256 = "5beda64635733294fc5118ed88cad2f1a055b5f1f4cdcce9bc0858af138d056b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.3/cscore-cpp-2023.4.3-linuxarm32staticdebug.zip",
        sha256 = "f6703d7eb7d212e4e7a7a396ea3591ec5e947b17b210c4c985697699038fa241",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.3/cscore-cpp-2023.4.3-linuxarm64staticdebug.zip",
        sha256 = "ad0fae6f9b1a7d4376ceabed4280fcee23f4108ce87d64258b5e5a3401d696c2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.3/cscore-cpp-2023.4.3-linuxx86-64staticdebug.zip",
        sha256 = "847ab8b7508b27c6792673da46a556eab62a8587e85a55af345868dff94b322d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.3/cscore-cpp-2023.4.3-osxuniversalstaticdebug.zip",
        sha256 = "8628391446329a479a50c30600c65198d9c6085f2b33a101084e2a8ced9944aa",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.3/cscore-cpp-2023.4.3-windowsx86-64staticdebug.zip",
        sha256 = "7c02afdfd92ed2539340abbef8a67350638aeb1c7e12d0898ba6f8aeede8766d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.3/cscore-cpp-2023.4.3-linuxathena.zip",
        sha256 = "60512441a80599b405a8ece1437f608c044801bff1637a7949d07adb051d5d52",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.3/cscore-cpp-2023.4.3-linuxathenastatic.zip",
        sha256 = "f485a2f5005832e866e6b1aa3a0646451d2f034b5f109570deecbaaff155e581",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.3/cscore-cpp-2023.4.3-linuxathenadebug.zip",
        sha256 = "865a6ef3cdac0c529388578476f36d9ac8a8cf14c18490fd9ce3a9e9e3ce9a1e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2023.4.3/cscore-cpp-2023.4.3-linuxathenastaticdebug.zip",
        sha256 = "846f9e1307c6ce8cb8528845129ad9262b7a5c0ef43d68eeb79156cb9ab5e681",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.3/cameraserver-cpp-2023.4.3-headers.zip",
        sha256 = "61d1bcf9c5e5c2dc2dcef36ea14e2cf0d5ecc34ce38cde1620a3b40fd6ac838a",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.3/cameraserver-cpp-2023.4.3-sources.zip",
        sha256 = "03fb4db9d11b8f868088609b3df904a2945dcc53eb0ab1f90e8e6e615dc494d5",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.3/cameraserver-cpp-2023.4.3-linuxarm32.zip",
        sha256 = "38731ca29bdfd021afe5c0d48a0a7772e255024a95b8c20dfeebe58cdd21ab87",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.3/cameraserver-cpp-2023.4.3-linuxarm64.zip",
        sha256 = "172a892f044cb26616caf64c50ab6896ef995a3fb84b9b316f737802a47d8a7b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.3/cameraserver-cpp-2023.4.3-linuxx86-64.zip",
        sha256 = "ba67e1420a10661d7e44553b51b038fd0e22a40fbc883400482c29f9e78693a1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.3/cameraserver-cpp-2023.4.3-osxuniversal.zip",
        sha256 = "fafbb33cea7cae5f50aba3cdeb54ffe54197c498206047c8002099392e49590d",
        build_file_content = cc_library_shared,
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.3/cameraserver-cpp-2023.4.3-windowsx86-64.zip",
        sha256 = "c1c248b4d8008a291c916d80af59ea53bcda7de6505c7aa08491af9bd1ba7943",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.3/cameraserver-cpp-2023.4.3-linuxarm32static.zip",
        sha256 = "d5b83a55713530ca64a88c7e209b02db9c85ea60b17021cdb125f163eeebd811",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.3/cameraserver-cpp-2023.4.3-linuxarm64static.zip",
        sha256 = "a59c57a5cc2f49ebca71980a2a86a3d2e1e8bc01b5504bbe325691529578df5e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.3/cameraserver-cpp-2023.4.3-linuxx86-64static.zip",
        sha256 = "737ecb33becb66c4ced0af0bbbf819f7713db035010c2557ada65b68bb2f18a7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.3/cameraserver-cpp-2023.4.3-osxuniversalstatic.zip",
        sha256 = "32d3e944962848a2c508910eb54614cdedd9d972bf7b50a9280000a88f3a6264",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.3/cameraserver-cpp-2023.4.3-windowsx86-64static.zip",
        sha256 = "0d075c1eac57b2c0846e68349baa75b026da13a623fe7f396b689cf43e1b5056",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.3/cameraserver-cpp-2023.4.3-linuxarm32debug.zip",
        sha256 = "ae10f32fc522df96e69f39ae3fef49affcabdae4d0a7c737cd96a2bd6cb8db53",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.3/cameraserver-cpp-2023.4.3-linuxarm64debug.zip",
        sha256 = "7e80e60c5f2441599566e8e0fbcce99b5f40433e5d7e2fb8fb554c22394bc1fe",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.3/cameraserver-cpp-2023.4.3-linuxx86-64debug.zip",
        sha256 = "7045f984c32c44f47efcae7ed1f979076dba43c8b724a24102fc96058c80dd38",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.3/cameraserver-cpp-2023.4.3-osxuniversaldebug.zip",
        sha256 = "b55e8363fc17db6478d912220787cca11cb4bc1c4c763c48ebd699bf0377492f",
        build_file_content = cc_library_shared,
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.3/cameraserver-cpp-2023.4.3-windowsx86-64debug.zip",
        sha256 = "7935bf20490611b672cabbffc9a8236e13b66440be3792071c1327a581a4b584",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.3/cameraserver-cpp-2023.4.3-linuxarm32staticdebug.zip",
        sha256 = "7cd6c558eaf4236d3cf71dbad724de11d251e8ba32d0482c57a8b51c7e49eccb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.3/cameraserver-cpp-2023.4.3-linuxarm64staticdebug.zip",
        sha256 = "626b9ebf26a7e320214e1bf45f38fe0cc56f8548544a44a9cb25b3cee7135d12",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.3/cameraserver-cpp-2023.4.3-linuxx86-64staticdebug.zip",
        sha256 = "e91d4d4d04e097b77865a840dd956136f097559b7ce40c5bac4739616f40aaa3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.3/cameraserver-cpp-2023.4.3-osxuniversalstaticdebug.zip",
        sha256 = "063c072108a7ae5d00cb57a44b6a1f08faf7246f9308e88c98c3ec96d978b40b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.3/cameraserver-cpp-2023.4.3-windowsx86-64staticdebug.zip",
        sha256 = "62d65297c667630cd3bc272d576569a82000342ca386911e7a2e09ab045ca0ac",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.3/cameraserver-cpp-2023.4.3-linuxathena.zip",
        sha256 = "0bea1e69a487ad52ff632cac4922094aa6a1bc6b7253cf125fe518db647871fa",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.3/cameraserver-cpp-2023.4.3-linuxathenastatic.zip",
        sha256 = "55bd844ad3132082dc130f60060c029d80f8861449502a5b16551c78c8cee874",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.3/cameraserver-cpp-2023.4.3-linuxathenadebug.zip",
        sha256 = "0560b56d81418206b63cc31ff3c624a8a2b3e9e121792dc1149f7a506ee10f4e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2023.4.3/cameraserver-cpp-2023.4.3-linuxathenastaticdebug.zip",
        sha256 = "ab428fd74c9b0c1d95a763b9459c5fc610389f9aefa0f075f43d3d983493f7b0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.3/wpilibc-cpp-2023.4.3-headers.zip",
        sha256 = "7a047f172da388fb1afd6c7e7d3de50ce0dba6acb17e1d24e0cb73db074ad35e",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.3/wpilibc-cpp-2023.4.3-sources.zip",
        sha256 = "03cf0986f63cd4cb3763a67ce9660ebe8cce25473353ad915818b01ee55570e8",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.3/wpilibc-cpp-2023.4.3-linuxarm32.zip",
        sha256 = "7e683f8538eeb17a952feb03163d85a2df1e5c3d619cd10178bba8ffc7262e11",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.3/wpilibc-cpp-2023.4.3-linuxarm64.zip",
        sha256 = "4f62d83a016ca29eab11d30b26afe101134241e3003825232177f87dd74dc934",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.3/wpilibc-cpp-2023.4.3-linuxx86-64.zip",
        sha256 = "8276140fa5ffa5c8b2652ceeadb1f14c95a08bb67be65b7fb56a58fe1557f633",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.3/wpilibc-cpp-2023.4.3-osxuniversal.zip",
        sha256 = "a33ced9f51a952e029fe2633823ee6695da2c6b49e00a7adb99d540f379a73fc",
        build_file_content = cc_library_shared,
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.3/wpilibc-cpp-2023.4.3-windowsx86-64.zip",
        sha256 = "6a80d09d3245060915d9eb837c0ef511bb02ee13efa2c11a5edaed6c640165e8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.3/wpilibc-cpp-2023.4.3-linuxarm32static.zip",
        sha256 = "6e44c85780f9056cdf1d1dc8f61651dd885d24612b507f31d309702176a95bbe",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.3/wpilibc-cpp-2023.4.3-linuxarm64static.zip",
        sha256 = "eebf742a13987f7222f3de148faf0654f36e1780b010f8e6bdb263ae15eb355c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.3/wpilibc-cpp-2023.4.3-linuxx86-64static.zip",
        sha256 = "169bcf38d7dfad1c76cfaa6d45bdd4193d694824429390a15d34f6ea75dd102f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.3/wpilibc-cpp-2023.4.3-osxuniversalstatic.zip",
        sha256 = "f0935e73b2e372b3770367983072b1c0711e677813fabf1915862510d4030180",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.3/wpilibc-cpp-2023.4.3-windowsx86-64static.zip",
        sha256 = "f8bddab666fa272b6ecb0e01887269ee19501a5f0f484b82de45fd09396151e0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.3/wpilibc-cpp-2023.4.3-linuxarm32debug.zip",
        sha256 = "588b2b76381a3de8086cf5624ac7155840ecdee6d0ecea7505a16c224e7a9a77",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.3/wpilibc-cpp-2023.4.3-linuxarm64debug.zip",
        sha256 = "745b9ce92f10f29593da622550d7367b6ade88d61302ad83e427ff9dfd710e38",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.3/wpilibc-cpp-2023.4.3-linuxx86-64debug.zip",
        sha256 = "76a01d9849dffb2300ef917a8694b225576dc60bca68158cd30ed1d2fab500c0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.3/wpilibc-cpp-2023.4.3-osxuniversaldebug.zip",
        sha256 = "7ac41ce92895e742e9a05e9e446e4a4bb173c77665aee0e755a2518a9fc47fc4",
        build_file_content = cc_library_shared,
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.3/wpilibc-cpp-2023.4.3-windowsx86-64debug.zip",
        sha256 = "9fde653932cf20b58398b50023e88f9374f382e8d6e01ab5e460c5b25ed166f6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.3/wpilibc-cpp-2023.4.3-linuxarm32staticdebug.zip",
        sha256 = "f01c0bcc5a5b6f9816461ebd03a480b7f0d1d52b470a8bba34ff519bf0f1f567",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.3/wpilibc-cpp-2023.4.3-linuxarm64staticdebug.zip",
        sha256 = "ecefb1e247512e9af31c376c61bb45aef5455f8d9da79475e4dcc58033c9399b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.3/wpilibc-cpp-2023.4.3-linuxx86-64staticdebug.zip",
        sha256 = "be861edf65f7f7c4836af1ca59c1acef55a7728a9273e72c43ade3a0df7441d6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.3/wpilibc-cpp-2023.4.3-osxuniversalstaticdebug.zip",
        sha256 = "04dabe07cd6f03aa8fd39b096ec488302f473c25fefd61490a8d74126cb7bcb9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.3/wpilibc-cpp-2023.4.3-windowsx86-64staticdebug.zip",
        sha256 = "7388c92688618cc623e4ab516817ac8f6d9e06b718c40a4df7295c6b3dfba65a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.3/wpilibc-cpp-2023.4.3-linuxathena.zip",
        sha256 = "87a81680c8fc5762580d484c3a6c62170640f6a8cc39c10bc16d06960ac1b40b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.3/wpilibc-cpp-2023.4.3-linuxathenastatic.zip",
        sha256 = "cc1e7ecd5510b7ac1b6c5d0bb6ab5821c6fed0aa61b9290eab2283d050125d19",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.3/wpilibc-cpp-2023.4.3-linuxathenadebug.zip",
        sha256 = "86a8b7b5f726e8170de8a52664f48d5465540a966de528487d5c1fc86685529a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2023.4.3/wpilibc-cpp-2023.4.3-linuxathenastaticdebug.zip",
        sha256 = "3de5ac493829bc64ca153408ff8821ff05d28ad775bcb740b14d64e0967ded24",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.3/wpilibNewCommands-cpp-2023.4.3-headers.zip",
        sha256 = "8915ed5ecde4f6aae63a2caac690ca45541747e449c090fc165d14db03a25afa",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.3/wpilibNewCommands-cpp-2023.4.3-sources.zip",
        sha256 = "92a56a6a180afc2fee27426dde04707943e1fb044d79c6992d7851a30eaeb16a",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.3/wpilibNewCommands-cpp-2023.4.3-linuxarm32.zip",
        sha256 = "6e25405ba16c05f87e1ced63d0fb2f61959247e532b96a7fa889c4d96415616f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.3/wpilibNewCommands-cpp-2023.4.3-linuxarm64.zip",
        sha256 = "083a02bed93cf3026614f7378d479c0f7360f87cd0bf1d0317e93d4cb7b52296",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.3/wpilibNewCommands-cpp-2023.4.3-linuxx86-64.zip",
        sha256 = "0f3921b4c3871c2a608ea6b36b558ff55b2f7bad491a5f15ad2b259765555a17",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.3/wpilibNewCommands-cpp-2023.4.3-osxuniversal.zip",
        sha256 = "7d57eee51043714eb1560e105eb290d84bd5cbf73f3b05ff338e1f03ef49ba62",
        build_file_content = cc_library_shared,
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.3/wpilibNewCommands-cpp-2023.4.3-windowsx86-64.zip",
        sha256 = "9353272bd8746968b5ceb3583def6d91c3cb236578d2b24eb18a703bbed703af",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.3/wpilibNewCommands-cpp-2023.4.3-linuxarm32static.zip",
        sha256 = "aeb258254b6ce7621bb3d05c2ae74b8b870ae41373820e0501f1f9051d2710cf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.3/wpilibNewCommands-cpp-2023.4.3-linuxarm64static.zip",
        sha256 = "35ec3a21a379483d17905dde8e33611364297a85f820aeb926bf27ceecd51539",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.3/wpilibNewCommands-cpp-2023.4.3-linuxx86-64static.zip",
        sha256 = "5c8f9db6f769b9f35ece0188e3037692c294c815834acd7495050db3e14f1002",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.3/wpilibNewCommands-cpp-2023.4.3-osxuniversalstatic.zip",
        sha256 = "d21d34d07e07aa769cc0581cfd9e2e2bc89de8fab90992dd2f2df4f6533d9856",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.3/wpilibNewCommands-cpp-2023.4.3-windowsx86-64static.zip",
        sha256 = "dbbfc8e0060f5801e43a8d4cbceb474178b3b373d3ca204fcbbd0eb3ef73352b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.3/wpilibNewCommands-cpp-2023.4.3-linuxarm32debug.zip",
        sha256 = "0b358c5cbe252ceb0125dd87541ea213a199c1a12b8e38c65f40aeacb25371e1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.3/wpilibNewCommands-cpp-2023.4.3-linuxarm64debug.zip",
        sha256 = "f4429922dbc9db751ebca6f73c7ad4ae3390df1cf76e2b5e9aa91923097ec23e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.3/wpilibNewCommands-cpp-2023.4.3-linuxx86-64debug.zip",
        sha256 = "cf6de21e693648d353385af62de5d0f4786d510d7c2c9785c39b478078656106",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.3/wpilibNewCommands-cpp-2023.4.3-osxuniversaldebug.zip",
        sha256 = "5b1ba88dc5d253e9f39b0bbb62b36ebc6d10600f2bd5f83db75e7a55dbf5b07e",
        build_file_content = cc_library_shared,
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.3/wpilibNewCommands-cpp-2023.4.3-windowsx86-64debug.zip",
        sha256 = "ebd6c9411e6fcf893dca9d0040fe088a8e4d508f4d6edc8d8888e53600da6640",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.3/wpilibNewCommands-cpp-2023.4.3-linuxarm32staticdebug.zip",
        sha256 = "a29966b839ce402eb688141601574444c82d91d0fcccb716698a94c00e6ec9ee",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.3/wpilibNewCommands-cpp-2023.4.3-linuxarm64staticdebug.zip",
        sha256 = "bff555dba7783852ad91a2a886e08743121f73e9bba6f7165e2699a56d1ae1d9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.3/wpilibNewCommands-cpp-2023.4.3-linuxx86-64staticdebug.zip",
        sha256 = "8e41cf94b03080fb8e352588214b29005eeb695bf597f03c8d3fdb6f5741cae2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.3/wpilibNewCommands-cpp-2023.4.3-osxuniversalstaticdebug.zip",
        sha256 = "d376b205d555f2555a01690323f878f834f4e8ef6fd7a8dda4f4771dfe1f505e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.3/wpilibNewCommands-cpp-2023.4.3-windowsx86-64staticdebug.zip",
        sha256 = "918356afb8a8eed14109a3a3de4f5324f14db2bf6e1191e3f93d5aac2664de66",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.3/wpilibNewCommands-cpp-2023.4.3-linuxathena.zip",
        sha256 = "8acabfe9e60e2384568c0744bef5abfa8bf981f7ea3a7a2214baeee0631a40db",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.3/wpilibNewCommands-cpp-2023.4.3-linuxathenastatic.zip",
        sha256 = "f976872b4ad043d1187490c63bc1ab9dec2163edad8f321ef19646aec049f791",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.3/wpilibNewCommands-cpp-2023.4.3-linuxathenadebug.zip",
        sha256 = "3e7819425d37e9434b982515cfbb540e88a4f9185e5174c2783f44438b45ab41",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2023.4.3/wpilibNewCommands-cpp-2023.4.3-linuxathenastaticdebug.zip",
        sha256 = "5a788a968e78abaabebf07ba736acacaca913b5e44eba5591ea3d20b9a112c45",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.3/halsim_ds_socket-2023.4.3-sources.zip",
        sha256 = "5d0de3dc95a17516e0751a9dc96fe12a6f2aacba9219320d8f802a02c8eaae9d",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.3/halsim_ds_socket-2023.4.3-linuxarm32.zip",
        sha256 = "570cbcf42c3bffa5942089dbe1be16c8a57ef1266ab5b5ff173433ea7dce20ff",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.3/halsim_ds_socket-2023.4.3-linuxarm64.zip",
        sha256 = "ada9bd1ed1e96818013d67b2e6501bc4f1fa6a22ad34251b972b3f42330eb405",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.3/halsim_ds_socket-2023.4.3-linuxx86-64.zip",
        sha256 = "40b93e4c781886fbb4063206daba15cfd01d6018eedaaaa4917304ba62d88b70",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.3/halsim_ds_socket-2023.4.3-osxuniversal.zip",
        sha256 = "f14a68c90d954475ffbe572b443d6f9f85d241b9dc195bb8b10f994ef1d4f2c1",
        build_file_content = cc_library_shared,
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.3/halsim_ds_socket-2023.4.3-windowsx86-64.zip",
        sha256 = "865d6e3b7c860748b9513814344d4e82f38964707624b5f4812004e5466f45c3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.3/halsim_ds_socket-2023.4.3-linuxarm32static.zip",
        sha256 = "2309dc0743d7fa233d5b52c17a1286a1573408cc80a9325ff155202eb286bb26",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.3/halsim_ds_socket-2023.4.3-linuxarm64static.zip",
        sha256 = "c10b371f90e79825b7eff5c349912571fd8187d628dcd37d35583a5a037e96e8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.3/halsim_ds_socket-2023.4.3-linuxx86-64static.zip",
        sha256 = "270164a9666aae47c7eb8f70a74f802e19900ff1e6a3392eac116888ae934a06",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.3/halsim_ds_socket-2023.4.3-osxuniversalstatic.zip",
        sha256 = "196aaccd05981565167568e1633a3c4f8b222d82e23d84b4b7ce033c76ec5ccf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.3/halsim_ds_socket-2023.4.3-windowsx86-64static.zip",
        sha256 = "91d1d494e7484960d42d6044e81071f56ddf167e183c8cf1a77326e9d441ff55",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.3/halsim_ds_socket-2023.4.3-linuxarm32debug.zip",
        sha256 = "1cc52b58ebf8df2bda8a5c8df4c5a4c243ad82ea1372fd5172cab0d011d0152f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.3/halsim_ds_socket-2023.4.3-linuxarm64debug.zip",
        sha256 = "09ad02b57d295185770af5b5116eae4d747b16cd0f14ae5373717f268a86efe1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.3/halsim_ds_socket-2023.4.3-linuxx86-64debug.zip",
        sha256 = "a2552475d909e891a288814e35c68a570e8c89148970974c9d66888a1f071454",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.3/halsim_ds_socket-2023.4.3-osxuniversaldebug.zip",
        sha256 = "a44486ca042363aa981cff1f49ee8b95dfe2a35d7c5229d15f187153c4454bee",
        build_file_content = cc_library_shared,
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.3/halsim_ds_socket-2023.4.3-windowsx86-64debug.zip",
        sha256 = "3535c4bd6296d7b25ace581ade1ea1725f85cd00405214ca4805633611bd3eb8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.3/halsim_ds_socket-2023.4.3-linuxarm32staticdebug.zip",
        sha256 = "8b83969a64f38630784e809b8016a64d39c47b9281463bfc5ff258ef920a8d94",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.3/halsim_ds_socket-2023.4.3-linuxarm64staticdebug.zip",
        sha256 = "c2b3771605c23bcc621c15fea062dd21625f7a974f8c403e4f2d2c1296e7700f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.3/halsim_ds_socket-2023.4.3-linuxx86-64staticdebug.zip",
        sha256 = "d85b81227836e8e9796f061a06113deaded286d28d63380d7fd3d05dc3769a47",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.3/halsim_ds_socket-2023.4.3-osxuniversalstaticdebug.zip",
        sha256 = "1da0e4af05e112ae66d22cb25e4447184d224eafdb7fab76c0eb80beb90b687c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2023.4.3/halsim_ds_socket-2023.4.3-windowsx86-64staticdebug.zip",
        sha256 = "b96b2f6b8a718616e0f1afb6519a6ebd5a6b18e666b96c02b2d9b8a2cb059e77",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.3/halsim_gui-2023.4.3-sources.zip",
        sha256 = "b4bbce3b5cde2a0f28095e3abe4c938f823dad1bbc00e80f5024ed8d0b06b2c5",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.3/halsim_gui-2023.4.3-linuxarm32.zip",
        sha256 = "95799f24062e0b49894644eebabe158a6256ad155649902868fbec0bce572e71",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.3/halsim_gui-2023.4.3-linuxarm64.zip",
        sha256 = "eb967c2528f988d7fac81ac3d4c643064cd731ea0c6804767c6066e75e21c052",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.3/halsim_gui-2023.4.3-linuxx86-64.zip",
        sha256 = "bd3b81017923ec8daa4939cb0319563a0ccb6cad7cd76b267134d8f909fc9c96",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.3/halsim_gui-2023.4.3-osxuniversal.zip",
        sha256 = "b4ebb319f48fc6ff6b9cecfef1cb227e3cb0f6302eb6b48f47b57197865f83ea",
        build_file_content = cc_library_shared,
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.3/halsim_gui-2023.4.3-windowsx86-64.zip",
        sha256 = "593333b9c57abc1f4c9be1281ee72340bd64a00d43084d5c6b65eb526067cbe2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.3/halsim_gui-2023.4.3-linuxarm32static.zip",
        sha256 = "f3a714a6c5f6d801d88d40ea3b6b7de933822ff488865c72c372bd2856b9f9ac",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.3/halsim_gui-2023.4.3-linuxarm64static.zip",
        sha256 = "a4a5cfc55ef685c1a2f56bd109fb4b73af1f959216464f7e15db86cac257bb7a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.3/halsim_gui-2023.4.3-linuxx86-64static.zip",
        sha256 = "963176f84d3655f03d5f10053c5ba0a642292b140e94ade3251c66efa357deab",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.3/halsim_gui-2023.4.3-osxuniversalstatic.zip",
        sha256 = "89534516e7b23a593e6d635d009fa7c0dd81d71bb1ed7e63dd3b0a31496586ad",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.3/halsim_gui-2023.4.3-windowsx86-64static.zip",
        sha256 = "545b09fea1fb2aa4c4e4a60e753119376df215d6e4af083ad090a14074e2552f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.3/halsim_gui-2023.4.3-linuxarm32debug.zip",
        sha256 = "3ee184a4931743b6d1af4f5987ba22af57effd67a56890559721d339bc44b8d8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.3/halsim_gui-2023.4.3-linuxarm64debug.zip",
        sha256 = "5865ea5b9fc1ee8cb4b25c7f31a0bc4110d512d801e7eccb00a5fbb69afc7f21",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.3/halsim_gui-2023.4.3-linuxx86-64debug.zip",
        sha256 = "35dd028c592b41e8138b0e3e38296f268c6357a8b9fc0d61686e5d99b7457d4c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.3/halsim_gui-2023.4.3-osxuniversaldebug.zip",
        sha256 = "c82c7b7d3cf65dadf1d7fe977dc73facb014f4e5d78dcbd336215b4a98c8422f",
        build_file_content = cc_library_shared,
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.3/halsim_gui-2023.4.3-windowsx86-64debug.zip",
        sha256 = "f142ba52e37e2f132d0d5ec44d6cd60ffc2dfeb4e0f039ec7b573dd3197f2f3c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.3/halsim_gui-2023.4.3-linuxarm32staticdebug.zip",
        sha256 = "c056fa512f98bbfb41d47e6c569d9a502edf0644739cc1d2102556e62845263c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.3/halsim_gui-2023.4.3-linuxarm64staticdebug.zip",
        sha256 = "40edf8c5a4e5d105220fea54d79e9766f8f4b40dfeee4ca4918af7c33e1aa686",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.3/halsim_gui-2023.4.3-linuxx86-64staticdebug.zip",
        sha256 = "b9c6cf025828df7beed0b52f5543cdfd8c299feb039d91a60ed31a59cf204f64",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.3/halsim_gui-2023.4.3-osxuniversalstaticdebug.zip",
        sha256 = "9841b9fea81cb2dde73bfaa42bf98dc2b4e796687875abb9eabdf5ac35375b46",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2023.4.3/halsim_gui-2023.4.3-windowsx86-64staticdebug.zip",
        sha256 = "f9eec452d90adc570fdeb4a5b59a27d99f1ce038629773f3c31819a00d69a424",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.3/halsim_ws_client-2023.4.3-sources.zip",
        sha256 = "06ed7d5e2b6ea6453f82bbefb68dfb8811fce23a69a6400d5578bffc2fc46d38",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.3/halsim_ws_client-2023.4.3-linuxarm32.zip",
        sha256 = "4c5a3afc018354873c46b7223623e7e51212df1b4224e78347618dbb30458a98",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.3/halsim_ws_client-2023.4.3-linuxarm64.zip",
        sha256 = "afdc7437ecb0c00413a183193e6d19addfaea76ff8e9a99d243be7ca4fa3f9cd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.3/halsim_ws_client-2023.4.3-linuxx86-64.zip",
        sha256 = "b011a615bf7b2ca4d5439bd6b8f42ea27ee2c2fc657c7829ef8ab581de34c27e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.3/halsim_ws_client-2023.4.3-osxuniversal.zip",
        sha256 = "2f5efbc41e81eea861c892ce24b03eb8ecc4727e2294f016b730e87e1e679e5f",
        build_file_content = cc_library_shared,
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.3/halsim_ws_client-2023.4.3-windowsx86-64.zip",
        sha256 = "4871c5e5dbec4c93addf74be76b2ea467c8076409e45d8af35d4a688f8c90128",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.3/halsim_ws_client-2023.4.3-linuxarm32static.zip",
        sha256 = "e1761b105b780da2ea34309835d36e1e4e2abfe4d046bf10a5143af7ce7f6e70",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.3/halsim_ws_client-2023.4.3-linuxarm64static.zip",
        sha256 = "c882e4b75ed57b144982a60ee5530c35a756744255352a36b980c2a118d0a854",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.3/halsim_ws_client-2023.4.3-linuxx86-64static.zip",
        sha256 = "3b96fbcbdff22f1e2fc32a15a5a3420d448c008b471e9bf7dd8c16073e233ed7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.3/halsim_ws_client-2023.4.3-osxuniversalstatic.zip",
        sha256 = "e4df406278a4c8cf5a9023fe8f92a0b99490e1f02277ab326ac0ce15fac5f7ec",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.3/halsim_ws_client-2023.4.3-windowsx86-64static.zip",
        sha256 = "503ec48b32938c923af010dff067639349e9eb3685f86461fb2fc809df36d12d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.3/halsim_ws_client-2023.4.3-linuxarm32debug.zip",
        sha256 = "99518aba34e1ea262b3ad516d666e3571c59b8eb9a913b247a9b541865134737",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.3/halsim_ws_client-2023.4.3-linuxarm64debug.zip",
        sha256 = "63488d2cb4e0abe5cd54b91f9d1ccfea750fa89d7d15e69349a9b561a8b387c5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.3/halsim_ws_client-2023.4.3-linuxx86-64debug.zip",
        sha256 = "c1b06b93b3d6dad1b8f85d3ddba53d848beafa4dd7e69411791d46ce160c86c7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.3/halsim_ws_client-2023.4.3-osxuniversaldebug.zip",
        sha256 = "75a70534415faa429479c8c3bfa8cbdea4a4899155cfda86f610f1ade0acaaab",
        build_file_content = cc_library_shared,
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.3/halsim_ws_client-2023.4.3-windowsx86-64debug.zip",
        sha256 = "b3cae1c4d7521eb6d657bcfbbb7913e874a9b952feb43142225219c56dd403da",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.3/halsim_ws_client-2023.4.3-linuxarm32staticdebug.zip",
        sha256 = "2f3824049b8d0c3ac9ade27a4d5f871dc8879d7592f5b9e420fb8834628c627e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.3/halsim_ws_client-2023.4.3-linuxarm64staticdebug.zip",
        sha256 = "b80d2bf25c16c156f721998657ee94205fe009956df4fe014612780e4c493095",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.3/halsim_ws_client-2023.4.3-linuxx86-64staticdebug.zip",
        sha256 = "dcc4e399d398546f60d83bddd93918d7be2e00e31c489f4e2783dd1f20216b54",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.3/halsim_ws_client-2023.4.3-osxuniversalstaticdebug.zip",
        sha256 = "3221cfec5211f9ecf812fc5eb286616e7fd474782104eab69da9e1760dd73ab3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2023.4.3/halsim_ws_client-2023.4.3-windowsx86-64staticdebug.zip",
        sha256 = "e9db1a6354e8aeb062fb631c53f17f098278e6a47ef0365a4b415bc3b3fc26fb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.3/halsim_ws_server-2023.4.3-sources.zip",
        sha256 = "0eb6cbbe1d7bae8e97e227a891426c2b2993864000eb54ab9547c9fb6eb796a6",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.3/halsim_ws_server-2023.4.3-linuxarm32.zip",
        sha256 = "430cb2d3864456fa518a15db88129e1878b931c1d6aca1e08b8b4bc1a2a02315",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.3/halsim_ws_server-2023.4.3-linuxarm64.zip",
        sha256 = "9c778a5752418555930f204ff5a53e1112810ad96ac2bd692a8cb5ceb2855d76",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.3/halsim_ws_server-2023.4.3-linuxx86-64.zip",
        sha256 = "b71a577e51b64d1e4fad72b52991fe2c7bbd55c9257cef84b48c0b1891ebee78",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.3/halsim_ws_server-2023.4.3-osxuniversal.zip",
        sha256 = "48b17c1b88495bf4bbe778668ed45cc668dfa9fbe98913d734eb77e3dd3d2ae4",
        build_file_content = cc_library_shared,
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.3/halsim_ws_server-2023.4.3-windowsx86-64.zip",
        sha256 = "e29859f9b594db85afc00ec6d3aebaf24792e0dd99f4f508fd0586a04c672fff",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.3/halsim_ws_server-2023.4.3-linuxarm32static.zip",
        sha256 = "ea577dd2afc4c50f6ffd68ebb811b0dccd415e26fa62f43eef3dfefe38a1c3cb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.3/halsim_ws_server-2023.4.3-linuxarm64static.zip",
        sha256 = "394432c464845b24a3e47ab7c8787bf7b4685ec04babbd93f6a97c8683ae753e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.3/halsim_ws_server-2023.4.3-linuxx86-64static.zip",
        sha256 = "cc0ebf2c00bed5033787ddbdbfb8d78df3b9c02156fc5f0074df0f1ae1d90aa6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.3/halsim_ws_server-2023.4.3-osxuniversalstatic.zip",
        sha256 = "b32efe69cb3bddf578a34b58fbdce7dbc29e80d9669312302ca838eeae949e62",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.3/halsim_ws_server-2023.4.3-windowsx86-64static.zip",
        sha256 = "ab340a7bc1cbf1fb9acce8d5f21a0f05e9553f66ace29de49541c507694e6b5d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.3/halsim_ws_server-2023.4.3-linuxarm32debug.zip",
        sha256 = "15d293e90ac1dc4e5bee0a5ea57733e84f910510d1c7e55f8a754ad09faa3a7e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.3/halsim_ws_server-2023.4.3-linuxarm64debug.zip",
        sha256 = "7654ddc09cd2abdd72ee088dc8291b876a562c02a266407257f08e267d96a816",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.3/halsim_ws_server-2023.4.3-linuxx86-64debug.zip",
        sha256 = "048999c54e1345a34a7642380e7ede1ef62b7cdf056b5370ab215c413c4589bb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.3/halsim_ws_server-2023.4.3-osxuniversaldebug.zip",
        sha256 = "a9828085b472854458c4946c182c263291f60d55468709eeaca643125ef07f00",
        build_file_content = cc_library_shared,
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.3/halsim_ws_server-2023.4.3-windowsx86-64debug.zip",
        sha256 = "4c57c1287627a9112722222bdd05abb98310c0f02f3dab5b5c1524eb8d14cb3e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.3/halsim_ws_server-2023.4.3-linuxarm32staticdebug.zip",
        sha256 = "745f44138767355b9fcb1780a34fd3a8487dbe4f8acd185c58e128267bff1d8d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.3/halsim_ws_server-2023.4.3-linuxarm64staticdebug.zip",
        sha256 = "97d0e284dfec67e94c471a64e7a0330aad91705600823df3c256a6213751626a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.3/halsim_ws_server-2023.4.3-linuxx86-64staticdebug.zip",
        sha256 = "25ef9ec03f807e56fd7373a6b5e2e85a73ae83e4621bdb26a5213555e6571fac",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.3/halsim_ws_server-2023.4.3-osxuniversalstaticdebug.zip",
        sha256 = "8fcaf72f7474b4b5621a0d1cce709d6caa214f30294a9c7a5651d80328c56941",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2023.4.3/halsim_ws_server-2023.4.3-windowsx86-64staticdebug.zip",
        sha256 = "8e735b93d7cae87e4ae625fc60064e120cffbb749052f8ba0ab4d9352f8fdf4f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2023.4.3/SmartDashboard-2023.4.3-linuxx64.jar",
        sha256 = "d0dc2fc03b6b081e7afb2652cef9c634810be59f545da1fe1a317db87785ecec",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2023.4.3/SmartDashboard-2023.4.3-macx64.jar",
        sha256 = "353804472bbb448747fc7337b5e79513bc1d9c07c258a98f90a4f4a7709a2a4d",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2023.4.3/SmartDashboard-2023.4.3-winx64.jar",
        sha256 = "8d15e240fb19d41b13dd8cbf74aaf43e3d5ac2fbfc71f4421c1142c6b728ed3c",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2023.4.3/PathWeaver-2023.4.3-linuxarm32.jar",
        sha256 = "e930c97316b616340ec2e7c28a408e63c96c3af1f7705729ee844c353bb3935b",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2023.4.3/PathWeaver-2023.4.3-linuxarm64.jar",
        sha256 = "2ff48c9dd7fe46c01019c4cae2dae69cd57e2b822139dbaad462bb586198999d",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2023.4.3/PathWeaver-2023.4.3-linuxx64.jar",
        sha256 = "fde9c823359121e307287989512285f41930cba5a11d533255b6d26ed3418537",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2023.4.3/PathWeaver-2023.4.3-macx64.jar",
        sha256 = "80f109738c6efbe3e4ad11096686822cc5bdd316818467b7000a3f8907b26315",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2023.4.3/PathWeaver-2023.4.3-winx64.jar",
        sha256 = "4419008ee8badc6aa269388d13ca24d32321a90aa3eff9f5ee9ed0e9bef69470",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2023.4.3/RobotBuilder-2023.4.3.jar",
        sha256 = "84be207c4afacf24254a0961f28a367883025371fecf954eee4c2fd2580a2524",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.4.3/Shuffleboard-2023.4.3-linuxarm32.jar",
        sha256 = "4de53ff09d05954ae8b060768b2b7ebc0d6fe74767680e17b1d23b2b74e007c8",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.4.3/Shuffleboard-2023.4.3-linuxarm64.jar",
        sha256 = "cc015e57c9f40da6eba4f4be1078f03350edff7b298196e3c0e8d7dfa9bca1b7",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.4.3/Shuffleboard-2023.4.3-linuxx64.jar",
        sha256 = "6f11e18641ee4dd79c91ac39ec95752e6ba437e19ebb87f67e5a225ab9c35884",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.4.3/Shuffleboard-2023.4.3-macarm64.jar",
        sha256 = "da577338f0201379d5372b825897d338f6c71ff49e7c62f932476266496d086a",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.4.3/Shuffleboard-2023.4.3-macx64.jar",
        sha256 = "7841a4ee1a451e7e14effcdd79eb222ee129913ea01f17610fb57862b79c272c",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2023.4.3/Shuffleboard-2023.4.3-winx64.jar",
        sha256 = "3baaab6c94cf8bc91208ab4b4b280f50e3edc5e17025b4893e698c6487ed732a",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2023.4.3/Glass-2023.4.3-linuxarm32.zip",
        sha256 = "9e2d8bbf0a10b229f4faf142d015e29a7f137de5df3f08993186e91d567ae8df",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2023.4.3/Glass-2023.4.3-linuxarm64.zip",
        sha256 = "1ef9c3955c867f4f3276363e05d030ef818b8e202436017f0f300e5d97346ec7",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2023.4.3/Glass-2023.4.3-linuxx86-64.zip",
        sha256 = "e530d17dd1008992b519216465cb3dc287a5bee2b0bcf3af73320608148f0135",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2023.4.3/Glass-2023.4.3-osxuniversal.zip",
        sha256 = "e0d9949ba31fa5b50e22a689681456d89f1d0620704b885cd118d2a2747a02a4",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2023.4.3/Glass-2023.4.3-windowsx86-64.zip",
        sha256 = "4473f56cea154ffe58dc4559a059f42f2954db10bf207f664cdf66bc02e4673a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2023.4.3/OutlineViewer-2023.4.3-linuxarm32.zip",
        sha256 = "01dc83bd85a400c55820f4b874acf0a5ebc44f56602638259c2d986366f44b32",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2023.4.3/OutlineViewer-2023.4.3-linuxarm64.zip",
        sha256 = "d842acc4202fce9187feb634e3e7212f29da1cb41ad88af1e88e7c0c6e2e46d8",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2023.4.3/OutlineViewer-2023.4.3-linuxx86-64.zip",
        sha256 = "d56fd2b5a77e7c55adb21c68e93225dc3bad291d7885cda0a08ad0b4d2162f4d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2023.4.3/OutlineViewer-2023.4.3-osxuniversal.zip",
        sha256 = "9775f1dc43bb1dea62e16bf264c3f8c4f0a6498807fd4e6adebb0ed0116b190d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2023.4.3/OutlineViewer-2023.4.3-windowsx86-64.zip",
        sha256 = "9d955f1f99c8b3c9c1d2c2c0d35bf468abc258012da9d1b3e3665d898b0e40bc",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2023.4.3/roboRIOTeamNumberSetter-2023.4.3-linuxarm32.zip",
        sha256 = "6ed7051a04e0c2ee4a291377cd6dbfb46d21a818e5e56a7d01d14f596ffcdd30",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2023.4.3/roboRIOTeamNumberSetter-2023.4.3-linuxarm64.zip",
        sha256 = "d505c09723de6bce770c5adfb4d3816c3bdb6b32075385554350cef37b339425",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2023.4.3/roboRIOTeamNumberSetter-2023.4.3-linuxx86-64.zip",
        sha256 = "0a238760cda189b1426f55d87ac5343849b323abe1f978748850b1d9e57505c6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2023.4.3/roboRIOTeamNumberSetter-2023.4.3-osxuniversal.zip",
        sha256 = "450698a395fe840c1f9f15ca1f31380d6b5223113683d60c7df970687ddaf5e6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2023.4.3/roboRIOTeamNumberSetter-2023.4.3-windowsx86-64.zip",
        sha256 = "1b1352bd7f0e0aa8d9627318dafc3f184d2ce380aedf0ebcbbc83dbf9377990b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2023.4.3/DataLogTool-2023.4.3-linuxarm32.zip",
        sha256 = "ce40397ed16505a64d928c7e102555587cd2a019b431e714dca0483509d59351",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2023.4.3/DataLogTool-2023.4.3-linuxarm64.zip",
        sha256 = "633f84835fd7aeed12ac1f09f64fef2e244fd9d31ee5de9f96e14f568007aa15",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2023.4.3/DataLogTool-2023.4.3-linuxx86-64.zip",
        sha256 = "16b948979341c851a472a346fabdddbe606df7b2363696af748c0e032d0d4082",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2023.4.3/DataLogTool-2023.4.3-osxuniversal.zip",
        sha256 = "9b8467770af2f874fd71f20aa56cdbcbb02d93d3956ca3a1c96ce535cb175094",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2023.4.3/DataLogTool-2023.4.3-windowsx86-64.zip",
        sha256 = "b0f8b489c196116f0119f5dddf15b8bf98b6d334c4756a804c02389fdebaa959",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2023.4.3/SysId-2023.4.3-linuxx86-64.zip",
        sha256 = "75963216f1a0b55955509225d397e1ce3cb5d9fd7bad6f28bce56c7438dce8fb",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2023.4.3/SysId-2023.4.3-osxuniversal.zip",
        sha256 = "9d4b16cf84be27c12c189888980dc6b29546f7def7ddfa42a74ad409c694ffc3",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2023.4.3/SysId-2023.4.3-windowsx86-64.zip",
        sha256 = "c588713a5f3e163d78d9e267784de984bf6e5b0491cb2068f90fdf61050824f7",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
