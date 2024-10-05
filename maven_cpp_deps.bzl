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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-headers.zip",
        sha256 = "5969d71b164bb948c0e289929bb8471f4cb0380935225085816f2b1790cdf32f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-sources.zip",
        sha256 = "8ce66ac1d72e6c5694b0a350972056d33826e18c450b39528f878d6436823fc6",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "0a5bc5ab85671a3e6192a9a28a753fede86c2db6180766b5a05c39a6a2cd63a0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "c00d1bc31b2ba0f898f1fbe246ae076d589aba1cb0735edcebd9bc766d1d0334",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "e3569f6be2ba30c7a5e37fba29b35d97ecff5c1504e0680214cff607be25f487",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "914cc4385a820ac7da1f3d7b1edf6265791241adb0c6a85b32fa5478d741531c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "80e714cf2753067059bdd52491d7ab8eac914e5f97466268757e5805d57aa8a5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "71944b668dda46682a86c5c608b99915cbf36c087b380c4d2ef8d1e7d646b2f9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-linuxarm32static.zip",
        sha256 = "90884f2eaced8d971a703667609625ff25f8e7c62607955c752079624bfda8e4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-linuxarm64static.zip",
        sha256 = "eaedda128ced039a9c84e4df94f630ee1f090c76cd864f7ce6fbd65d63695706",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-linuxx86-64static.zip",
        sha256 = "76267b19349e4dc919e9299a130434b3f3aaf47c2e9d84eec58074a596ed980c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-osxuniversalstatic.zip",
        sha256 = "afa5aee20df3ec48a0ce40be051943bec2a3311577c5de8923adacd2c723a229",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-windowsx86-64static.zip",
        sha256 = "c47841398bff2449d83fce20dd76fe92a2b10fbef6fe1ca720e9d64ebd603915",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-windowsarm64static.zip",
        sha256 = "491ab8043066413af7b8a6722dba01507d960856fda717292387c2d360930a74",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-linuxarm32debug.zip",
        sha256 = "74ac99df0d4aae9a3c3ec422af443bee0c57ff6e34ab0dbd106f195141d60836",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-linuxarm64debug.zip",
        sha256 = "0bdb859c98dcf3ac0b94d54a3e2b6de811dad90c0dd5bb3b6fa756ac8ced35b4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-linuxx86-64debug.zip",
        sha256 = "7dc3435b0dbd5ccc12655f474e605736dbc57d35fceea5b6633765a4475763b7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-osxuniversaldebug.zip",
        sha256 = "85b720a128efb21ed90869db08209a1ff5e173dd7ea3a00ac608b21bb21642be",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiutil.dylib osx/universal/shared/libwpiutil.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-windowsx86-64debug.zip",
        sha256 = "4893efa2d94b1212c5832c25f0a1dd8b3e9da6f49abd86aa7e3fa5f353737b6d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-windowsarm64debug.zip",
        sha256 = "3e1b965abfa2037c1f682cb41e4ac27ba6c07dfe6e4c83ae7438bcce6d9bc90a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-linuxarm32staticdebug.zip",
        sha256 = "3b4711fd127b9208cd00362b5af724f855baf445c84282362a7d48b80f3be1b6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-linuxarm64staticdebug.zip",
        sha256 = "f32c02609e5aa73930964a04608864beb4f4f6b19d1614c6ad3cbe51c93b8ead",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-linuxx86-64staticdebug.zip",
        sha256 = "e452850cb8a6942ff274c73d60004d9f86600289c7103bc79111586d4c1d9a0c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-osxuniversalstaticdebug.zip",
        sha256 = "4c4c8ea7d4c6d258c17d07293a19c473c22419962b0bad949d74dc6d435f1d48",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-windowsx86-64staticdebug.zip",
        sha256 = "dc4ca68003f9fc26b7fe49ca647b45ae7d50d6bd31fd2354d8baf107e20d014e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-windowsarm64staticdebug.zip",
        sha256 = "2ee3869b1d7399c1c6e5ed78348588dc3551ff73725511b38b076d4c00497065",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-linuxathena.zip",
        sha256 = "45dc83c3f4e80019463f94e3464207fe9c34536954367dd1678e0cbc71c4add2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-linuxathenastatic.zip",
        sha256 = "9e997f49385da07b3a4393b5679450a4aad0e658afec55be4ff66fef72355027",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-linuxathenadebug.zip",
        sha256 = "1c6d964493603445708a79a6f856e93245340659447a57233cc4c0b7dd4e4d27",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpiutil_wpiutil-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpiutil/wpiutil-cpp/2025.0.0-alpha-2/wpiutil-cpp-2025.0.0-alpha-2-linuxathenastaticdebug.zip",
        sha256 = "77a8531c5f7f73d76ed279ec76475efa580a4d71d3da136ca309704f6035024a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpiutil:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-headers.zip",
        sha256 = "39f98ff8985b88927e5fcbd75c4014342c985674c77279c9af0a71bc6a1e5502",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-sources.zip",
        sha256 = "4bf62285c8aa638d1d1118eb0f4dba8f9a4ec71c23c8b00d33af29954f25d27c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "ae8285f514b4a575d2ded064d7f52006b05b010959464976d31fde1991ed4914",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "22a684ef96d55d8d2536f0da27bcce35b989e9663268c81a20b5221850e614a0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "cca48499d9c50681933a68d89ba7ab8d74bcf5e872f5405ce448ee9eee4570cf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "a184312870691950f9261f7b57cbff2fb70fcf8b1c76d9a987402fde0370cb27",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "90ef4c13d465cd408659da2654c987cf78046ee58aece29b89bd2610ad7ce87b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "beb259984b4e211affd8db20d96a8a2d20a2ca21147902f77b38e8fd3e4b10bb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-linuxarm32static.zip",
        sha256 = "380db5d42d1c63fdc3d3101d2391539eb9dc4daa51cec4345ad6d7a5ba710824",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-linuxarm64static.zip",
        sha256 = "d2a04be0edf0e6e79562226fa12191691582296e25dfd512fc8faa43361448e0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-linuxx86-64static.zip",
        sha256 = "b3d0e928b873188ee9422cbac7a28be4af66925beb7121cb5ddca8169ba7acdf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-osxuniversalstatic.zip",
        sha256 = "319ca813f623a2b20bdb51f611b1811f71c83c690be068b3c1491f434679f8ec",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-windowsx86-64static.zip",
        sha256 = "7e7af86f130f64e1566463935b441ad09eec453b060cfdb8d21a6fe7918c3653",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-windowsarm64static.zip",
        sha256 = "fe5418f966e63abf6fd481590f3beb73759ca889cbf92e99ca60075350b2247f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-linuxarm32debug.zip",
        sha256 = "214a9d921f1e82d13da0e103beb2a2a01c9efd1f7b5734fb9f0af86529eb008b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-linuxarm64debug.zip",
        sha256 = "ce311b5d77446c23f38bb28af6dc415c45437e97d3bd721f2d26577087673103",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-linuxx86-64debug.zip",
        sha256 = "4ffa8df820835fa30b5b17445b5eb5d48e54111794ebbf69fb2ae42fec25d45a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-osxuniversaldebug.zip",
        sha256 = "f50330c242e4dbe232f697f9b8c364f4e72fd2f89147aa325b55cf9b1e6f7351",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpinet.dylib osx/universal/shared/libwpinet.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpinet.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-windowsx86-64debug.zip",
        sha256 = "ee111bc79d266c428617e060bce4700aa60ea119a83b8d0b86754e79add785c3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-windowsarm64debug.zip",
        sha256 = "8e652858ce054068d77ba87b96b958de7546da4525d8a78778046ea015be7277",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-linuxarm32staticdebug.zip",
        sha256 = "2d9ae29b1ef1d7ca7958c0d168e0a455c95591f0a7d7bb72fc49c28d47b25ef5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-linuxarm64staticdebug.zip",
        sha256 = "f3050b16383c752b4e0c57ad14109d3cc1371714c790f0634be82609990ae4e9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-linuxx86-64staticdebug.zip",
        sha256 = "63a4a77d77afab2e97921404df91312e61cf4a1a4a5428b36a934d4cd7832f51",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-osxuniversalstaticdebug.zip",
        sha256 = "e5b6ed0301e1afa315b54ff711bad77f7f0f5434c4d844ddb97f0440f96c6bf7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-windowsx86-64staticdebug.zip",
        sha256 = "57315ac16bae19e9bac68b50fdb3d343f5029155fdc95476906026c450963fe1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-windowsarm64staticdebug.zip",
        sha256 = "2526bf109fa407b04b47691b25b171f87212565c9685a1d07688c020022af907",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-linuxathena.zip",
        sha256 = "007a5416d86f43ff137f5e22a0c73eacc3764d0c8beb6bb2a782ba5ff5b4c80e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-linuxathenastatic.zip",
        sha256 = "0155e4ad338a22aaa2fcc9de682a887ec1a0d4347d3e4d0cfef823f574bb2d28",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-linuxathenadebug.zip",
        sha256 = "a141c7d5377ec612cf983a5b550e36e24f47e2c6c8112b46ab802dc7a8f8c9a2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpinet_wpinet-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpinet/wpinet-cpp/2025.0.0-alpha-2/wpinet-cpp-2025.0.0-alpha-2-linuxathenastaticdebug.zip",
        sha256 = "8850b29f20654c92b0a187e8f189480806cdbbd3d987df7fee0f4355ed8991e9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpinet:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-headers.zip",
        sha256 = "ec92719fba9ca88259e0e0074a5d1479e6f2c0b4aff3b2f61f2e7ba2d2035094",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-sources.zip",
        sha256 = "c2f0a7736908fb23b486a71b401e2a227bcd8e6aa513e68ba96b374fdc93388f",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "79021f87ad2a16409765037e14890e3755098b223f5eeed20c536bd2e417fd69",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "1f66fd20da2a6de9d68d70bd9bb426e12529703ee3d26286074978ed7a55b626",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "84748c19a11a1cdec266e4062e1efa7ad1f9a8526676e4357661586c25d79ab3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "cd842b369d11a27c9fd9d4023953c54ade8eeec27820e6616fe8b2df85e88946",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "bd5b47145f6522942319f3ebcc72221e51c2c0412fd9c1de034d0f26ba3eb73e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "cb5ffe6e9fb6cd866e77606d328f4a3f2deb6291713353d46800e7e18f647258",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-linuxarm32static.zip",
        sha256 = "20843e13fa61e11b94cea3c1690b20420d197d503a0737d61fef9f0f860fd8e9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-linuxarm64static.zip",
        sha256 = "53728dbd69a8d3d83e331a023edc4778640a069948b8c49d48fc605214811cef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-linuxx86-64static.zip",
        sha256 = "2a2bf9ada85b9ddce8ce43a01cb7dc73dcfae1ecb0c9e8968f325cf99057fa02",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-osxuniversalstatic.zip",
        sha256 = "21b60ae1eadf11ece19efd00c5b17309a6c05b802be13863e3b61f87adc201bc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-windowsx86-64static.zip",
        sha256 = "a0d455ca5729f2136d84127a21327f2a22917b28103e7ca8a13cb88669285867",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-windowsarm64static.zip",
        sha256 = "fffa2ef9717641a3d791af5988406e07efa26193535927efc0f51883a7e3492d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-linuxarm32debug.zip",
        sha256 = "4b9a69a55049f18e360b56f7ca97c024c9b9ca437e079aa1e8e171186eae46e2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-linuxarm64debug.zip",
        sha256 = "6bbfc29fd22e033d55ddd76f623fb6e8860d7bb5cf1defbda0edc44fc0905dda",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-linuxx86-64debug.zip",
        sha256 = "f2bbb259f135fa42fab366081483ec0f0ee49f23de68ef09cd3a2273dee265fb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-osxuniversaldebug.zip",
        sha256 = "31364df539b56654ba9f7462f184bf93c829eb92afc7c161759a3e5a18a116ba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpimath.dylib osx/universal/shared/libwpimath.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpimath.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-windowsx86-64debug.zip",
        sha256 = "fd2755871a03e957f5fd314411b9aeccbd0a862440a98517b12f45ed5a2548e0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-windowsarm64debug.zip",
        sha256 = "f6f812cdeedd3fef445fe67b4e034213f4071c10c4180ed3cdd60058e4273b7d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-linuxarm32staticdebug.zip",
        sha256 = "87bc0c0d77945c21702f4fff8878200ce9427b0885608c680932076216af5662",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-linuxarm64staticdebug.zip",
        sha256 = "b442d35f4f9575a25120f3c3a8e94d827a34adaf1ebbbb2cb84da19907df853a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-linuxx86-64staticdebug.zip",
        sha256 = "5feae994fb2d96211adb1d100603f241307562c5741de18e4b2826e48b485b3d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-osxuniversalstaticdebug.zip",
        sha256 = "6417e75d375efbd8922cbc9ba42e2e0f344b69393a80ea65922278708a7491f5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-windowsx86-64staticdebug.zip",
        sha256 = "80b5d948ae5b66b156f4857d32193e5e4db1902f1b8b6710d8dfbd54ee2e97d2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-windowsarm64staticdebug.zip",
        sha256 = "0f9c299edbf45f6788a1aad378873a169d9e2171bae77c3f1f9fa78f52cc58bc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-linuxathena.zip",
        sha256 = "3ced23c8ff159a461b6f421acd3572ae3bffc5a373777df63bcdb906f6064ece",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-linuxathenastatic.zip",
        sha256 = "8f5058ffb6ef3ae5b4f128ba71a8ff9b84ed20806a826a8ba3a36c1530124449",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-linuxathenadebug.zip",
        sha256 = "bd98523d8878af868792149cbcc951e585db1e027d1ed3138638126cf8231711",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpimath_wpimath-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpimath/wpimath-cpp/2025.0.0-alpha-2/wpimath-cpp-2025.0.0-alpha-2-linuxathenastaticdebug.zip",
        sha256 = "9cc3d28e757eba96369693e82bbee43759c217ba9c10030840daef907f253cf5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpimath:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-headers.zip",
        sha256 = "85b85d092914002873ebc1600b46860ab4e0f77ea387a0f5f7c883131030ee22",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-sources.zip",
        sha256 = "5a8e5ca80ac51832b9b363c8ffbaa74c316efde077870deeee4e0534b821cda3",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "7e0b5526249031d1ef9e54d5d36d7479e1138832991e6cc96a6a60d4a130b2ba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "70b759822f1dfe9b67f168ff5e570306117c298a42e800eeb07d2cdb4a3cbb9a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "1e940355c3d62f94d0e25d907bd4256fba273091a7c7a8b5f552db03f5c0422b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "aa2d679325b4c621eaabaee713d4e5b6b6307f2288dca206abac09c2f80307d0",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "351e3a3ab4c486eb8e809cb673c6e03edcf71cfef179f3d62b09dfc0ce7d24eb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "e718bbc34f26cce3745b66747032b51cec3394b54ccb83ba52d0644b714f33a6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-linuxarm32static.zip",
        sha256 = "3a7c9085f8cc5b205826428ef461710ce7da7d51883b35a727380dcbeeb14fb9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-linuxarm64static.zip",
        sha256 = "5290f15052a4fa977b9058db81ae1fb2e1f0c7d073f389ded7027db603f41a3d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-linuxx86-64static.zip",
        sha256 = "c5310ab3ad3c3f4b51db99d92d66c5d3ac4c9af412c831021b2909e9d975f7ae",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-osxuniversalstatic.zip",
        sha256 = "11aa506066b948558688bf7f7f47408e5a84d30a519e92dd56c8a6e64d8ef78c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-windowsx86-64static.zip",
        sha256 = "aa654ddb7aa2a8818c11b4fb808715ed051d0d27d8f91fd45d448717ecffe85e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-windowsarm64static.zip",
        sha256 = "91a957a0edc9ab1de7f6efb92bb8e7a7323d5dd619e47a6768a94f32f0435510",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-linuxarm32debug.zip",
        sha256 = "6a2d6843238e90411c4b35fbf2bad2d8dd6ffb16c56bb2de0978b53d443417ae",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-linuxarm64debug.zip",
        sha256 = "c18b9b73413179e00f1aa0adfdff55ebbb3ab36676547910287cfca238db083e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-linuxx86-64debug.zip",
        sha256 = "f4f39ff6f0e508c57b90361f0f729cc213d9bbda78cca7909a84b994f5a91302",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-osxuniversaldebug.zip",
        sha256 = "6b6af7cc41a489978297a0aa571b73cb9094285611e01795f483be5a9c347585",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-windowsx86-64debug.zip",
        sha256 = "42946b00cf47407f4e897239ade863aca1bbb10012763aa04b08040efc8094f3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-windowsarm64debug.zip",
        sha256 = "541480e22f59f7b0c6c31d457820f73fb5ef4b353d95d9a9110817c5adf286bb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-linuxarm32staticdebug.zip",
        sha256 = "863377baa9f7ddd1a91fbc669049c32f4d354e6998da8e949bbbbd53eaa0914d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-linuxarm64staticdebug.zip",
        sha256 = "5da994a3078dfa43b166bebe170d6bfe95227d23d3832bccc1c8bb2d00e34ba0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-linuxx86-64staticdebug.zip",
        sha256 = "7c6c11a3049fd32d926b4da0a5e847d85726d60d855a0b8b9c27b99a3073b4a8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-osxuniversalstaticdebug.zip",
        sha256 = "198ce3cbde7ddee19e82eac7a89cc773132e4a8388bd894fcbcd309de62090c6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-windowsx86-64staticdebug.zip",
        sha256 = "db0cb2a127b02f7475cd975681184c9a0f0f68ea22f01bd0b18ff93d8568c0bd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-windowsarm64staticdebug.zip",
        sha256 = "d7068012562c84b88ee87233a81b4aa078643ce2a61db4b4280300bfa6be65af",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-linuxathena.zip",
        sha256 = "643bfa61b7fbcfab59615011b245d12ed10840e1a55d13796bceb2fe68d1f361",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-linuxathenastatic.zip",
        sha256 = "b573b4b8edfc87d4b49274cc896d04cb2c5a11752223904a8282a2aba4a28b3b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-linuxathenadebug.zip",
        sha256 = "e99c63e1cc705b9c7ff0cf5dd6e00be6b46a368d0f022b668a7390de1686401a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_apriltag_apriltag-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/apriltag/apriltag-cpp/2025.0.0-alpha-2/apriltag-cpp-2025.0.0-alpha-2-linuxathenastaticdebug.zip",
        sha256 = "feba00d6170ae04bbc6fbc215094463e08b10906623064e474c72c1ca7488184",
        build_file = "@bzlmodrio-allwpilib//private/cpp/apriltag:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-headers.zip",
        sha256 = "246191ad1aec21d3814c265468d419bd0021edccc6dd17d5acddba769275d040",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-sources.zip",
        sha256 = "3a5dc34d9f02c77dcb0f323313ca966dcf2ce91030d87ee40fba441ce6586ab8",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "97c2fc9fe058e80ccb828ae156a369f0fcee9258b5135448dbb21ee2408c31e7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "2ed2541182319b7382b33d33bf2fd4cd35b286cbc761b06f4a778cb4bfde7fb7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "02624d78376d8b47254159735c6883620905743f4f8ae6019035fbb510699edd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "829587ab108ee6b8812bdb8d22a78ce84b932098330c10046064627f1447e56b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "6a4873a7cd5fd102a86796d1f71a1c8158aba9fca1cc06cf2380e7352e46c9fa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "8fd361ff978750191e5f153403942ae75d7beb792f895353901979ed2d61938e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-linuxarm32static.zip",
        sha256 = "c52cbc098445d96f70f381cd1222e4e46b74872589d3079f33d3fb1135d32088",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-linuxarm64static.zip",
        sha256 = "81c87dab632e005189613f8673a59f9318fed25cdb15909153e314736790d369",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-linuxx86-64static.zip",
        sha256 = "ddd37cee0265913c8c74e527c8164520197425497e8e2ff0d2ffbdc202bdf3a6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-osxuniversalstatic.zip",
        sha256 = "57fea9425e1506900b804b92862ea66014b389560270c73d50b7c0434f5a45a4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-windowsx86-64static.zip",
        sha256 = "c7d69eedaf9543b260ce65fb887237514fd65f46dde55e721446bb88cf7897e6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-windowsarm64static.zip",
        sha256 = "aeef69a96cf6e22ffbd33bd94143ae6ab0b5f2e901d42366bd719e4dd5caff10",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-linuxarm32debug.zip",
        sha256 = "3c0156f30d177fc3b59b577e3a6843923f339ebd56d3761cdf2c19c5450897e1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-linuxarm64debug.zip",
        sha256 = "b65a710fe07491994487f9aa3ae4231ab0d03606fb8dc0c5bfd45f4b49e22a9a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-linuxx86-64debug.zip",
        sha256 = "032a4c99001db54956060587e95bfc2e6b6296735073252d1afaae2a74dfa869",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-osxuniversaldebug.zip",
        sha256 = "3447ddc2a19921800e3251063bb1338065b5dad2f9033c8d6e76ff58760d306e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libwpiHal.dylib osx/universal/shared/libwpiHal.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libwpiHal.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-windowsx86-64debug.zip",
        sha256 = "cddf73f93a84e1247ad64d5c623aa047a0bbd2cf152ecd99491cc130caa48cd4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-windowsarm64debug.zip",
        sha256 = "c4a68f5790a898628bd6535111e1d037a472e416608989d761778cc7940bc457",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-linuxarm32staticdebug.zip",
        sha256 = "e7af4cf03b26bcaf9a71db7a3bae429cb0f96bf186ba40b56acde3b3a08049f5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-linuxarm64staticdebug.zip",
        sha256 = "a86ca3bf32dce5c1de505e9818d0dbe33fffb3783c16334b27a68c14eb1d3406",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-linuxx86-64staticdebug.zip",
        sha256 = "a4e1abd8719cc190dbd174b49cfe34441ef8c2d743190fea658bce15db85d4b8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-osxuniversalstaticdebug.zip",
        sha256 = "a7ea5307e2f026f7fa1fa576fab2839999399604449539a66d7b70ee5b05f471",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-windowsx86-64staticdebug.zip",
        sha256 = "0b7b954b2ac1726d1990f746dafb6671f926750cc732d2dd1115b4ce9b5a542b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-windowsarm64staticdebug.zip",
        sha256 = "028f0086029a4c5d84e3ad139b8fbe7a9058badb9160f3db51a821a159698175",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-linuxathena.zip",
        sha256 = "b7fcc888b753c9f1b1f3d8711b3a5163874e59bc87c309f71db56c91c13f5bb3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-linuxathenastatic.zip",
        sha256 = "3d96c4e9827eb187a7b9354e3c374e4dd06fbccc2a703992a76a9d8739280289",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-linuxathenadebug.zip",
        sha256 = "f81e5ec6b890ce71f0e37e9cc4e4bc9d16b51dc3756e0abc321c2dbd0ca15544",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_hal_hal-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/hal/hal-cpp/2025.0.0-alpha-2/hal-cpp-2025.0.0-alpha-2-linuxathenastaticdebug.zip",
        sha256 = "7ae41543cce08734a3da1a911a083314a4b86da3a1b3af0ea110a3bbbe90e08e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/hal:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-headers.zip",
        sha256 = "de3ed4de17fd712edbfc285ace18baf6d404028b274faa65c78a05d40f2e595a",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-sources.zip",
        sha256 = "462cacd3c319e453893ef41b887f838d5e2277430cf0180af07a364b5649c3f6",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "316caecfbc116de75fe0541ff5c7bf556ee213e63cec00f99b118d0e42d6f895",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "7df87327dc3d5101bd0bb960661f3e449afb1d4b0ac0aca6b5fb77e5b991f68c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "e5a0fac7bb42a900e19e7672189760a2496ac81fcdd3258e0f3556c7a5cf6c0a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "54416573c3b24b02cc2795825ff0df71ce0095e3a9414233f63c099016153fd1",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "6b13f7281e049b62f156f6193375d318941179b5b594ea1720b37a3c3443ad29",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "ac08a27ca50cdbe090d77a9a5b40608a5cebc094b246409b2da3191f9703cd74",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-linuxarm32static.zip",
        sha256 = "06acb425ba35e80cce10b2fcd967cdecb1d8c93488a7aff5849318bb0ff6aa87",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-linuxarm64static.zip",
        sha256 = "5539c75975d1820bba20da48a759f3db878a518ccafba20ad5af498c88c7fef8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-linuxx86-64static.zip",
        sha256 = "788e2c3e204fd782b7180c8e2f297083e8f465b8145af3d8bf339ac392224778",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-osxuniversalstatic.zip",
        sha256 = "46c5966cc1bfa3316661a46e923b0e86611cf9060bf2fed64e16f7e8b1f128af",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-windowsx86-64static.zip",
        sha256 = "0adb47e7b7c8adf1c36fe5e9723ad57e6ad7ca53cef7e7511e74d7b6d2c8d8c6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-windowsarm64static.zip",
        sha256 = "74df097117c03938c14b9c45f2243d89dffeec69fb2c1616d818b74594088fa5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-linuxarm32debug.zip",
        sha256 = "de97193bd2b9785ce7e49961b32a4f0a3b90170acb3ba341646feb1e54450719",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-linuxarm64debug.zip",
        sha256 = "6003d3bd8f7be8f5f17e6549ed81b9bb31009eade8b087ff3b10e674fcb7a6fe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-linuxx86-64debug.zip",
        sha256 = "83b4351f62bf4b2db104abc1fb72070adb1a91761bd9fb730291e73dc17993ce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-osxuniversaldebug.zip",
        sha256 = "84174cec61295295f2e39eaed842fd8adab41973cd2487dfe70fcddf77745323",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-windowsx86-64debug.zip",
        sha256 = "0342e79c3c29758615fdc3f1086f9f8b1d42f6ce4d865743a92e6191d011691e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-windowsarm64debug.zip",
        sha256 = "01042134d708d817523a6bc9337e43a69dd699f4d6a7e85d7f6e34935afbebb1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-linuxarm32staticdebug.zip",
        sha256 = "3ba322b113db1e16f16f1679b24bef2125d0526b3bd3236dbb2470c36f518739",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-linuxarm64staticdebug.zip",
        sha256 = "63c4c60547e3f069c68f362dd0169f192ac1ede10022eb57d084a67c30d46d16",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-linuxx86-64staticdebug.zip",
        sha256 = "a0b740390fb62e9b5e0db2bde9b83171928109a9460b1aee4b25154e08c5dded",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-osxuniversalstaticdebug.zip",
        sha256 = "5595d5931c6c81eaa76212d21568f0e245a454ec48966656e41aba666163f86a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-windowsx86-64staticdebug.zip",
        sha256 = "f6517411f94a5716ea116ea4f7826ead2d2fffa647cdb81aa31bf9c1176cbae8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-windowsarm64staticdebug.zip",
        sha256 = "3ce118f6a5098986385e231f3b549f10d4c3416d47e9f6d00b0449aee6f8b5aa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-linuxathena.zip",
        sha256 = "035076e188427d364e0d7078aafc670c36cb4b642d738461078f3de860d4f6b0",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-linuxathenastatic.zip",
        sha256 = "d7ebdf8589552640e14fc9c853fd30587b9bfd4150cd0f8f4546d288d427bfc4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-linuxathenadebug.zip",
        sha256 = "91a1ef32d828e0897a1ecac2eb0ca8fbf07ceac32595b5d97f2a371a51ef6a3a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ntcore_ntcore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ntcore/ntcore-cpp/2025.0.0-alpha-2/ntcore-cpp-2025.0.0-alpha-2-linuxathenastaticdebug.zip",
        sha256 = "1db0fb75f90110dfc356ae6145982aacbba247463a24a0a3bd5cfcc13a1f54e7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/ntcore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-headers.zip",
        sha256 = "2ebc42876c673cf999fed214176a2c64940a8eb583e27aa6192c4e41b38ca3ac",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-sources.zip",
        sha256 = "272d4abc1d30058002b7e7075dbacff33edf4e9623bcae0dc5067598ff37f21b",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "50a3da6ae0d586659d6b916b0863846b17534149084f835d05c0ca945e7b1bb3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "ab9d0d8232efdc0a845d6c2f65a2584924cbfaf8cc39f9309cf92ea0ae3b7d93",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "b60e8bef617dbb9caa2cc246f75163cc08a33afd22171b55cd202acc1cd6e7f1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "6a91f14a51d8ea096df6b61bbd5f6fdf8b5071cc4541f6e9a902b9b88e9a31dc",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "ab0b79c28a8f765b2e9d55db3041ee56ec22d3799ab5611ccccb7711cc5638bd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "61e5c778ab1ff3c459c3ea870640213817ab31bdd3b4b218fc60ff63f0a79bef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-linuxarm32static.zip",
        sha256 = "8079e779b3da548ce3cf45ef2a7b93b1d1ae9942c284de0f3a228507b56e61fc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-linuxarm64static.zip",
        sha256 = "ee1f9860ccea28da87c8f17d8a46f6487ba861774c4e93b380c89db0eb520d39",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-linuxx86-64static.zip",
        sha256 = "2dd6ae2c1cbcb28238efb27304f3c33cf3b900a2683f06146cfa217d06b37a8b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-osxuniversalstatic.zip",
        sha256 = "94a422750ad881576b884a1526cf445450250829fabf2101f062c73d2fda4806",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-windowsx86-64static.zip",
        sha256 = "e2790a64041ec69db3691e951fa2be714b0a056363247e739401a07295adc4cd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-windowsarm64static.zip",
        sha256 = "68e2a02e89d42bd7d8d4e7ed33a97f436594af81d837649eba2f7cc4de09911b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-linuxarm32debug.zip",
        sha256 = "a21bf907ed5f20bd211ab15e55a3d216210d2b2115636828cd4557e3f82c8fd4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-linuxarm64debug.zip",
        sha256 = "a0cbae40deb85c058687f56f594f6835287eee33c942f43aba6c4a1e526bc312",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-linuxx86-64debug.zip",
        sha256 = "8a92da9b3546dd8738a7502a6eb143eb1bb961244ff17310b6566088151b9841",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-osxuniversaldebug.zip",
        sha256 = "7c740edd716f18b42633b8ac8861d377a6455e42baf991656779783fc277a71b",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-windowsx86-64debug.zip",
        sha256 = "768bf6102f93fe70e6217929a7412fb6fe588eebf5ddfb94d57840f77d1bbf7e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-windowsarm64debug.zip",
        sha256 = "b73d2759f958035e56b3eeb9ff81c3696c41f88536a14589ef5e4f4057e1a6ad",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-linuxarm32staticdebug.zip",
        sha256 = "e8db07fab9b9bc51c1d18cd057480abc69ef515615bc8bafe369fe28bc714e7a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-linuxarm64staticdebug.zip",
        sha256 = "0c034f56f5827ecf66597fd50d4f9d2e18f9655683715e5865c91001ebcf56b2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-linuxx86-64staticdebug.zip",
        sha256 = "371a0fd9370746a9fc8a50644fc035cbda2a2ceb1057e8f2b491903c58cf457a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-osxuniversalstaticdebug.zip",
        sha256 = "223f5972fad64f2ce131debec9506f233dfaf07716ab8572c053a5b75e988179",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-windowsx86-64staticdebug.zip",
        sha256 = "495d363efbb7f106fb7d989ab1604bf6b3f9967af636b48449ec9c59bdd5f80f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-windowsarm64staticdebug.zip",
        sha256 = "c41229799365967cc585ea81b3e4dfac0fa19fcc992c665f7cc4a196f0fc7fe3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-linuxathena.zip",
        sha256 = "9f61b342ee7e3d9a442d65ea173b1499cf00b4e5761e5b9da5b31837c937a8d9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-linuxathenastatic.zip",
        sha256 = "376ed3675af53652c0a9b9cb6b1e1c97c24ae8da2e90b83772cd712484f50979",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-linuxathenadebug.zip",
        sha256 = "075de108a4dc212953439024809d13687fd1d87c3ce3f5328248f2ef1a9f939b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cscore_cscore-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cscore/cscore-cpp/2025.0.0-alpha-2/cscore-cpp-2025.0.0-alpha-2-linuxathenastaticdebug.zip",
        sha256 = "a59a48e49c48e0dd724c039e503eaa12389a89e2007818a175a8aeb7c4c6dfba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cscore:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-headers.zip",
        sha256 = "8f4038a2b49b5d6f3ee3db2bc1e71306a8cfef0149cf0281a047fc7dfcce5e2a",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-sources.zip",
        sha256 = "3da60730a44971905911e8376f333f8d19579d9c852ecac5c0241d1c51f71106",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "aab505ca7e253aba0fba11bf02e184755127608cefc1bf85ebf1fefd999d68e5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "57c6f1ee2161848fe2c89f80bd9eea30b064bed99bcd5482c2ff130a03181f49",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "736ccc2789ec24825482ad86a06e34c65f0f15ecb491d5bbda9005990df57341",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "4b7411989893a687daabc865e977fe4830550e4c17a8aca6f9c1a8efca42fc1b",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "44ebf7780e7e824889b3b22506d9ff7633f8ddb7288849f0ad0725a5358faa0a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "db0d13f397252345264f670f489cf7d761a1ffbf54754073d31b0eb332642bef",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-linuxarm32static.zip",
        sha256 = "af16c2da85d34d5bee96b31aa47c136badb5dd173e40f8a05a385346587510d4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-linuxarm64static.zip",
        sha256 = "d412b1e0a9c5a7ffa0428b21cbe06340331ca46cd0dd14d67a569fbe0b57abce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-linuxx86-64static.zip",
        sha256 = "3ab3d5f63565dd39daa7cc15638b8a9bfaeedef219dd2abb2a0560670d14129a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-osxuniversalstatic.zip",
        sha256 = "c4f6100292e98f0567a4bf163ea56783618011ea817f4de8120aa6bbeb632bce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-windowsx86-64static.zip",
        sha256 = "b43f82b3c809816c4a2a0cc393a81708cf9dfa09dff54717f7aaee6f81034c7a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-windowsarm64static.zip",
        sha256 = "5ba4c357fd03eb8ca4787421d70cc001e2ebdc41a29e9ef0dd3022046f7fdd87",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-linuxarm32debug.zip",
        sha256 = "b5fb8ddbbdbf403c006167f6d82d782e7e306a25c425c9dde70afe10fe6bca8e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-linuxarm64debug.zip",
        sha256 = "1b8e4e4b3fc0a2e326420e48eb4cf9dbdd26dfadfa560e9bd1a47b74e66a6375",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-linuxx86-64debug.zip",
        sha256 = "f8ba628fd190c97576e720303d370ea477b11b824618f8ac9dbb4de78b02803e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-osxuniversaldebug.zip",
        sha256 = "294845c255907b82e090f23fa93912b12f38e5d0d747c84c43031f340fdbff13",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-windowsx86-64debug.zip",
        sha256 = "ad8052aa5fbcb0e717a87792cdb98661543f8af28140b22a54b9121c1fbd9017",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-windowsarm64debug.zip",
        sha256 = "1123aa5fb18200c0b63519cebd8ec69ecac485c62667ff68b4ab65883bfbfbc8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-linuxarm32staticdebug.zip",
        sha256 = "746fd5710e5ca5fd42549bac65264db71c655237d318ce8814f7d7ac26bda482",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-linuxarm64staticdebug.zip",
        sha256 = "c2022142d5e6be11f3899e7a671f52e02ce8ceb4c3fb3ab0684818e06a04555b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-linuxx86-64staticdebug.zip",
        sha256 = "258fb6180773f732e06324452ba7b20536a4a8beeff568019b775ca9c332b2f3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-osxuniversalstaticdebug.zip",
        sha256 = "fa94f18c4473b36e54dc2864d75f54e36c01f7c248385897a62bbfb42640f892",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-windowsx86-64staticdebug.zip",
        sha256 = "ca52ba38cc0a7af67512daadb1f604ff9634c09a0ba3f1ea179dfcc0e0d6d2df",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-windowsarm64staticdebug.zip",
        sha256 = "5fafc142c4f4b46de67477f96e12c4a7e0944f16c693833aa2ed112ee74b92cd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-linuxathena.zip",
        sha256 = "99a9ee9cf6241097d18b7274aa8bca2c89479d5f7685b988beea674fc7e29f3f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-linuxathenastatic.zip",
        sha256 = "78e36263805aece3ee7aca14120830dcf3075b40b04a79922c7b9f292e7d8101",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-linuxathenadebug.zip",
        sha256 = "8d409e2009bb350d7333dacd707c85d49ca125bd8e6e5132aaa40ef794ddd46f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_cameraserver_cameraserver-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/cameraserver/cameraserver-cpp/2025.0.0-alpha-2/cameraserver-cpp-2025.0.0-alpha-2-linuxathenastaticdebug.zip",
        sha256 = "30badd0da5fcdc90fabd7918bbb457f66b7dc02760cab9774975d92f31e80fc2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/cameraserver:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-headers.zip",
        sha256 = "78dee215afbb859517b5cbbfc8bc597208484e1ae5b951d71bb163efd8122400",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-sources.zip",
        sha256 = "6e328574a0c7f9d9e1ec5525219dc6d7893da1c82bc5c75fd4d23ea4bb6e4e09",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "b1e9a59b3f5f1241146f86af3fa62e0119a0a572b537ca22caaf186666577c55",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "bfacad9614c82caba861317344df0e4201a4acc1cb1d198730fa9e7fb4197150",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "b2043d22be3e8845bf3099968f5feec273e629f9b4edbfd380e517f6abf213ce",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "71bdee8c2fb67f0418ab6133f760e6b0f172b5a4166a0b7c3c2831577ee15d95",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "bba1799fa652fd39cf94e87839b22d42dd94eeb69bd228d3f5b7cae327ffd80c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "cc5d0d57090cdc46e6eab3564325e38e541cfc2a542734e1ad1af7131a3c83b9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-linuxarm32static.zip",
        sha256 = "525ad1db91d3696f3294c4e06481f93c1979641a53bae10a1a85cb3dd1ec6324",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-linuxarm64static.zip",
        sha256 = "ca3e13f9593b739cd245a73d3c98971cbce699bc8ec61f83de4571b044fd9a5a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-linuxx86-64static.zip",
        sha256 = "2276e9f2348c1c2f4e3e5fb0255f55fdf4e4c5a72ea9c76308f8b1800bcd0696",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-osxuniversalstatic.zip",
        sha256 = "4e08209ad9a19522978ac23ab89ed5e41391e12c80119f110d919b12bdd7ec75",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-windowsx86-64static.zip",
        sha256 = "516c5eebdd165d894b4da10fc24c0d7d89da953b097f92b976f77e06bab97287",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-windowsarm64static.zip",
        sha256 = "383440c7d3bd5df494ca3bf903c7e5b756e941a3819fc203682a809f6611fc61",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-linuxarm32debug.zip",
        sha256 = "6908b344710806b6d79b56619aeb08c80553e46de729ee89ca7e3a720d9aaf03",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-linuxarm64debug.zip",
        sha256 = "b27df6c7e541f6453c6c082e760475308157fcf83ca7c70f8043ff05074e1d24",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-linuxx86-64debug.zip",
        sha256 = "d6d35b2dc92c9ad7756456a087f373db8190dc160542683ced80607f85ddabaa",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-osxuniversaldebug.zip",
        sha256 = "b6002518c3ccd95b34483d3d3388cf19a5994390d54b89640a8df553c06ea3fb",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-windowsx86-64debug.zip",
        sha256 = "2d49c4b6e6a584c289bdd5fbdd2c61580cef5f1127c6036cecdba1efa39e75bc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-windowsarm64debug.zip",
        sha256 = "2cedb03824ddc0cd9203908d4a4883154503858bc4f7c62ec1ffdf50fc910044",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-linuxarm32staticdebug.zip",
        sha256 = "667d37104343eaf7a9f5e90fc543121a824d315a57e40ff1a99476bc2880e789",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-linuxarm64staticdebug.zip",
        sha256 = "69bebed1a21d57a1f72d809dd5b231bc2d4a2fb33e25ef01442751d12b0976ed",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-linuxx86-64staticdebug.zip",
        sha256 = "b3b2d58fa0278e7be0cced1a9f8f68efe21792a1ad9e16cc122492269d2bea75",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-osxuniversalstaticdebug.zip",
        sha256 = "a03bac617b3342d0af606148fb0f6384b374c076178164d228d3b2c4c8f1d0d8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-windowsx86-64staticdebug.zip",
        sha256 = "f809f7e263ca49034c4831c371501944f405895511e60f7e1b093a7be6c058f1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-windowsarm64staticdebug.zip",
        sha256 = "0251f4f3ea9bc55ba74725fdbe6e2ba0b554fc5dd46f676908a1c1ed56b8d8d3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-linuxathena.zip",
        sha256 = "9008be441e4a7462ef90104358ab9a70557b112b1be5a6be1732a5dbd0baf00e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-linuxathenastatic.zip",
        sha256 = "6cdaa83297edca5283d7a365756224d7d0ecda768500a990d95ea7c4dc85f9e4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-linuxathenadebug.zip",
        sha256 = "347b7712ac1281b3687436dc98821b2f0d2a0ce045ba37926b2d20432b2156d5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibc_wpilibc-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibc/wpilibc-cpp/2025.0.0-alpha-2/wpilibc-cpp-2025.0.0-alpha-2-linuxathenastaticdebug.zip",
        sha256 = "c3f691ef1aefd94e52bebb6c4dbef1f648bd6ef7f9a0abdb46aba89186f2886a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibc:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-headers.zip",
        sha256 = "2ce63e68315ee00c75fbf491b83d5384803f463d676e537c961749f45ecfa2cb",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-sources.zip",
        sha256 = "4c1f6a6292f9ef355d8dc507515e7b91a570d34b396e23bc05ee6a26dda7e100",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "324ba24701c8124d2636bc0c041985a14a0be807e37ac792776bb80017533e8a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "4bfb05734eb0b8127ab41048953ec64d677c61a9c8243efb8d6dd376f92df06a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "a05204a7e1fed9ccdc98d1e0f95aa54a5d27e43b1180aa259c256f0fc0c6e4ac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "de12817a67bfc117a404f8d656e0f139ff539989bd187195d71d31b963003dc1",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "587458649b0791dcdf9060f630e64a9539ecae918f87946547911ae6d6af4f0c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "7c016609c09d970a2a58bcc00a573ab5ecd16ef3f800c682e9a0d883fafddd30",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-linuxarm32static.zip",
        sha256 = "03089b646c6924deb1894b2f5f916fb5a881fea231516f7eacc7624984693521",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-linuxarm64static.zip",
        sha256 = "e615dfcf0049b111f4c72ea59cc8607611cc0d70f92ed0e35057bf1e2d973500",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-linuxx86-64static.zip",
        sha256 = "c4482bdd1fdbeb356a90bb28854f988189239cefdbbe3e16e0c4aff716b848f1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-osxuniversalstatic.zip",
        sha256 = "fd7de06704e483623d64098332cfbd4ee77b7a0eecc935b6e182c5a91999df88",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-windowsx86-64static.zip",
        sha256 = "859b3855877eb523c71189035e24b29d2f760043e89873f7a10bd9b493465a6b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-windowsarm64static.zip",
        sha256 = "3e77c645ceab60db37247c22e575fbb606e34026ea4878f5737e1aee2e6d0799",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-linuxarm32debug.zip",
        sha256 = "d9c617ce53260d57094a2eca6d17d95df80f3b7f5c42687e1c9c0559f9ef6dfb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-linuxarm64debug.zip",
        sha256 = "65041cbc67af2b3b560582e92c380be63db2c4f20a61c17a24ee8256414bc864",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-linuxx86-64debug.zip",
        sha256 = "d63bcfa1eb811d4a44ba37f1c285ff0d3d38aba48a7366c1e2a70fec708ce222",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-osxuniversaldebug.zip",
        sha256 = "a9ca209195bb8acb1a109d62383ed78f451d2ef1b0e7220d5d45bcbbaf34ce22",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-windowsx86-64debug.zip",
        sha256 = "33a72ef410eb7e0d5135ff09e812ee60258f83eddf680f5470f8d77d2b28745b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-windowsarm64debug.zip",
        sha256 = "0b07bd1007911f9aa00629412f301c441954e5a4c6e0eb74f288f61cf60b1bcc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-linuxarm32staticdebug.zip",
        sha256 = "2616e2d33448e2d6568c18c455cd0ae2d442c392b123be7fc3c23f124913f217",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-linuxarm64staticdebug.zip",
        sha256 = "54c8260adfc9db555719eefec9c97822595123b21f4fcab9301bfbb00c52ef30",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-linuxx86-64staticdebug.zip",
        sha256 = "d69ca2a93b7d048ddc069f1338719f69756750aae3d26bb506d7377862011782",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-osxuniversalstaticdebug.zip",
        sha256 = "67cb271c42a93b81f1e7e651f8299596342d83e45f676b0676699f1e555e5c34",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-windowsx86-64staticdebug.zip",
        sha256 = "229640e8bc7da4bb046caca5fb588b145ebe0641f25373753884b0ba89534a75",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-windowsarm64staticdebug.zip",
        sha256 = "cdd609b562927048a43a43234f24a35c2334c99101b94a5e90ab3330cc27782a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-linuxathena.zip",
        sha256 = "bcade1715d7f696d8b7f43fd88b6fdf5819cf8b0073d4e9b0a18dbeae89e92ba",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-linuxathenastatic.zip",
        sha256 = "b3dc6faa7d3e753bf6879f65b8616ff8e898d4496c6a6883c80518133f8fd4ff",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenadebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-linuxathenadebug.zip",
        sha256 = "51a7b401816c9ded1ebead9b7ea3a0b2340906ea92aa90df2eaebf21a9e97c6e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_wpilibnewcommands_wpilibnewcommands-cpp_linuxathenastaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/wpilibNewCommands/wpilibNewCommands-cpp/2025.0.0-alpha-2/wpilibNewCommands-cpp-2025.0.0-alpha-2-linuxathenastaticdebug.zip",
        sha256 = "507341b6da4a66ecc9f5d9b45e2c20767a8d2a9bde902a720bc3fe1f77b6d5cf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/wpilibNewCommands:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-sources.zip",
        sha256 = "99579ed40e1423205a6ec8dc42fb374d7378b69f45947ee4ee08ca38d4aabc61",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "49b5ccded7e5d2fc7dbbc4c71821fe0caa0572e5b97a805649e7ea928f50f1d8",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "c7274eda489cb3d5280e3749ab7bbef2906edd9af24d68307548265bfd1fd7bf",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "2191fac2a0da0ccb67306c3bfeaac241a45439a8c874ea623e7afc8584e772a5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "50fdbc0d955b4e160228f00587af4bc8c6dbd8a4740f2604bb42407048fec710",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "f78cb104e91391b52a4466baf6445b993e0996a6ab3700ae23e4156c2559c7cb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "49b344d1d01e76e46eb2f401cbd4658588f92d8d1fe73e502c643fb124669acc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-linuxarm32static.zip",
        sha256 = "bfae2001fc3a378bb8c1742bc1260069da721639ab9a226acb8fbd1ca4eda193",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-linuxarm64static.zip",
        sha256 = "ac8cad9267e9f34d20a30d20829dc6f68de61ad559a70585cc5ff6aae4e6f90f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-linuxx86-64static.zip",
        sha256 = "c380093ba1c92b06c4f6cdf992c07244e8528bd50a87ec72323abc03a87c7bb9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-osxuniversalstatic.zip",
        sha256 = "320e7252382850f0059a4642bb864dcc0d5ea4528a1cb04ecfd134c44bb50de3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-windowsx86-64static.zip",
        sha256 = "2df2f4c4934917a75fd47129e1b11a640e6dece771b1bd3649377a4800c2886e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-windowsarm64static.zip",
        sha256 = "fbe0ce27e7d8f15fce8d1ab087ed6a39ff3c8c5740277f232e8fafc03216cb3e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-linuxarm32debug.zip",
        sha256 = "6fcdd36eeff1c45f7778f853f6f77893170e4b4a849377b9aa6980138015a043",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-linuxarm64debug.zip",
        sha256 = "e770f4aa8fe4a144a484efc66a8945df137c6fbea17e5457efd4e404537b043f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-linuxx86-64debug.zip",
        sha256 = "2e907a7ddeab01b8cddf0548002a2d752c0b327217aab44a5676a7ed5e28e91a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-osxuniversaldebug.zip",
        sha256 = "ae2e3ddf82c538bb8c1f6aaccb8a25c511abe9158fb53e7eca76d955de1768c1",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-windowsx86-64debug.zip",
        sha256 = "3f1c7fbeb514149742ddefdecf71a3109097dceb0f3636f1030a4e672a79257e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-windowsarm64debug.zip",
        sha256 = "7e603dd4b99bde90cf909b9400085cd31921942c607f6070e3fb9d79ca18ed45",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-linuxarm32staticdebug.zip",
        sha256 = "9d9eb1baca54f0612010f49b61e02fa96f68abe294c9d6f48cbcf3cd23175775",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-linuxarm64staticdebug.zip",
        sha256 = "3ca4da5e371e18c53af2ed8305cf766e2979f9a4e43b10365bec043a086e25f1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-linuxx86-64staticdebug.zip",
        sha256 = "745d3df7f2e0fbccbd93559079460a0df1497645adf5fdcffbc5245e10a81210",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-osxuniversalstaticdebug.zip",
        sha256 = "25fb2a45e9e1f421d3149875eaa97849770dd5624ed3fde0bd9a6b7af89aa3b1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-windowsx86-64staticdebug.zip",
        sha256 = "3f446bca9f68bc51ab837774f68b434efa8f9da2351df94399f5bc2ac2e844ca",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ds_socket_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ds_socket/2025.0.0-alpha-2/halsim_ds_socket-2025.0.0-alpha-2-windowsarm64staticdebug.zip",
        sha256 = "47561a49056645419650ea7e172357059cd1d128ddd09888900facecf514e7c1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ds_socket:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-sources.zip",
        sha256 = "0a786deeaaa56fa56558b4323caae9686e4caa43c43c07fc67be1223b1694841",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "2cac29bffe059133a888a1c8dcaebb532db31ac6902d51a01af5ad789ff19117",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "9181cce6bea8ae598c89320bfecace383d2e2f6dd853dd8a176ac57bcc92ed0f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "2f7774c4baac04d7ff00c1f557f1103c0265972209403042336d6c260fa7014d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "20e43bac036e84a8b153eb3ff9b4007d1a114a6a19e2e02c48990306964bc7d5",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "b8f47254ca40edc30ab49174bd4723f5f26148a2f52a684a6a94af6437f4d731",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "ba2ecfe47bd3d57eafed82ccfa478270413dbcc796b606bb50563273f59a2513",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-linuxarm32static.zip",
        sha256 = "436cc18f07ade3bc4826262d17fa78e0d5cef41e6762b57ed0d2b3ea3b0a0701",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-linuxarm64static.zip",
        sha256 = "d26070a77341c3f5adba9394cfd10bd52f9901d0237c7f6f3f5a03ec716651d7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-linuxx86-64static.zip",
        sha256 = "163abf846d33638aedb1acddc25106a0f1b5a3b7ebb68f00b4ce8bb09842aefe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-osxuniversalstatic.zip",
        sha256 = "cc90711410b0e2bd7adef41e283c5e448ded80a495a4ce4efc7389d0a4050c7a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-windowsx86-64static.zip",
        sha256 = "09f3e1360721384b4c299e3786d6b92038f8e1bb48d30831138ec116f64e857e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-windowsarm64static.zip",
        sha256 = "19c5a7cbab0ba160b1dc20e57da01461ae3a6080f6cbc8fd259ef971846a9628",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-linuxarm32debug.zip",
        sha256 = "720daf5b41da367437e1d03cc170a69822f3929810af8ad08713d95c62b93afe",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-linuxarm64debug.zip",
        sha256 = "84bcc9931dfb766a4d121f5fb511bc40aafb7df4232d7ef2b8c616d08a25f1a9",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-linuxx86-64debug.zip",
        sha256 = "447f207049b151c36bf0876558c51a90963f3459e2650c0d8d6a03dae4c4df44",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-osxuniversaldebug.zip",
        sha256 = "3f3936dc4d85e81d92eb63d02e4f040d2ff67f5e7a05f2ce68ccce52f4993830",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-windowsx86-64debug.zip",
        sha256 = "3de3c8d2855144535c05443c147bf08507dc9a5d2b2decba717c315dc847f4ee",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-windowsarm64debug.zip",
        sha256 = "625d47a817489273c81ebf82e3d91b8b677c2ec0220e270c07a771595c6bfd0f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-linuxarm32staticdebug.zip",
        sha256 = "10e324416e9879a048fd1210ef3a766889524115f3d406e387d654fc2ab7ae93",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-linuxarm64staticdebug.zip",
        sha256 = "c8c9d4eb537a95a8349dcbc61f1f54d6c2569839dd4ec960c773dcf714c66a8e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-linuxx86-64staticdebug.zip",
        sha256 = "b7c1bb52df2b50fb30aadf43ef02a330f8bd39255c96cd1accaf04c0fd38b5c2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-osxuniversalstaticdebug.zip",
        sha256 = "5db74b092b89c23d8f4f1dfa0616d49c4fd669be4791493e44d81bb9121295e3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-windowsx86-64staticdebug.zip",
        sha256 = "af0ac476cc2f93780f645ba474a0ff26510d92f06634001373035f831b73089b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_gui_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_gui/2025.0.0-alpha-2/halsim_gui-2025.0.0-alpha-2-windowsarm64staticdebug.zip",
        sha256 = "b10057fdacf1d71ab344699623a20655ec83d8a0d3924b2758ecb16e90800f68",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_gui:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-sources.zip",
        sha256 = "700da967f4e94c69d40029391c3f01f34fbc072478eb8a13c98de6a0c6f33eb2",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "271de5c68836aac5b8694a04b62b2c1de92d2c3fce9cc65b068fef1986a44030",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "bbef9da391c364133ba69977516b951e6904e0f0251ca2924007a07699814618",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "3df4188b1332472224fd68d7173a9d94113205349b0ed6e8239851a30451c1d4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "488937ce893596515c0967305d72f87c4f898d4a2a00ab5c7c2f0325818496e9",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "c6d7ebc8ace054988fa93856ba15329efae406c4730bd05db0bd174be98ca2ac",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "32f0c08c58eee61a66b28f3562f502684b6be880b96c4e32faa6d248fbee0e73",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-linuxarm32static.zip",
        sha256 = "b962efde1d35ef3ee024a5b08d3c6418926e8e1d25eb0a7c18d2008afc071ddb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-linuxarm64static.zip",
        sha256 = "746f4c0ba3be245acd767f8cb084f8ffc018887dd69bfb101bc972cd641a1a18",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-linuxx86-64static.zip",
        sha256 = "a1769aeb4ad465f8b0ee0eb86dbfd9a1e8b60873dc97cb35b7a514e0841d4a36",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-osxuniversalstatic.zip",
        sha256 = "6ef8de7139957c5278b567f062a278d4d53406f38667e4ec44b464ccb1a64cd2",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-windowsx86-64static.zip",
        sha256 = "de1153263e80f92c06e6c1cf44fe0d9ff1ff40a64e261fa0c901e7996ad2b5b7",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-windowsarm64static.zip",
        sha256 = "b8d9b538108506b8661f53dba08ad2a6704dc898617f151ab7f2a9a54c144236",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-linuxarm32debug.zip",
        sha256 = "bb296179db3bc476fd17c16057bc243b083f5f1e9fd58814d0ff58b9142238bc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-linuxarm64debug.zip",
        sha256 = "3aa9f8cac506d9bc56e311ddd1f1a8cf9357f9d30a1cfeb32731c5059a655c56",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-linuxx86-64debug.zip",
        sha256 = "f467a083398d60af1705f82504d2c11795abaa160b02740d4ad522917887192a",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-osxuniversaldebug.zip",
        sha256 = "24087f02b134cbb6560931b0303bb45502b5b1990bc59e857c1b56e5d4de0435",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-windowsx86-64debug.zip",
        sha256 = "5856e2ba6c32b93f03cd9aa51ca8ce1295211a5b3850f10b5e967c9164d4d592",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-windowsarm64debug.zip",
        sha256 = "62fdf492305c2f81b98ab81409c6af64466e440da6df95a27fbfa0c52acca86b",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-linuxarm32staticdebug.zip",
        sha256 = "712d28fc28c9f2097382a9e34ae9f3972c679a5dac7009795c1a086768181d58",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-linuxarm64staticdebug.zip",
        sha256 = "93dcb6a982c5d73c69ece534423fa8a4228facc46fe8a68828ba53bb12adb4d5",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-linuxx86-64staticdebug.zip",
        sha256 = "72cca82caaba3787b67469fd72b8b5f09a215e4b5b6c9b4d293a682dbdfd2965",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-osxuniversalstaticdebug.zip",
        sha256 = "1bff9ca779d586ec93e3e1e3dcef6855f72e41a3d6fd6cb7b36b05f91c8fdb87",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-windowsx86-64staticdebug.zip",
        sha256 = "de2ab4a68cf013fccaa08bcaf976bb13d15f66f1630ffa3ced4fcc544885a50c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_client_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_client/2025.0.0-alpha-2/halsim_ws_client-2025.0.0-alpha-2-windowsarm64staticdebug.zip",
        sha256 = "b94e28623818f51ff2b7ea3f0615db910da52608987ee3bd97993b188161167c",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_client:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-sources.zip",
        sha256 = "8eb3782664b00123c5d64c92f3c9d471a4846c750db13a03b61a8d46807f4927",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "d6aed36b3b128597eedef3aeee982f609e1c854eb3addec9ba39b54e890c6496",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "2d6b7da69c476f809e9323925852588b8b6399e60e7823fcf400e634f8836bdb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "0439855280b8336f141c5399d7181a41fb2570a1700ccc76572d9e160f3e3560",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "82b748d1b5f845de2a1b5fc9e5289c6cc1e316c336282947fe6089a101217386",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "008846485e9911f0db6bd97907049ef697a5fdb9a01921485f3e982c4a5919e6",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "3a36e27d205138b4fe345d0bab22d4793be010d9a34ea766599d3b0bb7f1f004",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-linuxarm32static.zip",
        sha256 = "d720aad455110f20c1592a4aecdf958ed646c2e39b8bee9d19216289a2850d8f",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-linuxarm64static.zip",
        sha256 = "7679afc6559aba3176fe64ff5b0b96fe44d34ef3595c15baf5676e069ebfa8d1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-linuxx86-64static.zip",
        sha256 = "f8c03baf7378c8805ce3a14693088d91c70c49746a948d0b355e7f49106c0541",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-osxuniversalstatic.zip",
        sha256 = "4fdaabdf8141b2bf4af3078a72bede47ce7b2758551b82b7d849a3ee75b9fdbd",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-windowsx86-64static.zip",
        sha256 = "146d822bf98687f6d18e95ab145859985d7dd63d9a3ac6d7c316161375bea68e",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-windowsarm64static.zip",
        sha256 = "9c48f4a3c4c7074fc61d5f07fdc7f898d863537b75b2ad0acaed3325d047f52d",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-linuxarm32debug.zip",
        sha256 = "80290f59a5ae1dfdc2b94159d8d761c93bfc29d2225a18cbfdac5443a9cb34f3",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-linuxarm64debug.zip",
        sha256 = "919d3e6b9f66989715f611b38f488d93173a2e6bc95a66c7aec62098098307fb",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-linuxx86-64debug.zip",
        sha256 = "86c784cb52ae1fb4dfe1c0de38b0da4964666959a93027c17601f72db1e09ba4",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversaldebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-osxuniversaldebug.zip",
        sha256 = "4502ab789f8a971039a0fdd32a311e21ae6cdf0b2c33dc90147a5f9416a80bae",
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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-windowsx86-64debug.zip",
        sha256 = "73b4f4b615f72944018529bdb15de600f2829a43acc2bc4c8d501939da7646a1",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64debug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-windowsarm64debug.zip",
        sha256 = "ff17d56fbdf57913fe3793a2e656fe20f53bbc38a7b81a77a6ea26bcd1c12e70",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-linuxarm32staticdebug.zip",
        sha256 = "de246cd885c9bdfee4ff403aff2d592ea326f65c689362b6875cdfe4f0ebf3ab",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-linuxarm64staticdebug.zip",
        sha256 = "5fdbcb8073d7d73dda2080f59cbe60c6559c81453df7955221be7d6e92915816",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-linuxx86-64staticdebug.zip",
        sha256 = "cb4a7ae5355ce14f313024775722659406a06d0235a685b577d5b091c4dec167",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-osxuniversalstaticdebug.zip",
        sha256 = "0ba6685b1939e5e8cd1e20f1aa631e962a8ff18490edb3c069ec8c8880234e53",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-windowsx86-64staticdebug.zip",
        sha256 = "1bccb0cb4c5d4117b1d849bb5fe7ad626aa5f55632edf304999aba16d45965dc",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_halsim_halsim_ws_server_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/halsim/halsim_ws_server/2025.0.0-alpha-2/halsim_ws_server-2025.0.0-alpha-2-windowsarm64staticdebug.zip",
        sha256 = "d209a27bb3738423806c6ed24f63773879dd33352a037d7f2d47bbf1266fa486",
        build_file = "@bzlmodrio-allwpilib//private/cpp/halsim_ws_server:static.BUILD.bazel",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.3.2/SmartDashboard-2024.3.2-linuxx64.jar",
        sha256 = "91b7905d3312f19d062a21fb6c3edb8fc16c5f84a6ec5c6889b176dab84ee61b",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.3.2/SmartDashboard-2024.3.2-macx64.jar",
        sha256 = "05e7c4e6d064bf4a4ddabbfe81c5c0cf8c0836bc8ae1f008d76bcd501292ae60",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_smartdashboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SmartDashboard/2024.3.2/SmartDashboard-2024.3.2-winx64.jar",
        sha256 = "66e1fc74b03ffa9c74cfa03d5948495480c9ab0fd2ab3fda241791b894c83468",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.0.0-alpha-2/PathWeaver-2025.0.0-alpha-2-linuxarm32.jar",
        sha256 = "ded2ddfce12bddaae621a41dd3e86203a58b1b77757a4751d57cb88816a7a3ad",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.0.0-alpha-2/PathWeaver-2025.0.0-alpha-2-linuxarm64.jar",
        sha256 = "3427f66719a287d16096e3506c185101022fd507aeadc9b1ce2e17aa9f651bca",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.0.0-alpha-2/PathWeaver-2025.0.0-alpha-2-linuxx64.jar",
        sha256 = "02f1cbbd612e94c9d2a35513fe09e4896cf30cda243052288015c9686c2eed72",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.0.0-alpha-2/PathWeaver-2025.0.0-alpha-2-macx64.jar",
        sha256 = "11970ac47ad5abc0d975b9587b09ad1291575c963790d42c737a5891b8b0431d",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_pathweaver_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/PathWeaver/2025.0.0-alpha-2/PathWeaver-2025.0.0-alpha-2-winx64.jar",
        sha256 = "e714ca5d6cd1e4b23a1f4a02ab643a469b1dfdaad699ee714f19940ad9c1bc10",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_robotbuilder",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/RobotBuilder/2025.0.0-alpha-2/RobotBuilder-2025.0.0-alpha-2.jar",
        sha256 = "6d963734a3dfb757fa9591107b08ff647d704074f163b0519ddaae4e028a24fd",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.0.0-alpha-2/Shuffleboard-2025.0.0-alpha-2-linuxarm32.jar",
        sha256 = "0f6e183808402b07d013164f013e98b0575a535f9cf963c72325ca303c04c657",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.0.0-alpha-2/Shuffleboard-2025.0.0-alpha-2-linuxarm64.jar",
        sha256 = "b4212c98a80ef0d8de68e46e94ddbe7524e9056d23eb33ce388b9e94af254e64",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_linuxx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.0.0-alpha-2/Shuffleboard-2025.0.0-alpha-2-linuxx64.jar",
        sha256 = "f37e0cdddf93345be15c52b3c93680f33507525a28b8508034758ad0214609b3",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.0.0-alpha-2/Shuffleboard-2025.0.0-alpha-2-macarm64.jar",
        sha256 = "7471696c563a53c2c2eba0a2477a227feec7ef1a8ac02035c2ef41db9592ef5d",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_macx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.0.0-alpha-2/Shuffleboard-2025.0.0-alpha-2-macx64.jar",
        sha256 = "b4bf4e420b9ed049179ef41a49be54bbc49905390582b3401474110441bf3f6b",
    )
    maybe(
        http_jar,
        name = "bazelrio_edu_wpi_first_tools_shuffleboard_winx64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Shuffleboard/2025.0.0-alpha-2/Shuffleboard-2025.0.0-alpha-2-winx64.jar",
        sha256 = "1d21fcbe4c042d2fdd762ca3b49615e633b65e661ea245d43c6146ab01bcf6cd",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.0.0-alpha-2/Glass-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "837ae2936cd57511946c16574dbdda5224ac726d8a7c38fdae38a89f9ca17146",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.0.0-alpha-2/Glass-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "0cbe180b71cf516d4bb22b3e602bc65e92cd3b78300aa11737317a15887eb970",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.0.0-alpha-2/Glass-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "79a51b36772e4937b066ae8dac14afbeed24b26ca7a6abccc8d04a6fff269379",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.0.0-alpha-2/Glass-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "87ff8b16bfe7ae7f7a1fc0dff25a45275e58be81ad2e869d714ccec2cdf1efc2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.0.0-alpha-2/Glass-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "64a71611fa0e5a10bc778e05bc23f641838f1d2726351cc3629d60cc63b2cfe9",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_glass_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/Glass/2025.0.0-alpha-2/Glass-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "f2e47e869563654bbc6214ca0996765dd9f34d7bae81aea29f5a3cb373b44425",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.0.0-alpha-2/OutlineViewer-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "35e15f23046649cb2a439e81ffefe347172ff021402d68c68506b4df0030963d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.0.0-alpha-2/OutlineViewer-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "be981a12f014ab30e35049698c9a4c771258b51456f027d23f59f4de67727660",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.0.0-alpha-2/OutlineViewer-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "cf393ece41900ed2c411ecc377e1f68d1ffeaeebed4ea8270b7b79854055e0f3",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.0.0-alpha-2/OutlineViewer-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "c6af0c5942d6339f2293007db02318da7d4c1c34d635cdeb07e20ebfdbc09f23",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.0.0-alpha-2/OutlineViewer-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "c20cd29e7b1be1cbaf537db947482df9e96cd2c60c123b5393247e33c191c6d3",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_outlineviewer_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/OutlineViewer/2025.0.0-alpha-2/OutlineViewer-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "da7413fbeca5172fd856076ab6a328cd0cf496e88dd139efbdf9d82243e91ad2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.0.0-alpha-2/roboRIOTeamNumberSetter-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "992a4d3b0e485c9544696889a924a5169467c9a1764bc5eb2375536047eaf96d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.0.0-alpha-2/roboRIOTeamNumberSetter-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "aefc202c8353af3d7c40d6fab42419f6d58afc806b321e3195d19b83c4d75b58",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.0.0-alpha-2/roboRIOTeamNumberSetter-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "2d74958fef338817ccfd8a709cbf4adb915c3b9171be5a759bd7d617fdbb0791",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.0.0-alpha-2/roboRIOTeamNumberSetter-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "18add09860ccd4cf97bf7c3d7c4671dd19a2916ea3ed82a6f638b98a50419ff0",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.0.0-alpha-2/roboRIOTeamNumberSetter-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "bfa63411a03d2e9810d8acf8158cc3631b1828ffa7e74efb79898baed61ec704",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_roborioteamnumbersetter_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/roboRIOTeamNumberSetter/2025.0.0-alpha-2/roboRIOTeamNumberSetter-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "2b6d71b9b3cbce81831684ec8d4083f34bfeeeb7ee2bf7ebb767a8543b047cb6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm32",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.0.0-alpha-2/DataLogTool-2025.0.0-alpha-2-linuxarm32.zip",
        sha256 = "f079a791cef857d33e3a6db35ae869447244b6fb727fc82c9e480b1880811f6d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.0.0-alpha-2/DataLogTool-2025.0.0-alpha-2-linuxarm64.zip",
        sha256 = "668cadff658d985fb2eef992467dfe835a91771a216aaa28c17cd1f8995de2f9",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.0.0-alpha-2/DataLogTool-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "69554eb08fd5eaea4e47e82e5c62ac2ee4af814dd13b6c2f4f569b9b57e0e46d",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.0.0-alpha-2/DataLogTool-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "b33cb37538f779d6eb2addb7927e62810d2d8072709f673aa21bfb3d54859435",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.0.0-alpha-2/DataLogTool-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "95c1f47b0e4ad21e124536f409d6c14a6d265f4a5138f2293b199023c07034a7",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_datalogtool_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/DataLogTool/2025.0.0-alpha-2/DataLogTool-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "f2e324c635d7504a0d038bad1e326f42ec5c2057ddb3bb937a1f950222d1e4e2",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_linuxx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.0.0-alpha-2/SysId-2025.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "5824d3157e4674a2490a466ed0288332a5c00e09a0b9c80f281feeb913064135",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_osxuniversal",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.0.0-alpha-2/SysId-2025.0.0-alpha-2-osxuniversal.zip",
        sha256 = "6007d1c74a73a423795036b9e835d8f90cb614c3765dd57cb33502f4cdd2059b",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsx86-64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.0.0-alpha-2/SysId-2025.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "a1c34c42dbdb8e741f7cab8873139de31347b3aa12964dfb39a6d0df851ad9e6",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )
    maybe(
        http_archive,
        name = "bazelrio_edu_wpi_first_tools_sysid_windowsarm64",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/tools/SysId/2025.0.0-alpha-2/SysId-2025.0.0-alpha-2-windowsarm64.zip",
        sha256 = "2df1c1bc3f44355cfc8bbc4889c7cf9014ab89d79e5489a708703d7fada4670a",
        build_file_content = "filegroup(name='all', srcs=glob(['**']), visibility=['//visibility:public'])",
    )

def setup_legacy_bzlmodrio_allwpilib_cpp_dependencies():
    __setup_bzlmodrio_allwpilib_cpp_dependencies(None)

setup_bzlmodrio_allwpilib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_cpp_dependencies,
)
