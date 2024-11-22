load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiutil_wpiutil_java",
        artifact = "edu.wpi.first.wpiutil:wpiutil-java:2025.1.1-beta-2",
        artifact_sha256 = "907bbb67db9fc7743668b57e67cdb890dd76dd10b414fd35851969ce668f71ed",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpinet_wpinet_java",
        artifact = "edu.wpi.first.wpinet:wpinet-java:2025.1.1-beta-2",
        artifact_sha256 = "fef62c4bc868b012106c58c7323b20acd18702d84574c9e2866774a2a37f58c2",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiunits_wpiunits_java",
        artifact = "edu.wpi.first.wpiunits:wpiunits-java:2025.1.1-beta-2",
        artifact_sha256 = "25e59af643450eb43a2d0f284d6b41ee5bfb6ae1331603e9359420f27251fb16",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpimath_wpimath_java",
        artifact = "edu.wpi.first.wpimath:wpimath-java:2025.1.1-beta-2",
        artifact_sha256 = "c10cd8aff2bf4c75b6f505db846c087721b54d5928dff513ad0d34a1bed677b2",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_apriltag_apriltag_java",
        artifact = "edu.wpi.first.apriltag:apriltag-java:2025.1.1-beta-2",
        artifact_sha256 = "d98358cac944717ab955f7d2786d834a8ab3b6c65481b3876d89f91b365ee61d",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_hal_hal_java",
        artifact = "edu.wpi.first.hal:hal-java:2025.1.1-beta-2",
        artifact_sha256 = "ce37dac4f361a9a6735bf08b3710300be8cfe915fe31b9e533afdd02fe8dfd99",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_ntcore_ntcore_java",
        artifact = "edu.wpi.first.ntcore:ntcore-java:2025.1.1-beta-2",
        artifact_sha256 = "9dbf21028d56692bbfe7f0cf42befb29b9ae64bf29bf82cc8ded229196d1e1e8",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cscore_cscore_java",
        artifact = "edu.wpi.first.cscore:cscore-java:2025.1.1-beta-2",
        artifact_sha256 = "3889f1a05b922941149b81ab0ec88e83e619e6c4061192ce8acba5f20cc5ca46",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cameraserver_cameraserver_java",
        artifact = "edu.wpi.first.cameraserver:cameraserver-java:2025.1.1-beta-2",
        artifact_sha256 = "5fd1e0de818213a3b8a9eb688b950d24cfba41d5326878943ae76ce93c7b2e23",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibj_wpilibj_java",
        artifact = "edu.wpi.first.wpilibj:wpilibj-java:2025.1.1-beta-2",
        artifact_sha256 = "41b00a72c565a9c8c48e79ad1667bfeb446a8ae47e4a3061aeaa8072f8dd3a09",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibnewcommands_wpilibnewcommands_java",
        artifact = "edu.wpi.first.wpilibNewCommands:wpilibNewCommands-java:2025.1.1-beta-2",
        artifact_sha256 = "2e3f645297bccaa86ac31192d94278237b2efa47ae914c26bb35cf6a6c16911c",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_fieldimages_fieldimages_java",
        artifact = "edu.wpi.first.fieldImages:fieldImages-java:2025.1.1-beta-2",
        artifact_sha256 = "2538d1dca7a0a34dcf99435e892fecb203c096d6386505832590a471571b1207",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_shuffleboard_api",
        artifact = "edu.wpi.first.shuffleboard:api:2025.1.1-beta-2",
        artifact_sha256 = "a1e8e32e191f047dc4d904c115a3cf6a67ddbac2317e3eee918fb4b618ef44d8",
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
