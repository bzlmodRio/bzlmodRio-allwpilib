load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiutil_wpiutil_java",
        artifact = "edu.wpi.first.wpiutil:wpiutil-java:2025.0.0-alpha-2",
        artifact_sha256 = "3df9ce71bf47c4a09b7b7f64e915326948163d284a8cb24c3ad04cd4739d8b00",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpinet_wpinet_java",
        artifact = "edu.wpi.first.wpinet:wpinet-java:2025.0.0-alpha-2",
        artifact_sha256 = "9cde6b7183fa5a0939ef33807e9521e74cd50408a73148543d2187dd5c85f45a",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiunits_wpiunits_java",
        artifact = "edu.wpi.first.wpiunits:wpiunits-java:2025.0.0-alpha-2",
        artifact_sha256 = "ab01637a5a7de7bfd09903d7e937db3eec91c72ac7ca314319fd0d9993f10b24",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpimath_wpimath_java",
        artifact = "edu.wpi.first.wpimath:wpimath-java:2025.0.0-alpha-2",
        artifact_sha256 = "fb191a2102310a3183bab5e82e98b5f2b8a65bcf4add250c74beea8e53c3add0",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_apriltag_apriltag_java",
        artifact = "edu.wpi.first.apriltag:apriltag-java:2025.0.0-alpha-2",
        artifact_sha256 = "d2c5619e4b7dd8751fac2ed09c96a546ce9df6278f7f8587dc1b51c2d92150d9",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_hal_hal_java",
        artifact = "edu.wpi.first.hal:hal-java:2025.0.0-alpha-2",
        artifact_sha256 = "a3f3813676a84a957b7cb2fd04583668c9fec5fae85d86a234b543c12e6c7210",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_ntcore_ntcore_java",
        artifact = "edu.wpi.first.ntcore:ntcore-java:2025.0.0-alpha-2",
        artifact_sha256 = "11f24f72f1d057c7977830389b672f1fadacb49b79b342901f083c0aa0f38fd0",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cscore_cscore_java",
        artifact = "edu.wpi.first.cscore:cscore-java:2025.0.0-alpha-2",
        artifact_sha256 = "deab647d457f96d39f95ba20341cc1efa47b1c90ee7dba791911352559502845",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cameraserver_cameraserver_java",
        artifact = "edu.wpi.first.cameraserver:cameraserver-java:2025.0.0-alpha-2",
        artifact_sha256 = "817343314b987987726007475fd79a0c47eb4097e73020fe3bdc7ed37775213c",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibj_wpilibj_java",
        artifact = "edu.wpi.first.wpilibj:wpilibj-java:2025.0.0-alpha-2",
        artifact_sha256 = "a33d744ff2481946350ea2524719311d0a034a5195596e088fc2174cd6822c3d",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibnewcommands_wpilibnewcommands_java",
        artifact = "edu.wpi.first.wpilibNewCommands:wpilibNewCommands-java:2025.0.0-alpha-2",
        artifact_sha256 = "6ea25b941f3e28f0d694c144a72c0b8d7782e5d8fdeea94e336439c2315ec3e5",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_fieldimages_fieldimages_java",
        artifact = "edu.wpi.first.fieldImages:fieldImages-java:2025.0.0-alpha-2",
        artifact_sha256 = "aa2952b5f084a0519d463cd365aac82112000b160c253d7cc60471b7904621fa",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_shuffleboard_api",
        artifact = "edu.wpi.first.shuffleboard:api:2025.0.0-alpha-2",
        artifact_sha256 = "a46c73bae248414cce102e595bd0b8f691a653f1c694c57edb519ac5dbf0d757",
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
