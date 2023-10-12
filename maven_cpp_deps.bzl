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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-1/wpiutil-cpp-2024.1.1-beta-1-headers.zip",
        sha256 = "55bd831d8a7081b82fb1d701cb3488912a4009256745c00aa3d8400408ecccac",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-1/wpiutil-cpp-2024.1.1-beta-1-sources.zip",
        sha256 = "59894c941ade187e7ce11c4fb10630b2d90c396124b3d5b62e6045c409d94031",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-1/wpiutil-cpp-2024.1.1-beta-1-linuxarm32.zip",
        sha256 = "2fa64eb011dc3a65cbcd165f48a55d78fc0e0382035b64b3cfda5e0cc583d864",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-1/wpiutil-cpp-2024.1.1-beta-1-linuxarm64.zip",
        sha256 = "ea2445ab0925961fd28be4f46e455f6ad12d5679fd0b2a09c5e9011f21df3753",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-1/wpiutil-cpp-2024.1.1-beta-1-linuxx86-64.zip",
        sha256 = "35a93404504c2f704d5253f780c47a45a248a235c10fe3f9a0ad878eeaaa25e9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-1/wpiutil-cpp-2024.1.1-beta-1-osxuniversal.zip",
        sha256 = "8736f54705f7675f4f92f5968e784c5f5508de4bd367b909d1d55a3d16ccb40d",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-1/wpiutil-cpp-2024.1.1-beta-1-windowsx86-64.zip",
        sha256 = "465bae06cfae29fa2c92e4182aee55ead95f16aa21b580edd8edd59f5f6c1052",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-1/wpiutil-cpp-2024.1.1-beta-1-linuxarm32static.zip",
        sha256 = "be59615d2017dfdb3b7e1ebeb1d519a1d12ad7de24ee5ff76f98fb3ba8997a4f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-1/wpiutil-cpp-2024.1.1-beta-1-linuxarm64static.zip",
        sha256 = "0284aca5bb4f65cc7aa182815a6dc8b91cfcf6e6163b54600d040fb7dc0e8a7c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-1/wpiutil-cpp-2024.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "e26b47a53a91e503d1d19d8cceac5b5c78d691b2020b911c4d80f728a042ff4a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-1/wpiutil-cpp-2024.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "1b85184c4205c27808616bf4ce0efca0d747450fa45fcc847c3963ab32435c10",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-1/wpiutil-cpp-2024.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "2312ace51928c251af3ac84ecce1e24d2dfec5c663ebd271cf20266599507c14",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-1/wpiutil-cpp-2024.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "82deff939e2e99f888e53ebf1b939145a37cc0ec166ffeafddd9a4ae8a9410b0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-1/wpiutil-cpp-2024.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "a561a6df2b1a34d424e92062126bf79f1b3460455cd7e7c5fa23cb0dbc8d0cd1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-1/wpiutil-cpp-2024.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "1e499ea4a987ba4b692a30c3c9edbc9dfa0975fd7a87f730ac65cc7af2f20f91",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-1/wpiutil-cpp-2024.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "f8023eeabf82f838dc063cfebf2de7d28cd0723de6d8bd8f439070055d2cd630",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-1/wpiutil-cpp-2024.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "421614c9beeb6bb488944e3217f4a0790c22f76c4c8a3e53aa81be19eb1d784d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-1/wpiutil-cpp-2024.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "98c14539f59f30ccd2adbff67cd35ef2d0cccaeca5c5d3f754e194bd15ff17dd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-1/wpiutil-cpp-2024.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "94a2c7e28c8ebd45c8ba48dc6604d9d7947cecad2e797d3f890ffe78fd1d6975",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-1/wpiutil-cpp-2024.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "d2f8b65e0d1d51ce9e2fbefc21c53ccf0f106c6d49e51d2d2c7c5bb7cf5fcb67",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-1/wpiutil-cpp-2024.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "431aacd491f5bea5129426c709ce31978302cf27aba23354e59f53bf62cff02f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-1/wpiutil-cpp-2024.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "a8a2e40367e324c847cffd2823e22cf7eda4415e201cab10c540a65eb2b1a858",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-1/wpiutil-cpp-2024.1.1-beta-1-linuxathena.zip",
        sha256 = "e5388064ece22db4e0494a3c4ea5d0f662109faf8bf5997a0acc665a39220483",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-1/wpiutil-cpp-2024.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "fdee19661863d7efc9f3428d33d9a78ed53dc1633b311f8833c8e99450c2cd0c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-1/wpiutil-cpp-2024.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "51756d882d0f99a887b6879196ea98321df36095c648387e62e6d93504e624e2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2024.1.1-beta-1/wpiutil-cpp-2024.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "2cf42ec0948377316a09ad83c1471cc172d34a3647035da84cafeaa155651717",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-1/wpinet-cpp-2024.1.1-beta-1-headers.zip",
        sha256 = "a225b615345b6905aa7961dd2a63fc11a161b37a0565ebf81ab61b98d8f2492f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-1/wpinet-cpp-2024.1.1-beta-1-sources.zip",
        sha256 = "b522b54ac8f14d05fc29c5c038c79d21957d4cd436941ee0c92acb563cf66106",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-1/wpinet-cpp-2024.1.1-beta-1-linuxarm32.zip",
        sha256 = "88800c8bbb41cd4305cd7957c1fe54b7f7bfd6925132e2481ea108e75c034092",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-1/wpinet-cpp-2024.1.1-beta-1-linuxarm64.zip",
        sha256 = "4a6f6fbc412b8f9f78a58fd3c7a764f6170e9562600e38c25bad9d0667d52220",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-1/wpinet-cpp-2024.1.1-beta-1-linuxx86-64.zip",
        sha256 = "78698cffb13813c0eaf7af50a67bb2e0f875ea472024cb5aaa9cf163ead9a66a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-1/wpinet-cpp-2024.1.1-beta-1-osxuniversal.zip",
        sha256 = "d60488e8e3ad27ea2ff06c7d804eb3a29a7e938e4d85b86e41cc3f58fee0c416",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-1/wpinet-cpp-2024.1.1-beta-1-windowsx86-64.zip",
        sha256 = "fadf2d5d21877d7dcc3d21222eb8581df07b7b777af009579945976a579b9493",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-1/wpinet-cpp-2024.1.1-beta-1-linuxarm32static.zip",
        sha256 = "41697be4725fbaa1477ee52c136d78d4c9085d0958aef97adb965bceb47681eb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-1/wpinet-cpp-2024.1.1-beta-1-linuxarm64static.zip",
        sha256 = "14bc9fa84710f10317d6832d7489f8dd1f5d7125420a68da5f155acd3569a0d9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-1/wpinet-cpp-2024.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "2846e0e9a5783d19809fe5044741bc19d5c3e347bfed57ea35596d2af3630571",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-1/wpinet-cpp-2024.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "6319f34e0a7007d1a939cce207ec08411ddc9c5f1002bffc244eba8766afe40c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-1/wpinet-cpp-2024.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "e6651874141fb9843bace2eca08301e96ac7c1f19d1ceb45935a684763f685a3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-1/wpinet-cpp-2024.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "b3a417dd0584c366780de889bbab77d46ca10e34c3c203be839e0f28aab5418e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-1/wpinet-cpp-2024.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "babbf6eff522d074263b279dbe825280cb96ab890c165062d6b3a3d8c6fe231e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-1/wpinet-cpp-2024.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "7e4af09a49a9360bdfd08849f9e5e0ebbb7fc356b58439826d143fccb1b3ac60",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-1/wpinet-cpp-2024.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "6bd1a5355cd379abf4cd70481c31436064b248567e9c6f2f5176e8ed2a7ecaf2",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-1/wpinet-cpp-2024.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "eafdd949fb90953605d235df49a801b57025bc59e438b393accc3bdb9a278e76",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-1/wpinet-cpp-2024.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "1a4db3b9a6b4ed52a61c0c3b1139386fc1e2982990d24e230f591e8fa7db5ffd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-1/wpinet-cpp-2024.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "13f183fe2d429b7a095cedc7072b7a5e63cf29c23e6813652bd1bd6c7635642e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-1/wpinet-cpp-2024.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "262b71c6010ab61df285736c74b0f8ce303fc6e2e77906b1b0b2013ad494017d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-1/wpinet-cpp-2024.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "216cab29eaa433c2bd5b1a36fd9fc503bf69557d8abafd47a2d7059d85d36650",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-1/wpinet-cpp-2024.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "17163e301756eabed98cca993c153edf7149f06b80790e1c47fe21be6d16af4d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-1/wpinet-cpp-2024.1.1-beta-1-linuxathena.zip",
        sha256 = "addf100dcb6a9ce7318999b2d2cda307fd0b6bced544da6903a5859a1cc61644",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-1/wpinet-cpp-2024.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "fb02f4d40c768dc347a9c391282d17cc6dca322cdd38b1df64317d49cd17b3ad",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-1/wpinet-cpp-2024.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "85c02f300d8462b5486fad5a019d45cc3e53b20c6f0c0c0f3737515900c2b0d1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2024.1.1-beta-1/wpinet-cpp-2024.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "0328c05855babf742bffe38b30bad2c74947ac7dd392dace581c7b5caff31bb2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-1/wpimath-cpp-2024.1.1-beta-1-headers.zip",
        sha256 = "e40a5661e7e5dd27ad5301b143dcc4666560e99b873c7ede75386c1a550e49dd",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-1/wpimath-cpp-2024.1.1-beta-1-sources.zip",
        sha256 = "a9cbfe1d4224f0b4b6f2803fd3a553fb3edbae613b8c489c36758cc9bf1be60d",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-1/wpimath-cpp-2024.1.1-beta-1-linuxarm32.zip",
        sha256 = "7c3f1d22574b61427d3c4de30a9dc5d1a3af3ed5b08b298d1169249f83e2efeb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-1/wpimath-cpp-2024.1.1-beta-1-linuxarm64.zip",
        sha256 = "babe35a1ad0702e5b44a3dfcdb9a16b6b9846d7a008182ca7d181c0d08281de0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-1/wpimath-cpp-2024.1.1-beta-1-linuxx86-64.zip",
        sha256 = "44a40ac0b64a1f35c92521d9b10bd9ef4ad6f905a4472fb4f350cd66efa69967",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-1/wpimath-cpp-2024.1.1-beta-1-osxuniversal.zip",
        sha256 = "a419e0d3d0861a44596b0bae2b7d700d7b3af1403ae754733d428974591c7ba2",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-1/wpimath-cpp-2024.1.1-beta-1-windowsx86-64.zip",
        sha256 = "7c61e8708a0aa306ac52ab6ea35c13f927f02d5fa1574a06b3e1b9172e3b6619",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-1/wpimath-cpp-2024.1.1-beta-1-linuxarm32static.zip",
        sha256 = "ca8f6be8ba385b67a53c0526bece85c7f4e04352fde56c937b5f9da18046b5e7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-1/wpimath-cpp-2024.1.1-beta-1-linuxarm64static.zip",
        sha256 = "6ee249dee7325aa5507a39be7364eff10027de4b2129a5120ba8158408abb3fb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-1/wpimath-cpp-2024.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "eeb44a9ad0b98b879e5ffab86ff521c48662ae1b47b7dc3558ebdc0a740ccd91",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-1/wpimath-cpp-2024.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "1f1e9bd3ebd8656add224bb4c04f84b57910cc4d87ed2d31918416d1a89bc972",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-1/wpimath-cpp-2024.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "ee11bb129c299fa061794f97318e72d8ff5b9932c9834228e54dc2460504eb54",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-1/wpimath-cpp-2024.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "769af6a3d457a8e2b0bb29725cc4e37b3ee19f4402f3b7612d255e5ba95d6857",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-1/wpimath-cpp-2024.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "036897635b18160cbec0510f0b85c1f8af7e1bde217ce1bdae9689932f04386c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-1/wpimath-cpp-2024.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "badad8fbdfea8e61624b52b88697087cd0f8b42823c8b59e6d8d282a73743e74",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-1/wpimath-cpp-2024.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "a83a854c8a3d6c1e6613c36621595c6ccfcc6a3bdef091088161157bbeb4aff1",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-1/wpimath-cpp-2024.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "99daf63e06a55e3ecd4ac2ddaeaf3af14c226ef97d75353f186b690c5cc3aea1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-1/wpimath-cpp-2024.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "169fec2cbfc976d0fca12f1588fcdb58241909911037367682de2202d72f3cd4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-1/wpimath-cpp-2024.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "eb2eb783ff1c5d9690ad4891b58e17f51268627cfc1290ba1e03af0aa8382b95",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-1/wpimath-cpp-2024.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "aef3c84fa1d5a7fa7a89986f2151017efe538e281d68566f67d997f1e2fc3eff",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-1/wpimath-cpp-2024.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "bd2aeee885c1651be90216b68f5e6e6a94a1c80c811b62700ac821fd45629455",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-1/wpimath-cpp-2024.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "403b8e5b17ee76f09f22db098b773fb869a9ce6d0b41436d093fa26b300751b0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-1/wpimath-cpp-2024.1.1-beta-1-linuxathena.zip",
        sha256 = "04f96e64f85b93216bd73d9d8d88d9a4769a51c549d459ca21464c7271b8bfd2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-1/wpimath-cpp-2024.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "7afcf5b8957ae395dc19e35aea07966caebcf8e7e7115ba5fad8a9c1bdb60fc1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-1/wpimath-cpp-2024.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "6ddf8b553613112782e381815b7d309916a6b1641777138d91c206fa83001b36",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2024.1.1-beta-1/wpimath-cpp-2024.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "e369ec5c97163a05c7c1c13780500f24a830198e66e3a85cdcad844818287f49",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-1/apriltag-cpp-2024.1.1-beta-1-headers.zip",
        sha256 = "de04e6c3a774cb064417d135f90cdc906434c6a98798e5a8dcc427ca189b6f66",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-1/apriltag-cpp-2024.1.1-beta-1-sources.zip",
        sha256 = "6f167bd3d279f223db922fd8cbf7ad917d68c8588608abcb2ddc7e9ce783e39d",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-1/apriltag-cpp-2024.1.1-beta-1-linuxarm32.zip",
        sha256 = "dccf2986bf6839e41edbd65d93c7dd78cf106adc97480f896dcab115d2dcb072",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-1/apriltag-cpp-2024.1.1-beta-1-linuxarm64.zip",
        sha256 = "687d6d68bf82031d1a28377de7cb7e37e009809e9d6b3dcba329d7bedfd03110",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-1/apriltag-cpp-2024.1.1-beta-1-linuxx86-64.zip",
        sha256 = "beaa77e9bcc2477347f2f7f9c6d194610e5812d05811c7d302570c174ababff5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-1/apriltag-cpp-2024.1.1-beta-1-osxuniversal.zip",
        sha256 = "6d7a3dd9ba099b7e6600e75d190ef53aed03c805192f2df3f454f8aac992f716",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-1/apriltag-cpp-2024.1.1-beta-1-windowsx86-64.zip",
        sha256 = "e202526a8e0096e04376ce0505760f4636643dd042bab0b07f0ef26433148039",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-1/apriltag-cpp-2024.1.1-beta-1-linuxarm32static.zip",
        sha256 = "401b751a4b324fa34095316d9cade219a595796ea89e835e263c9f8023eb942e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-1/apriltag-cpp-2024.1.1-beta-1-linuxarm64static.zip",
        sha256 = "7667d305427022d2fc860a6cf43539afdcfed7ad966529dc0ecf26fdb3a3250b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-1/apriltag-cpp-2024.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "287f2455b9c64983b62840cb1935389bde8d91e6e041b5eabe78aef1dc080a7f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-1/apriltag-cpp-2024.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "0fbecab3ca241783de66d6d4bf60bc6d4668b17100502b886694f2bc9d7e09e3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-1/apriltag-cpp-2024.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "d4d7e306f5aacea81540d70020cd8bfdc55aeb9a6858b9f6638c630c0b6378b9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-1/apriltag-cpp-2024.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "497806bd58da6b6fcbdfa7bcfd862cda65e5a76d199f8e4db4a98d0a09f70b35",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-1/apriltag-cpp-2024.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "7627091e6ca0acc1b3110b736c2d8b19fdb2cfb28cc28eb3ce66e7f645dd76e1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-1/apriltag-cpp-2024.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "f69a08c7398c62dade9d0e75043ce76f2d61146b79e1db1dfda48194b6a9e9d5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-1/apriltag-cpp-2024.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "5d0be613b15f92e06bb98b90f8b67b3fe8bacca85f851dfd6e60f803d216344a",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-1/apriltag-cpp-2024.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "5f6060d628ea6c7993c45b8f4ae1f54219449fb61fa411c52b0007a7583bd724",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-1/apriltag-cpp-2024.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "e287f655dbe3584e3ef2593920822034869a4949e440abf53bbd8c7b9cd169ca",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-1/apriltag-cpp-2024.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "00e04a476417bf9a553d6537bcdb4cec20e3b2dfa9b656c2df9bb2f2bb1c273c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-1/apriltag-cpp-2024.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "636e571b33a7066e8155930e105d38d41de435fc6bff6c99e9269a974037193e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-1/apriltag-cpp-2024.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "39e73576cb4b14e55d2fb992f62258035f26807abd092d88e42e4ea2bbde8af6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-1/apriltag-cpp-2024.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "56769caf677c595af5ee819a3989162e33188794ad9ae26acd8765b534a62df5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-1/apriltag-cpp-2024.1.1-beta-1-linuxathena.zip",
        sha256 = "778d83dea6560c9859c5c36ba99cedb44b4d7951adf7d93fe9477690844c9614",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-1/apriltag-cpp-2024.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "479f07c49a9f17a3fa383aa6aeacad9a3ed7ec78c8c307c486d1942526060711",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-1/apriltag-cpp-2024.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "edc3c93e1e196b51ce5227306fb9092dc16dcb9b6e55362a5c1d46078d444260",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2024.1.1-beta-1/apriltag-cpp-2024.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "4c0aed22e5eef4e5ed24c0e86cadfd563fa2646a45c239639ff257daa878f019",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-1/hal-cpp-2024.1.1-beta-1-headers.zip",
        sha256 = "2719d82da5816d20d66bf113cc73fc8417b8d0ab4ff4b691e296d30c5b617bdc",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-1/hal-cpp-2024.1.1-beta-1-sources.zip",
        sha256 = "ad55111a1f9594f3477240753e5b9d49c17b7bdb1cfb73ef380273efdb0d7af7",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-1/hal-cpp-2024.1.1-beta-1-linuxarm32.zip",
        sha256 = "a4e5c4126291e821ccd203808c1fc580219dda76617220d86140ad1d1c5032bf",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-1/hal-cpp-2024.1.1-beta-1-linuxarm64.zip",
        sha256 = "a22d1c00ee8ea7de7251906d4d53abc21866a27a7fc11e72a9e00d0864fdd901",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-1/hal-cpp-2024.1.1-beta-1-linuxx86-64.zip",
        sha256 = "37e21d09ddf73ad1e37f4e8700573011837e7ca0bb3c25eaa6a6a8ab324bb26c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-1/hal-cpp-2024.1.1-beta-1-osxuniversal.zip",
        sha256 = "29e95b33ac364416a28536e68e24edd7dad5144fb4e750225d13794fbd1b6acd",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-1/hal-cpp-2024.1.1-beta-1-windowsx86-64.zip",
        sha256 = "d0c51de8a64c0d52ba8dfa58b07b70790992923855aa1dd004866e63c607b6ef",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-1/hal-cpp-2024.1.1-beta-1-linuxarm32static.zip",
        sha256 = "e38b1b7594c76b974b30a29952f132ffa599793f6a63fdd3894bebfa7799af99",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-1/hal-cpp-2024.1.1-beta-1-linuxarm64static.zip",
        sha256 = "b48a6f618b60fbb427c4e0038576cde0f80e74c700cc3afe25fedcc22ded5b6c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-1/hal-cpp-2024.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "21a4fc33ebc35a82710d82851451100c8a6de8a5472bdfebebe36cd9241d50fc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-1/hal-cpp-2024.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "5295d79aa16b741fb128a9a8e596d82cf03194c4a89dc3852cc840141dad490b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-1/hal-cpp-2024.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "40b90791016e9ae1c8f8747e08653977cf22aebceb1e0e2b7e6bb5bb16e1bca1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-1/hal-cpp-2024.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "86f8133702d909db066b89ce6f387d6bf462401c76b1eec51c742f2bdd22df2b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-1/hal-cpp-2024.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "85f8d85eaba71b0c6f6b612c80591ec8d31a952c1c1119dcd40834c0ce83d8ef",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-1/hal-cpp-2024.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "fa5f145cdb666eaf8492341d2f68c4a6c827cc156b6e3b0d77e02b6067182ca3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-1/hal-cpp-2024.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "c02abd17c2f457542fcd7c610e41fa3fb350efd69f8f71ee708d0d215a1230a3",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-1/hal-cpp-2024.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "eb5aa045b7c391f2b5c4b64e6909a6be80782fd3e0f5782d44152f778477aa00",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-1/hal-cpp-2024.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "10df9f61e362b5939cd925c80cc15d518adb3f1577de90e69a2042f4db0c0729",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-1/hal-cpp-2024.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "9dd8f03da93247da281184744c9520887b4b860d3ce95316cf3e80019f614cdd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-1/hal-cpp-2024.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "bd2deed32f86978125f854e5df4207acf5067729a0913a736cc9abcf954ab979",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-1/hal-cpp-2024.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "cd6a3921b25e4706ad4de48e07a42c2c7e2cfe901bcaaee77ed9dfda7a22f319",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-1/hal-cpp-2024.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "1599a1400797f499912bf02f75f8a9ea7dae70ac89bb4cf0f0dfe28ae729af72",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-1/hal-cpp-2024.1.1-beta-1-linuxathena.zip",
        sha256 = "5a41704e7b10fec5e66608c1ab074eae8e62bf223f7e5f73c2e8749b0c75dcd4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-1/hal-cpp-2024.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "175f362bcdc78ab50157a5c6e4d5ed57a22217b047936d83c2cf67833553d2c6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-1/hal-cpp-2024.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "0983b5f15343f5c592a40f43dbd2a2ea161cc0f858c0b697905d982a5dcf8e35",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2024.1.1-beta-1/hal-cpp-2024.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "74b8b2e24d5f925ec1b6982e9b216e2a37657346a47c5fe0d27df1b6659ab42c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-1/ntcore-cpp-2024.1.1-beta-1-headers.zip",
        sha256 = "96c3e92da48b1d267a39f3bd21c3363d5469daa3e8f8314df7d870bc69ffc7c7",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-1/ntcore-cpp-2024.1.1-beta-1-sources.zip",
        sha256 = "9c90403b165c65180348cd2030ddf4fd91bb26aa98ee9e5e1063efd93c3bc270",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-1/ntcore-cpp-2024.1.1-beta-1-linuxarm32.zip",
        sha256 = "034bf58881177c2b2b01e1dfec9403e4220eb4a86a591036abda6288d1eefa9e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-1/ntcore-cpp-2024.1.1-beta-1-linuxarm64.zip",
        sha256 = "4053cd5d224b1117b87822c3ad7dae4065769c1f3df7f59192b7089c5c51dbb5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-1/ntcore-cpp-2024.1.1-beta-1-linuxx86-64.zip",
        sha256 = "36be50967db769a028bbec23745b8d6ab62161db337b1b7ebf22e6a98f7bb92c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-1/ntcore-cpp-2024.1.1-beta-1-osxuniversal.zip",
        sha256 = "7f6407adbba4e113658a347ed252aa91ea97ea2a65a45c7a1917d40295d7f8de",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-1/ntcore-cpp-2024.1.1-beta-1-windowsx86-64.zip",
        sha256 = "f82648412a4cee42804f1bfef3718b9ba30a417b4137d9adeff6ee3952cdf7e9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-1/ntcore-cpp-2024.1.1-beta-1-linuxarm32static.zip",
        sha256 = "76eeb414fede524569672f1a7b08ebcb5c01a681c9455c6b4b2ce77e5a3f59bb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-1/ntcore-cpp-2024.1.1-beta-1-linuxarm64static.zip",
        sha256 = "01cb30cab48aee700a2add7ab83a27363839dee57de9e152e2cfab831fa49c2a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-1/ntcore-cpp-2024.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "e514441199624527fc2205d56d0278c494bc95be197d5aeadd59f15cbe12badd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-1/ntcore-cpp-2024.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "5e0262c232c5982f40a687280222a00576431584f11c1ba652f3a9cc8bd3f764",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-1/ntcore-cpp-2024.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "cbd67d63285082e91845a5d63c5faa8af3f14269cba8e921663e3ee435e52aa6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-1/ntcore-cpp-2024.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "c7e02a2bfbd7937870e8a66f9bf5b35f4a5d6aad7c3a4d6bb137ceb8b511b9cf",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-1/ntcore-cpp-2024.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "3893c185a43285562d0c00606999034121e6e4d77e6f425f4078a6e9f8245e82",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-1/ntcore-cpp-2024.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "4752daa9e1257b7da0ebf724647e8aea0057c963139a1728df4fa4962d573c6c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-1/ntcore-cpp-2024.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "2796f918969cb5dc851b75f0c9b51fcffef68781108c867afc7f53dc90a17ee2",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-1/ntcore-cpp-2024.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "710897d171ec6a2a39260cf35079c3965379c3eb73a16ea94c53ba7748985026",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-1/ntcore-cpp-2024.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "d446c6fb97bfb9a6e2dd623956411b5ca50d6bc61545dac973e9f9339676daad",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-1/ntcore-cpp-2024.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "6c71d0d29427d0f94dde87b85320079c5d53f27d3a90dffeee1b188f8790968a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-1/ntcore-cpp-2024.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "ddd565b825110fe09ef5fdefecf3e11c9d7d2fb8a52ee69c8584ff70a61e8ac7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-1/ntcore-cpp-2024.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "d223670c44d8c6872af04e619f25dd0d5bd84430d7c69f9bb80c6b0fab4d7aab",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-1/ntcore-cpp-2024.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "73e2500385768a1dfaf9089121109875eed8671124350073c0a8a2d021b0c2b5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-1/ntcore-cpp-2024.1.1-beta-1-linuxathena.zip",
        sha256 = "5885197c14444ba463260065b09d0f15c69c3d780da7d073c29a322815705b09",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-1/ntcore-cpp-2024.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "49fcfbe0ad3656b30fb4db0d514f440dfe9cf4a319e40cd65316f46bb1c30520",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-1/ntcore-cpp-2024.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "16add34672e77b67ad3dd1a3a560a6ecf4daa4599db42b2ae456d61c755497df",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2024.1.1-beta-1/ntcore-cpp-2024.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "5b5ddafc4f042beb9f62179745c850fb1730db6e6dbfb2e433f2ae17d1e05b7e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-1/cscore-cpp-2024.1.1-beta-1-headers.zip",
        sha256 = "4de137c5b8eb15508a62f4972fc482632f4d8a7ff587f5365afb6901858eb81c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-1/cscore-cpp-2024.1.1-beta-1-sources.zip",
        sha256 = "47f47b73dfb9c3763456a63776a8d9a5e15b334a5f3d46b2879858c18e89f119",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-1/cscore-cpp-2024.1.1-beta-1-linuxarm32.zip",
        sha256 = "221e7b03bcf4e3945997131dfd23b1d105af3b77ab65a8e3a31f607753a32015",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-1/cscore-cpp-2024.1.1-beta-1-linuxarm64.zip",
        sha256 = "11205a51c9c7baad18bb42d060995cf9459b8b982486da826fe05b27edf271ec",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-1/cscore-cpp-2024.1.1-beta-1-linuxx86-64.zip",
        sha256 = "8843a8ed4f411819bd3ec8adbf2f47c72aa4d2bd68edb561160a234028910f8d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-1/cscore-cpp-2024.1.1-beta-1-osxuniversal.zip",
        sha256 = "35bec47127c3d3a0eefe21f61786bdd06348f2d918ad0c697c8b9aaae6c01494",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-1/cscore-cpp-2024.1.1-beta-1-windowsx86-64.zip",
        sha256 = "72ab0adb8ee176f672596f58a8d86d749e8454cdc4c7f14530c6af88637c5c6a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-1/cscore-cpp-2024.1.1-beta-1-linuxarm32static.zip",
        sha256 = "33ad6a965d556b005677425b6adbd8dd7b4421c584b70224126d1322e369a746",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-1/cscore-cpp-2024.1.1-beta-1-linuxarm64static.zip",
        sha256 = "5c9683bbba11ba8d99a37b41e2c63255bdaea50f33c3961bee0fe1b33f34e2cb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-1/cscore-cpp-2024.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "c86c854af0ca5e29a0df610687b1a9a3f93f09275357a0dc643511fb86ca9cda",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-1/cscore-cpp-2024.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "353d92c7311455bd1f51ea003d55aab4f54c9029e0bc14c8e244d136a701fe48",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-1/cscore-cpp-2024.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "5c66c9e171d33b85979bb131fb89bf48c76014b45696a9549963726d42f035e9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-1/cscore-cpp-2024.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "8d9a3e242d3ad383e04b8197591b5a81ea36a0116437371e07fc6fceb227470b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-1/cscore-cpp-2024.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "b323a1b0677903f81214d466a1b55ad805f5720f0f68d3647706ae2c2d138843",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-1/cscore-cpp-2024.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "57b8607167b1d647b4653b8fe59bdfed51721c05764bc15259cd2823d56d7264",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-1/cscore-cpp-2024.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "a08719a9cd4d2d03ceff58e0b15e70c223838a363dbbda394d97d718f98ade1d",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-1/cscore-cpp-2024.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "de4a7bd69dcef5e6ee1842fd4c54ec60d83834089c2cdced34859cc5f81231ef",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-1/cscore-cpp-2024.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "17aa3e5ddefd9a0dc9cbbab722b7b8bfddba4d0b28837f319850adecfc8b89ac",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-1/cscore-cpp-2024.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "5ddfc8914d62dfde973cf3beab9c920e0c3af827edd64613ac9cee5b6195852c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-1/cscore-cpp-2024.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "12541ba1bb51830fc2110e2849293539648e6aa5355f85d05be16c8e25f5def9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-1/cscore-cpp-2024.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "899f8c2a753a27c89bf25ac4e9ea1c2452bf7abdbf2dec1d0544b7bd5258d12b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-1/cscore-cpp-2024.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "f830aca49386ad7975c44b2ab992501253e6a321b7cf58e6b47a7c6ce6fce2d5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-1/cscore-cpp-2024.1.1-beta-1-linuxathena.zip",
        sha256 = "0240364801218b3a4edac7c7641d54c55facdd13d5ee20aaaf7ef835dee7ce94",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-1/cscore-cpp-2024.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "02454f5d077928de11c2eb22e28e49c3e28186438601a509bc57d98e88f1bb20",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-1/cscore-cpp-2024.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "1fa61f16caedf9a9ad4a426279e93f6ee8efbf3ef6014913323353334442b00e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2024.1.1-beta-1/cscore-cpp-2024.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "dad1edcd81e58716f040c2a23f3eaecb5a76fed9d4bf1339bb68a3ef304bb120",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-1/cameraserver-cpp-2024.1.1-beta-1-headers.zip",
        sha256 = "a9e26601a181ebd17dddaf7093942226301eeafa8809e8c82f54dfbea1e28e40",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-1/cameraserver-cpp-2024.1.1-beta-1-sources.zip",
        sha256 = "9f44ab46ecfc1bb46c8017332fdba3bfb1e05b7bb001c7020294267caa83c6f4",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-1/cameraserver-cpp-2024.1.1-beta-1-linuxarm32.zip",
        sha256 = "9fa28551e7c29eebb61ba1a408d227593cf19fe2335131a8e69a8127c0e714bc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-1/cameraserver-cpp-2024.1.1-beta-1-linuxarm64.zip",
        sha256 = "46c4ae976211818e65ef25d2eadd7925b95b536e184ba7b1065084b75f2fb87e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-1/cameraserver-cpp-2024.1.1-beta-1-linuxx86-64.zip",
        sha256 = "cc4f36643355ca094e29e59e0779951430d7bfe7bc7afbacb84eab0d22aae9e3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-1/cameraserver-cpp-2024.1.1-beta-1-osxuniversal.zip",
        sha256 = "369c9446b4c461c1b3db75e60c9b2a6b9dbd044902641042d2d0b46b6214a69d",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-1/cameraserver-cpp-2024.1.1-beta-1-windowsx86-64.zip",
        sha256 = "c7c2d6c4a30ed8d0f7028e9e8829a48c421fa18461d2ef75e99d553b426dc47c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-1/cameraserver-cpp-2024.1.1-beta-1-linuxarm32static.zip",
        sha256 = "24931d83d8843137372837cd8b5403680207f8c183c11a263f19461fbcd06e5d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-1/cameraserver-cpp-2024.1.1-beta-1-linuxarm64static.zip",
        sha256 = "02884ffe7e90fcab2a1c846765ab54a60c00f4354c266d1760d5dce72c6a236b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-1/cameraserver-cpp-2024.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "576b453f337e6ebc791b50a57c5726e0b4ca1d97b39eed66f563a3c40189d4f2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-1/cameraserver-cpp-2024.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "f47f8c4fde084c8cbe42ee2655103e8d422188b060730c7facf762aaa2790811",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-1/cameraserver-cpp-2024.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "d7a7cd7a37dae0c066a4620517a399619f9719e8d515f34b5af73ead22cb5689",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-1/cameraserver-cpp-2024.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "685dabcddc2885e52d7b09da1867e8fc70fe27b311ff58f5d9a4285fd0951e8b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-1/cameraserver-cpp-2024.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "05a6852203c3dabb95b8f99a6b10fe914a3baacc390baf2f711794e12616fa23",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-1/cameraserver-cpp-2024.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "c5a66949b36a7bf91cc2a491f650bc100d2c707ee378f097c23d416cc0f9f924",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-1/cameraserver-cpp-2024.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "eba1a739a3572ff73bdf7e67b2659fedf9cfbfbb9500270638a2b2c279a7fb23",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-1/cameraserver-cpp-2024.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "ec3efa2c4b1fc326c60e75770f49fc105bc21dab67c9869cb526e5b84bd0a585",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-1/cameraserver-cpp-2024.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "fc4545ae45e18076c237da0bdf6ada113512a3413e13ef6f25c7ad39c3a04fcd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-1/cameraserver-cpp-2024.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "fc4a208ea74769713fb93e84d50a06fe9c50dda80995aef300594dcc611274e9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-1/cameraserver-cpp-2024.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "458d546663ebb0af156661805ce2a384fb4c8e5cee816648abe7de905f8f8902",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-1/cameraserver-cpp-2024.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "71a6f831a73fb96b7571d077c7cef2edfb08b8b24a4082544e8182a611fb2926",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-1/cameraserver-cpp-2024.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "571bd7fdf674a59c5f2557700a503905b90ee9946ad364873c7a57c22d5c7311",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-1/cameraserver-cpp-2024.1.1-beta-1-linuxathena.zip",
        sha256 = "5893f85ca0d0e0a7006f7ddcb608968d9ad485038fb1f698790228be9e6ab935",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-1/cameraserver-cpp-2024.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "e6d9c0387286d1c8a1920fc16c10e2c0a80465e58bcb40b4185649fdb83cebd4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-1/cameraserver-cpp-2024.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "2c3099e202e888f6841e6ef3e968ff1641a6e11d743afc547751e51e8da06d0f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2024.1.1-beta-1/cameraserver-cpp-2024.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "441ca2df0ed2020a7ba08e69b5beb550609c9fe298a9e405537dd6e48562aa82",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-1/wpilibc-cpp-2024.1.1-beta-1-headers.zip",
        sha256 = "f676a070fc5cbcbb41a5ec17c767776c26e1fa26579eba46b9a70ef9112b80e9",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-1/wpilibc-cpp-2024.1.1-beta-1-sources.zip",
        sha256 = "57856fc10cb2ff52251de84f747ab958f83cf983dfb40cf7f8b4963427ced792",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-1/wpilibc-cpp-2024.1.1-beta-1-linuxarm32.zip",
        sha256 = "c19c227350d19c5a614574a027f0d73217742af2f298bbe0c7a5e27b76dca824",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-1/wpilibc-cpp-2024.1.1-beta-1-linuxarm64.zip",
        sha256 = "9be9e727e2970a860681b7cfef253d7c02174a03276c509cb583ef6637d16025",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-1/wpilibc-cpp-2024.1.1-beta-1-linuxx86-64.zip",
        sha256 = "c18a70d9b6c0eb3932428742e8cbe9f54ddfae70d2b2deea414c76f5e78544c8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-1/wpilibc-cpp-2024.1.1-beta-1-osxuniversal.zip",
        sha256 = "9b6778316a4cc0afa5c58c67f05203ccb83d3182d620ed92b1b28b84b2a46196",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-1/wpilibc-cpp-2024.1.1-beta-1-windowsx86-64.zip",
        sha256 = "7eb3058b8cf599a4694bde181215ee5d15215a3c5aec3a37dfad134007f25b08",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-1/wpilibc-cpp-2024.1.1-beta-1-linuxarm32static.zip",
        sha256 = "9f75d8eb21152a42965c12a0bf1f3d64ef3dd3854deaa0ce6c4a38623c6ea98b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-1/wpilibc-cpp-2024.1.1-beta-1-linuxarm64static.zip",
        sha256 = "e26fe6f19bc21a1b2387a9444bf9c226b44c80b40a2ef59fb9d77b993d98058b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-1/wpilibc-cpp-2024.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "97cd6d84fa5b5db1c61641d56e9741c263c9842df96fd030089c8e0e7d360d47",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-1/wpilibc-cpp-2024.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "f7703c04f697e7463475d494aa34a53cb81c791ef09602fa4612aeac7dc8e0fe",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-1/wpilibc-cpp-2024.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "094e63df68b4938faaee78ac8e0aa8ea494dccaae0530bc49b0e8f7ed9097bf9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-1/wpilibc-cpp-2024.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "68dd0839ca43c78b8d5195f96c1b11f18bb6b0e8c919e262a53036672ad9a9fb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-1/wpilibc-cpp-2024.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "585e3f7df190ff79c8296850f1e2eccfb2bae5ae54a636107100a6a1832db368",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-1/wpilibc-cpp-2024.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "5fd38416343003671492aa652150a77fba401134881828e17543f3001d8d3272",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-1/wpilibc-cpp-2024.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "e317f28a2cbcc41a00bc1a87bae7857d83cc322176a5f0ccbae746496f9f6dcf",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-1/wpilibc-cpp-2024.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "c64ea6d6d53d8dec0d89f5be6e1547c382b48112859718cba2d66fe84d3a63cf",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-1/wpilibc-cpp-2024.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "f32f158bc72198b273b5bb279a794e800bc75a9b98913b0ea0d050c47c4bbb1d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-1/wpilibc-cpp-2024.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "0b68ab829b2663523c95e0cc2340909dd99fcf3e0f2827696f9186afe88da20c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-1/wpilibc-cpp-2024.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "a72b0ba3b3346153fe2b8224c3182d93fa55bc6accc83148ec69061a0f7ff045",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-1/wpilibc-cpp-2024.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "da5f0d9a89288148677b7c0989bcc53c9baafa099879fed5ea31c92759ec9ffb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-1/wpilibc-cpp-2024.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "2f69efa61ae53e3035fdd819c93b47f5528507fff0e45ca5fee206f04284187c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-1/wpilibc-cpp-2024.1.1-beta-1-linuxathena.zip",
        sha256 = "04cdfb89716ade89439170128095fc6a5bad316eab516d3ab7d9e69bcb9ec529",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-1/wpilibc-cpp-2024.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "f4e973f41553245c5525e74f71b6c9d8690e2d9c4abd424e6e0ea342ff20ffd1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-1/wpilibc-cpp-2024.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "1a2a4bb99d534d3e63e9a160599202e5e73f1eb0edb621b7864fdded286da9e0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2024.1.1-beta-1/wpilibc-cpp-2024.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "926d6d4d2593479c2b26d24f7338180dcdbf5343f1ecabcb67f1e875f48318f4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-1/wpilibNewCommands-cpp-2024.1.1-beta-1-headers.zip",
        sha256 = "a087682e3de7175ea083ad3bc354f1f1595edf3b628bb8fa862d63b1845ab126",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-1/wpilibNewCommands-cpp-2024.1.1-beta-1-sources.zip",
        sha256 = "ff294aeb7cf4bcc1e9ca6054061af0176cd18b8893b6074a8617880ea669a435",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-1/wpilibNewCommands-cpp-2024.1.1-beta-1-linuxarm32.zip",
        sha256 = "1f48e01efa44b9c837c9440ebf4f199c9daa6d2a567f4616c658710c9a17a6bb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-1/wpilibNewCommands-cpp-2024.1.1-beta-1-linuxarm64.zip",
        sha256 = "ab9aaee9728fb04e56953c48d4c2165a434f1af46430cc2920c2663991281670",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-1/wpilibNewCommands-cpp-2024.1.1-beta-1-linuxx86-64.zip",
        sha256 = "c3f79379445f6ffd0737d2bf3d7a3f001b8cdcfd14b8719e1b20abbb1f6618fe",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-1/wpilibNewCommands-cpp-2024.1.1-beta-1-osxuniversal.zip",
        sha256 = "7525e8b80a23ed39c3dc0b066c6876e5d3cff2cc412d4c93541c90adfe65fa87",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-1/wpilibNewCommands-cpp-2024.1.1-beta-1-windowsx86-64.zip",
        sha256 = "5d5087aa90897667c76464ba908d9592f8f7287ddcdd05b16f72abc072f30840",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-1/wpilibNewCommands-cpp-2024.1.1-beta-1-linuxarm32static.zip",
        sha256 = "f8f061b03f447ac18c1bdba863094e0d968150d84af23e1bc1cb054e82c6faf8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-1/wpilibNewCommands-cpp-2024.1.1-beta-1-linuxarm64static.zip",
        sha256 = "4685ab906e67a5d65deb1d53bf5fa99ad8b8cbef8972259fd9a48fdd5d429ba4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-1/wpilibNewCommands-cpp-2024.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "1ea63662dc9ece84aff7dc25ce276111ea34a964a2de0f0a60ff583a8479926e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-1/wpilibNewCommands-cpp-2024.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "731a7bd69922b594d6e839f899b79313b0628fe1541cca4ab81294922b9661bf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-1/wpilibNewCommands-cpp-2024.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "6b4779c3830e390f4a90b27976bb09d08cbb8fa2e976b4f81561c8b10bdd49cf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-1/wpilibNewCommands-cpp-2024.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "f65f18aef79e4de6e627225a6443b614f7bfef02dfb8dd6292780ffa7875e191",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-1/wpilibNewCommands-cpp-2024.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "a0935e3869cdbbfe3f9a9ed1ff54cd2167d15ee3bd977a38e0428370f8944662",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-1/wpilibNewCommands-cpp-2024.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "6d0728e596d2a96ec6ebeef42c485f00b96ee33fcfbfda21afcbce3b9574a1ac",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-1/wpilibNewCommands-cpp-2024.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "011cf4edccb5c979c4cd953d4a1df61fd7af47019b41c45789e1ac4852a30c20",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-1/wpilibNewCommands-cpp-2024.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "d6673a06c647c420e8511c36726d3584ba5f256e7c5a80e4140a597b95bbbd6b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-1/wpilibNewCommands-cpp-2024.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "5250bbfb7a830c680a16093401312f4afffcf51a1dc1e1d5e00401fd42b2d908",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-1/wpilibNewCommands-cpp-2024.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "a8380ed9683ea49ee698d3d156b15606a40a6d8997134a062939c4e8880780d8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-1/wpilibNewCommands-cpp-2024.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "b96a3be55e67186f2e310866ffc5169208e3d93acc269863b442e3a6a6b02949",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-1/wpilibNewCommands-cpp-2024.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "72cb0c4bc2cbe2a22913a317806c14100a0a08e0f1486c4d5cd5e91e1a4445eb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-1/wpilibNewCommands-cpp-2024.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "469fd7c9c9b3b0268cea3bfca02a1463e1d2bccc13495f268d0bab374ab8426e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-1/wpilibNewCommands-cpp-2024.1.1-beta-1-linuxathena.zip",
        sha256 = "59d47ba009276e5f7b3bee6942c15bdf651eb1c06a1f97b0f37e2aecef64e43c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-1/wpilibNewCommands-cpp-2024.1.1-beta-1-linuxathenastatic.zip",
        sha256 = "4fa2fb38810fb80dbb31477bf21b5bfd68ca8ff6f29ec6824e3b70009d84aa5f",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-1/wpilibNewCommands-cpp-2024.1.1-beta-1-linuxathenadebug.zip",
        sha256 = "c038a99eed9cd9287f8bb24c60a627954555e17f3d05f423b38b4f5e3a60809d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2024.1.1-beta-1/wpilibNewCommands-cpp-2024.1.1-beta-1-linuxathenastaticdebug.zip",
        sha256 = "b96baabe02947695d5678f9ab0d5203610d212b3de3b0bfeff1827c334aaf99a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-1/halsim_ds_socket-2024.1.1-beta-1-sources.zip",
        sha256 = "2e1755e913f3b49da0765cf026410b9eae54a5c175b9d0fb2733620377aa2854",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-1/halsim_ds_socket-2024.1.1-beta-1-linuxarm32.zip",
        sha256 = "c77c764150925bec70fdccc55a8a046ab20b4da4fe63440aa1f9359e799c4db0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-1/halsim_ds_socket-2024.1.1-beta-1-linuxarm64.zip",
        sha256 = "6a5b8afee0a0379ff9bf58db3ae609135350fda8e1c0a7c662bf2f5ac1d3e051",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-1/halsim_ds_socket-2024.1.1-beta-1-linuxx86-64.zip",
        sha256 = "16e5dd8622fb0d8ab882c8624ff731489bd12f7b8a097bffa63e57932daa797f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-1/halsim_ds_socket-2024.1.1-beta-1-osxuniversal.zip",
        sha256 = "07d44b40dab34d78622cc323db2fd6bb9a0a78e3ccc733c5309a18be02e71f43",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-1/halsim_ds_socket-2024.1.1-beta-1-windowsx86-64.zip",
        sha256 = "ddb30f630f583085f70cb5e1f00101988cf8d71b8dc1f96269ca0e65aa4f62c7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-1/halsim_ds_socket-2024.1.1-beta-1-linuxarm32static.zip",
        sha256 = "ec27da4d5631baa7840820e04ef6e6450032ca44f41ed4b44847242108689052",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-1/halsim_ds_socket-2024.1.1-beta-1-linuxarm64static.zip",
        sha256 = "aade8f4a1b1da0039a40ae0afba01f9d19a0ceca7a90d0bab08badab6897d463",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-1/halsim_ds_socket-2024.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "39d3ed5307355ccfe64c416daecb59e943f2f32530a7f5dab32c3e8b575d0a45",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-1/halsim_ds_socket-2024.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "87a4fa551be3b0a7b23dd3be2e26d0a8231efaa59d070ac28ebb1e0099d0c91a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-1/halsim_ds_socket-2024.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "2e8e549e0e4489b9b20217f749817e5e707b723fc18117f8b754ebbe313b8241",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-1/halsim_ds_socket-2024.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "7e42cdc2b39f19f5d8f424066ccbf54c2cbb2b1fc5c4ab86616198783e74fc86",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-1/halsim_ds_socket-2024.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "ca71ab72410e4c11d1b443383c46067a654d29ba07df46dd4c7fbb9d1a4f36ea",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-1/halsim_ds_socket-2024.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "95c600e5bf158e0a44298c47f183ad06917dbb0397bea1bb518254e8d4cfe0fd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-1/halsim_ds_socket-2024.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "9294ec2b392185cbcb27ed6e891503e7256e9af32c33d935299e3a4e4ada2621",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-1/halsim_ds_socket-2024.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "2e9dfde0325d2714a9e66f2b12726cf0c253d1cae303853c4469cfb4b6543d07",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-1/halsim_ds_socket-2024.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "fee2342fc4c11d9cbf6994db0a6fac9b8a07e68817f3e0754449c3d31944170d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-1/halsim_ds_socket-2024.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "7ed9ac0e880eebb33952382418eb3941b67aa6d84412e2e6ce020b640d481107",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-1/halsim_ds_socket-2024.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "f6d65071afb6c83a8378dde74dc73063184ac7de78cad0d8e366051070c5f27d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-1/halsim_ds_socket-2024.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "2bdfde95299a9389bb9d676a156ad778a37ffa83f29b27e17fd8200d2ac3c7b1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2024.1.1-beta-1/halsim_ds_socket-2024.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "0038c7967210a87a98df9b87fa69a74096b4617c2d6144694320e70865900e6d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-1/halsim_gui-2024.1.1-beta-1-sources.zip",
        sha256 = "6c777d4eeb6378c2f1a158667b6571cf37f6af488e8e91e51cff6fb9da90e1f4",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-1/halsim_gui-2024.1.1-beta-1-linuxarm32.zip",
        sha256 = "13e91a4560b8b56bb074f31098158e44908af58c6e360ecb86f25244e677ecc8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-1/halsim_gui-2024.1.1-beta-1-linuxarm64.zip",
        sha256 = "acc90e56c4a5012824921c95e2eb418c75b267f48a24f8cdb1512a23319d90e2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-1/halsim_gui-2024.1.1-beta-1-linuxx86-64.zip",
        sha256 = "7096f378668f4decbd0aa83fc81345f286656720602f948502302aed9f9cbec1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-1/halsim_gui-2024.1.1-beta-1-osxuniversal.zip",
        sha256 = "5a9afa96399f0df0bf541122a9737362eddc14bddf5e0b633bed632ce6e19302",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-1/halsim_gui-2024.1.1-beta-1-windowsx86-64.zip",
        sha256 = "227abfa7cdb901ded8ee11528af9eaebbea35e8bada21ed2235454424416a7c8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-1/halsim_gui-2024.1.1-beta-1-linuxarm32static.zip",
        sha256 = "0e547324a98ae94f1039313ad45fca604aebb047e9bba4fd2777903a86c3cc72",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-1/halsim_gui-2024.1.1-beta-1-linuxarm64static.zip",
        sha256 = "7ed333b6e222d44b37d04da2251256e6a07289f270aaeec2cd7677762ff6c20b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-1/halsim_gui-2024.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "e24b570f00160e723c20e68d8d3b93a9a1f856fa19fd5f6f94328916b15f8109",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-1/halsim_gui-2024.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "6e9966b634c09fe85bb4c3a72911d23bab25e16e0abfd69236db03462cc7a3cb",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-1/halsim_gui-2024.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "dca079f4661abf67d583422746c6f666abcd0e7e088cdc4531a677867aabf742",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-1/halsim_gui-2024.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "9f9f4ea24095f5a095b0487408effb4db88620ef0904bbb6799b027556dc17ab",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-1/halsim_gui-2024.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "991b8cb6cfa1c82daba2d5e68fa852e3ba8c7b228f99377be8eab1364742a4e2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-1/halsim_gui-2024.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "554bc2436d6a0deb13d7cf8d7c912310d11685513c1a980eafe9534ea6976c94",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-1/halsim_gui-2024.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "b7fc49954d675ab97cfb8e1bb1a07dc7a1d5ae24f8df888d1b17e66f5ee9dc3c",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-1/halsim_gui-2024.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "1c41e6b257169f8635411a67a306f5b118876df0dd46057bb23f92c6ca2b0a95",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-1/halsim_gui-2024.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "a0891a6c126f577b5a43560c5cc60a55e5525f1f9a7335568b8d87f607587ee5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-1/halsim_gui-2024.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "64ec86c84debae9a4308362b615227943e0d6153adc769c00cb7f3fde74c4029",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-1/halsim_gui-2024.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "3e8d91f5f111c39f765c1bac324432787e6acc0d571e91f9d3470f63ff0f61b6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-1/halsim_gui-2024.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "c45f9bf53dc32cef848930d3612847ca602e7408672fa24e2ebdfe0d398af711",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2024.1.1-beta-1/halsim_gui-2024.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "e65680aba5ef34ea590bd6778fa9da1da7372ca4f11d40fd0e97a1e8442d840a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-1/halsim_ws_client-2024.1.1-beta-1-sources.zip",
        sha256 = "32b247439b0d0771a9f56c0cb183f9c0571d31b2349371893fde7e65f2fb9b73",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-1/halsim_ws_client-2024.1.1-beta-1-linuxarm32.zip",
        sha256 = "0b2f7dc793f4f659c0a894f257f5d1948a0f45f435af668cd8ff2a224412c68d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-1/halsim_ws_client-2024.1.1-beta-1-linuxarm64.zip",
        sha256 = "ad716b7df70d26f4a60578539f20463c14736095ff7fa9026f55a365c9e81e21",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-1/halsim_ws_client-2024.1.1-beta-1-linuxx86-64.zip",
        sha256 = "c450c5ea82443b24134c754fbbfded98dea0d57e31e529975a9dd4723b28124d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-1/halsim_ws_client-2024.1.1-beta-1-osxuniversal.zip",
        sha256 = "3c9816b25d988a5fd521c64bb9804fcadc53d6974991dd4dc85ffc4cfc054304",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-1/halsim_ws_client-2024.1.1-beta-1-windowsx86-64.zip",
        sha256 = "40a37ec187fc48ddd6bce21ed7b22345fa7b30bc6c0d974789ca99436c913e06",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-1/halsim_ws_client-2024.1.1-beta-1-linuxarm32static.zip",
        sha256 = "7777f5e1c3ede09bd96c6a3063cc8d1cfbdc7ddfd1b69a8259d2bcc3024e1bd9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-1/halsim_ws_client-2024.1.1-beta-1-linuxarm64static.zip",
        sha256 = "0144e7c7c51277444bdb52c2daac699fd90679fab4e8839a3fb9cb8abe30d21b",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-1/halsim_ws_client-2024.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "12ba4726ec0d820c9468c282577406e687fe8ef521358704c14a3a4391c259e4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-1/halsim_ws_client-2024.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "b3509d78addf1dc6085e044fedffef41836807f952751b34b323da3987a63aac",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-1/halsim_ws_client-2024.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "e7ae740d65d357077ced7496cd97753a9eb3598782b3498c98770094948d364e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-1/halsim_ws_client-2024.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "fd9c85ea35e317d05adf935430777dd44c8f8f0c6bbf95961bf46068ff807d4f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-1/halsim_ws_client-2024.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "8ac860cf7615a27964a71bc45fe3e92b1e70cfc234c96774ede8dbfc5649be99",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-1/halsim_ws_client-2024.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "ec29651631ed95a68587d320fd748e67a0e1f9bc818a85d617a14c1f7c57a396",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-1/halsim_ws_client-2024.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "329f8f274e119ae0320773f7d7000f6267d897116107365af02baa8a5fe870fe",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-1/halsim_ws_client-2024.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "27f4c336326b5ddf76117934c0809170bbc38bee577a3fb69ccbd821c184af7b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-1/halsim_ws_client-2024.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "8a363ccda06064a978d699b8969539d6e160d10f7e8a7990eb4d489819580291",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-1/halsim_ws_client-2024.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "ca06f55e8b1d58f09910c6bf356c9253aba7571e33f039d8dc59e370acd3fa1a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-1/halsim_ws_client-2024.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "a771feb19bd76f0fef71cc0717ebd2b23f53f2ceae6bdabae0bf253a2e2fea6e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-1/halsim_ws_client-2024.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "e636ffbf8df1c185da2de48e89da3cd29a9690859e86512ad3c65a516382c242",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2024.1.1-beta-1/halsim_ws_client-2024.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "a9b0c037c3435fc763bd8cf2e17ca5159640b2872d7b649ce95bd1958184a91c",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-1/halsim_ws_server-2024.1.1-beta-1-sources.zip",
        sha256 = "3bd97aa1821dd901d7b2a120bb8ea83bcd6f705b5077cb949a9f2c2549120dc4",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-1/halsim_ws_server-2024.1.1-beta-1-linuxarm32.zip",
        sha256 = "e791f309b22af82192d92235b7c2b56515d8c2ebfe8bbb5bae3a069886a5eba5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-1/halsim_ws_server-2024.1.1-beta-1-linuxarm64.zip",
        sha256 = "a722befabfe26741e8583e031951959bffa45d2e23916116f9cc5583a6d3299c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-1/halsim_ws_server-2024.1.1-beta-1-linuxx86-64.zip",
        sha256 = "aac9e89e03eb4b16140e077d2931960cdfc25870064e91c72aade2b63d499089",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-1/halsim_ws_server-2024.1.1-beta-1-osxuniversal.zip",
        sha256 = "ba3b65223fb0db9fc25888007a0b11b1b7e6e59237d822b63d7f4b453677cd17",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-1/halsim_ws_server-2024.1.1-beta-1-windowsx86-64.zip",
        sha256 = "68fba7033a7fd75034f4a3abdd13e1068d667cf0cb3a0a82dff04e762c9f9477",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-1/halsim_ws_server-2024.1.1-beta-1-linuxarm32static.zip",
        sha256 = "cb4353a9594719b5c8645fce50d995b5368b6c1154e0ec7a89bde84e8baf3da3",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-1/halsim_ws_server-2024.1.1-beta-1-linuxarm64static.zip",
        sha256 = "e44740d92177ce491e9267309926877749a9783fdf12592fb66a2452155f61c8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-1/halsim_ws_server-2024.1.1-beta-1-linuxx86-64static.zip",
        sha256 = "4f001961a49e504af475ec118647dfe4d490b67279d66fbddefb092579bf931d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-1/halsim_ws_server-2024.1.1-beta-1-osxuniversalstatic.zip",
        sha256 = "de7f14db885b917ea64ea283ddb7684e9bb19f4f87d5b0022e3f444827db476d",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-1/halsim_ws_server-2024.1.1-beta-1-windowsx86-64static.zip",
        sha256 = "09d503d2296066707d7589eb12e0b46060900963fdf03f50cc5518414a82ec15",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-1/halsim_ws_server-2024.1.1-beta-1-linuxarm32debug.zip",
        sha256 = "fa6db63390f03e91e69857331cb70c103f3ac13c82bdecb0b3809654b2f8e247",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-1/halsim_ws_server-2024.1.1-beta-1-linuxarm64debug.zip",
        sha256 = "d5fe5a3189fea9a4f2278d057b10f86884bfd16a31696292b770054a04857f3b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-1/halsim_ws_server-2024.1.1-beta-1-linuxx86-64debug.zip",
        sha256 = "29abcbc44bcfcdf14f751ab70b3be05892819562bd78a567f60c700c3a0a35b1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-1/halsim_ws_server-2024.1.1-beta-1-osxuniversaldebug.zip",
        sha256 = "50155af4c11827b66b9d21ede9c5982595ea2f47f58ce63dac9a22484ab7e72a",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-1/halsim_ws_server-2024.1.1-beta-1-windowsx86-64debug.zip",
        sha256 = "a51bc3ec96723fa18f45b4009b02c1786b6956ed77fca161ffb9714d28e1d2b0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-1/halsim_ws_server-2024.1.1-beta-1-linuxarm32staticdebug.zip",
        sha256 = "c1c79b570c0105b5b5498dc65489f4ebe5cb5b5c48758b6afba15c7e14d2d990",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-1/halsim_ws_server-2024.1.1-beta-1-linuxarm64staticdebug.zip",
        sha256 = "3cac53a0cfa95354ac161306c04358ec18790408be49a16a37ed29886bd2f3a9",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-1/halsim_ws_server-2024.1.1-beta-1-linuxx86-64staticdebug.zip",
        sha256 = "676ec809ada23e6e3c0af446eff1817b4fca50754cacdd61ae1c1cf85ce34a81",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-1/halsim_ws_server-2024.1.1-beta-1-osxuniversalstaticdebug.zip",
        sha256 = "592dbbf3d05b6eb22b8e617a139fd2e884247374b3aa24f1889757dfa0e18c08",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2024.1.1-beta-1/halsim_ws_server-2024.1.1-beta-1-windowsx86-64staticdebug.zip",
        sha256 = "95a6ae5e8d9b1fccc875332471e7eedd81f98441b482be0f2fdbaccd21512878",
        build_file_content = cc_library_static,
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.1.1-beta-1/SmartDashboard-2024.1.1-beta-1-linuxx64.jar",
        sha256 = "ba3646d1cff4b54c908a1493d661b0a05195033d57e5c4f6f91769a94c47bd24",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.1.1-beta-1/SmartDashboard-2024.1.1-beta-1-macx64.jar",
        sha256 = "0825d7bcde6e9f908e6578e9047ee727187072bf68b0ce1cc2400a7d160fbfb5",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.1.1-beta-1/SmartDashboard-2024.1.1-beta-1-winx64.jar",
        sha256 = "f4ffdd2b4c69e0ad548df99b652d6f4e3b7b9fc61611a0e2269f63693cdf033c",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.1.1-beta-1/PathWeaver-2024.1.1-beta-1-linuxarm32.jar",
        sha256 = "2ade199f04634a0f3167c5f46c2de4de25aa3898a328c3bc86a42e0c24e3ce74",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.1.1-beta-1/PathWeaver-2024.1.1-beta-1-linuxarm64.jar",
        sha256 = "3f8a339e0fe745e2c69eadcc06d19049b59a3b1d979c5359bcf9395c78adc786",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.1.1-beta-1/PathWeaver-2024.1.1-beta-1-linuxx64.jar",
        sha256 = "af47effa9d8287cee61802e2fc7ff7c8d11bc3095ec81d9b9c5c9bec03f9f23e",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.1.1-beta-1/PathWeaver-2024.1.1-beta-1-macx64.jar",
        sha256 = "3e1ffa289773479a14aade5166599ef52bf8dba317e31a851d03a3edea86b11c",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2024.1.1-beta-1/PathWeaver-2024.1.1-beta-1-winx64.jar",
        sha256 = "d3c59279e0a75be8c5d49626ffdc86d50f5384b56811a286be6a30c7a71a8ec6",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2024.1.1-beta-1/RobotBuilder-2024.1.1-beta-1.jar",
        sha256 = "713baed3904cc19c28baf172bd86bf7b74d8ab09ada382b87ce90f3028e22101",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1-beta-1/Shuffleboard-2024.1.1-beta-1-linuxarm32.jar",
        sha256 = "41c2cffe3dc9eec591a02904150f3fa275d675698b5fdc9a866fea90d1cb860b",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1-beta-1/Shuffleboard-2024.1.1-beta-1-linuxarm64.jar",
        sha256 = "8e17e2381814cb5f6cea2bd30c071cdcf16754f785eeee88ddafec07061c1aad",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1-beta-1/Shuffleboard-2024.1.1-beta-1-linuxx64.jar",
        sha256 = "0311a7f7f073e4a9640679a289089bb79a57331abd25eb6fbe03c766c8e847ac",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1-beta-1/Shuffleboard-2024.1.1-beta-1-macarm64.jar",
        sha256 = "2076a8a081ab667feef7cffa868e18bd2afe7f7a36ff7dfc8858eca612d3a313",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1-beta-1/Shuffleboard-2024.1.1-beta-1-macx64.jar",
        sha256 = "d2fb1555acd7935ced2614e0ee20946155efff9d5b55e25e139857802fc33970",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2024.1.1-beta-1/Shuffleboard-2024.1.1-beta-1-winx64.jar",
        sha256 = "9c13413a2fbd4692dc856eb115d6da90598ff46a3220dd1e18b69c5e96cba98f",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1-beta-1/Glass-2024.1.1-beta-1-linuxarm32.zip",
        sha256 = "f20f37389112caa5dd750a950466720af04d4392a20a3690519a2b1c1affb591",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1-beta-1/Glass-2024.1.1-beta-1-linuxarm64.zip",
        sha256 = "19f2a94e5a69e335cdac60f4eaba25755ce308c9d93e124ba38a29c91738c02a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1-beta-1/Glass-2024.1.1-beta-1-linuxx86-64.zip",
        sha256 = "3564071fdb3b8158ae1a71408a3734e8602dd7e42f9d49c71b552f0ae42e7b62",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1-beta-1/Glass-2024.1.1-beta-1-osxuniversal.zip",
        sha256 = "ae2686fdf5af98d973e3f4d14d1a44d7f2f70cb66719ded782d7c093ab6f7205",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2024.1.1-beta-1/Glass-2024.1.1-beta-1-windowsx86-64.zip",
        sha256 = "71a08bee132d96a96b057fd571ee10c753a59b57f554952586083cb5ad93186e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1-beta-1/OutlineViewer-2024.1.1-beta-1-linuxarm32.zip",
        sha256 = "2633cf16df4b02e122d8594f37fadb7c3740d1d5131ce9f92ee95ddf67defc89",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1-beta-1/OutlineViewer-2024.1.1-beta-1-linuxarm64.zip",
        sha256 = "aa92bdb655845b0e56caad1a4d37e52a339e1ab4ce857aa04929b4873f58dab9",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1-beta-1/OutlineViewer-2024.1.1-beta-1-linuxx86-64.zip",
        sha256 = "d1087a3b072f8f8a6a014a0d2fc51c9704cc62760404c003ba0bd510ff260650",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1-beta-1/OutlineViewer-2024.1.1-beta-1-osxuniversal.zip",
        sha256 = "618a22d832b1d6a0e9be0a68173ec942b5298aa6348190dc53db519e1d2d45a0",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2024.1.1-beta-1/OutlineViewer-2024.1.1-beta-1-windowsx86-64.zip",
        sha256 = "35f7d39d691818934e68773bf8d865423288bd535d4e3344024bb6f44dcf8907",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1-beta-1/roboRIOTeamNumberSetter-2024.1.1-beta-1-linuxarm32.zip",
        sha256 = "e77b28b38da681be5f5ffdd0a7e0bb7ac8122890ca4b2d7b84f4b009186e493a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1-beta-1/roboRIOTeamNumberSetter-2024.1.1-beta-1-linuxarm64.zip",
        sha256 = "85600e58505e87bff6086559fe53c5bd152b0cc1b83bdfc8db5aeeadec3f52cb",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1-beta-1/roboRIOTeamNumberSetter-2024.1.1-beta-1-linuxx86-64.zip",
        sha256 = "3b43e3f0663472c769253451cec6a32445151c6d801ac9c19ccca77f969c4713",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1-beta-1/roboRIOTeamNumberSetter-2024.1.1-beta-1-osxuniversal.zip",
        sha256 = "3bd121d5b90362860a201c4aebf7107f2fc23fa9e4f78f9069fe541b3054a253",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2024.1.1-beta-1/roboRIOTeamNumberSetter-2024.1.1-beta-1-windowsx86-64.zip",
        sha256 = "ebfb3790096b94d7bca0d3f7909eb279004e813bfdb9210428075bbf3a8bca24",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1-beta-1/DataLogTool-2024.1.1-beta-1-linuxarm32.zip",
        sha256 = "ba3341ff4e70352875c0bad54cb07e2357edddb7c6649db77235f523a323d193",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1-beta-1/DataLogTool-2024.1.1-beta-1-linuxarm64.zip",
        sha256 = "e008f36e7d19472db75cb54789eaa0da7aa86034f141e3fd72b14a97cc93ba50",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1-beta-1/DataLogTool-2024.1.1-beta-1-linuxx86-64.zip",
        sha256 = "8d970fbbd553b161184d4c030f0ba2b66b1396a14294cb016e799ff8863fb4b3",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1-beta-1/DataLogTool-2024.1.1-beta-1-osxuniversal.zip",
        sha256 = "251220219d02a4e7586981cb0ce18d7560aa2b92223292e8ded88ca35c491493",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2024.1.1-beta-1/DataLogTool-2024.1.1-beta-1-windowsx86-64.zip",
        sha256 = "2374b99cccaadeda0cdc096b5ed1a47ab9352f83dcd4fa662516577f9c415835",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.1.1-beta-1/SysId-2024.1.1-beta-1-linuxx86-64.zip",
        sha256 = "5222dacc2e6d84f1574dec0c6113e712e4741494bf0c8074430e7c939a1ee988",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.1.1-beta-1/SysId-2024.1.1-beta-1-osxuniversal.zip",
        sha256 = "51bb025f909bcc9af6fd790fcd7c0ef0aed749c5ad390db26a77237e5d37a056",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2024.1.1-beta-1/SysId-2024.1.1-beta-1-windowsx86-64.zip",
        sha256 = "6ce044e5ba045b24a0dcabe32d5c666190b559578c454ba8bd5152fc646e3a9e",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
