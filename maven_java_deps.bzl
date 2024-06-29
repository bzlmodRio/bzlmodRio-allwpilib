load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiutil_wpiutil_java",
        artifact = "edu.wpi.first.wpiutil:wpiutil-java:2025.0.0-alpha-1",
        artifact_sha256 = "02b2e07a88087380dca46b0c09741ed22a6dfabe356dacd8e50969a70f22878f",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpinet_wpinet_java",
        artifact = "edu.wpi.first.wpinet:wpinet-java:2025.0.0-alpha-1",
        artifact_sha256 = "459dc61e2bd5898307b82b86c595ee7ef69f8eb6db3fad254dd27fe9df52d8dc",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiunits_wpiunits_java",
        artifact = "edu.wpi.first.wpiunits:wpiunits-java:2025.0.0-alpha-1",
        artifact_sha256 = "767b4028f3872bea0d67bd1923f6248ef3bead4c84019c0dcaf18d06908bfeff",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpimath_wpimath_java",
        artifact = "edu.wpi.first.wpimath:wpimath-java:2025.0.0-alpha-1",
        artifact_sha256 = "df35b2963f17591ffe74fe17649c561ccb647636f588fc809581865513084125",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_apriltag_apriltag_java",
        artifact = "edu.wpi.first.apriltag:apriltag-java:2025.0.0-alpha-1",
        artifact_sha256 = "46bdbdbc4334b2ac6fb330d3f25fe509fb9e880cd5a1080093363ede7a83544e",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_hal_hal_java",
        artifact = "edu.wpi.first.hal:hal-java:2025.0.0-alpha-1",
        artifact_sha256 = "baefffc52d40a138bc049bdfb5b06018fab63dd346b6341da49418a96464cf2b",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_ntcore_ntcore_java",
        artifact = "edu.wpi.first.ntcore:ntcore-java:2025.0.0-alpha-1",
        artifact_sha256 = "a2e82426060cff97f3776ed2e3f2f16387a50ef4ab02c095ca82debfd7b8a6e9",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cscore_cscore_java",
        artifact = "edu.wpi.first.cscore:cscore-java:2025.0.0-alpha-1",
        artifact_sha256 = "9a3ca2bcafd7624599fc0c3ec5b0711c16afa24057af1d6cc7b0cac7dafa7670",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cameraserver_cameraserver_java",
        artifact = "edu.wpi.first.cameraserver:cameraserver-java:2025.0.0-alpha-1",
        artifact_sha256 = "e75cda390eb811c366fa85187c583277c290a763a59ac5a04280c650ab5fbc36",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibj_wpilibj_java",
        artifact = "edu.wpi.first.wpilibj:wpilibj-java:2025.0.0-alpha-1",
        artifact_sha256 = "d47e05be3b3040e8391949b5335d717de8876b8320c3761a94844ceb9b06d396",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibnewcommands_wpilibnewcommands_java",
        artifact = "edu.wpi.first.wpilibNewCommands:wpilibNewCommands-java:2025.0.0-alpha-1",
        artifact_sha256 = "26a49279458fea93276b4d2076d787bc8d8edef31b04da15bfb47c26141b55da",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_fieldimages_fieldimages_java",
        artifact = "edu.wpi.first.fieldImages:fieldImages-java:2025.0.0-alpha-1",
        artifact_sha256 = "7840c00a5d6b09357d4ce0f89d9c671ea81e96969452b7d94aa13bc32dde60e9",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )

def setup_legacy_bzlmodrio_allwpilib_java_dependencies():
    __setup_bzlmodrio_allwpilib_java_dependencies(None)

setup_bzlmodrio_allwpilib_java_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_java_dependencies,
)

def get_bzlmodrio_allwpilib_java_dependencies():
    artifacts = [
        "com.fasterxml.jackson.core:jackson-annotations:2.15.2",
        "com.fasterxml.jackson.core:jackson-core:2.15.2",
        "com.fasterxml.jackson.core:jackson-databind:2.15.2",
        "org.ejml:ejml-simple:0.43.1",
        "us.hebi.quickbuf:quickbuf-runtime:1.3.2",
    ]
    repositories = [
        "https://repo1.maven.org/maven2",
        "https://frcmaven.wpi.edu/release",
    ]

    return artifacts, repositories
