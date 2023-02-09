load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiutil_wpiutil_java",
        artifact = "edu.wpi.first.wpiutil:wpiutil-java:2023.3.2",
        artifact_sha256 = "19b7494dbe1f02d922d9c6730b79fe4959fad971798d98d4ec8b61d58cf46f7a",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpinet_wpinet_java",
        artifact = "edu.wpi.first.wpinet:wpinet-java:2023.3.2",
        artifact_sha256 = "3c883d897a240120bbed5d76bf13ce1f93b1dc8837f1940f95712c4ac5bf0c29",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpimath_wpimath_java",
        artifact = "edu.wpi.first.wpimath:wpimath-java:2023.3.2",
        artifact_sha256 = "049ed68eb977612ea0ab54b6cbe3dd3d948a714a5097a26dfaeaaf55ef0d7cde",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_apriltag_apriltag_java",
        artifact = "edu.wpi.first.apriltag:apriltag-java:2023.3.2",
        artifact_sha256 = "ba63c87b2018f27bfda98bb54c5fbfcf736e69f9b41e833ef667a28dd7b71f1d",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_hal_hal_java",
        artifact = "edu.wpi.first.hal:hal-java:2023.3.2",
        artifact_sha256 = "0b07b49c445fba3a205b1c9b34a04fe2fc9fbc65799add0eff3ab7be57f5c042",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_ntcore_ntcore_java",
        artifact = "edu.wpi.first.ntcore:ntcore-java:2023.3.2",
        artifact_sha256 = "0e2871bf97dc3578f87912eff674c4968565e6760d3445c5158dde9f13d22f10",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cscore_cscore_java",
        artifact = "edu.wpi.first.cscore:cscore-java:2023.3.2",
        artifact_sha256 = "53dd1ec1be8ad58245b2bb5880c20d5771aa93bb3e247a3f7580851c226df7d3",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cameraserver_cameraserver_java",
        artifact = "edu.wpi.first.cameraserver:cameraserver-java:2023.3.2",
        artifact_sha256 = "cf2577aa0cc9cf289c64b172af02e0bbcb9720ad3b23323a56b84d208bc8cdb0",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibj_wpilibj_java",
        artifact = "edu.wpi.first.wpilibj:wpilibj-java:2023.3.2",
        artifact_sha256 = "27a124604cc5a76bc7d3e66d64f0c6463e9ffbec24e27385acc3589c15d2f7cf",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibnewcommands_wpilibnewcommands_java",
        artifact = "edu.wpi.first.wpilibNewCommands:wpilibNewCommands-java:2023.3.2",
        artifact_sha256 = "0c4b49075d1399bb6025fa9e65cd1553a0f6ed5bc5f83ced482ff3570b042a6d",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_fieldimages_fieldimages_java",
        artifact = "edu.wpi.first.fieldImages:fieldImages-java:2023.3.2",
        artifact_sha256 = "f8573299507c59da8b39778d92bce2e8353bc3d3d6802c61e20404dc9a842d36",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_shuffleboard_api",
        artifact = "edu.wpi.first.shuffleboard:api:2023.3.2",
        artifact_sha256 = "c575f72841c933eedfe19d01a72c7016fc48516e1b52bc16c10ce704ca1f27cd",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )

def setup_legacy_bzlmodrio_allwpilib_java_dependencies():
    __setup_bzlmodrio_allwpilib_java_dependencies(None)

setup_bzlmodrio_allwpilib_java_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_java_dependencies,
)

def get_bzlmodrio_allwpilib_java_dependencies():
    artifacts = [
        "com.fasterxml.jackson.core:jackson-annotations:2.12.4",
        "com.fasterxml.jackson.core:jackson-core:2.12.4",
        "com.fasterxml.jackson.core:jackson-databind:2.12.4",
        "org.ejml:ejml-simple:0.41",
    ]
    repositories = [
        "https://repo1.maven.org/maven2",
        "https://frcmaven.wpi.edu/release",
    ]

    return artifacts, repositories
