load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiutil_wpiutil_java",
        artifact = "edu.wpi.first.wpiutil:wpiutil-java:2024.1.1",
        artifact_sha256 = "0d997c32734e852a1c0bed1e50be8d439f349fe576da599d594b82b7d4eae445",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpinet_wpinet_java",
        artifact = "edu.wpi.first.wpinet:wpinet-java:2024.1.1",
        artifact_sha256 = "b321f22ad8c101181af284769f92efb03ee8163d586ed2ad5fc979dfd58d1f09",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiunits_wpiunits_java",
        artifact = "edu.wpi.first.wpiunits:wpiunits-java:2024.1.1",
        artifact_sha256 = "a35104c0e2b7c4c6f13faecd85486c1e3ff2fa57d6b05178a5c5c356e4d5cd72",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpimath_wpimath_java",
        artifact = "edu.wpi.first.wpimath:wpimath-java:2024.1.1",
        artifact_sha256 = "7a67ea3aea760498a7612e14600012718b3343e1966f32ffac95cd5baaf8a565",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_apriltag_apriltag_java",
        artifact = "edu.wpi.first.apriltag:apriltag-java:2024.1.1",
        artifact_sha256 = "92a818056acac76239b5af6f6185d4d202b90b7d9d90dd61469682518671c6a2",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_hal_hal_java",
        artifact = "edu.wpi.first.hal:hal-java:2024.1.1",
        artifact_sha256 = "584493189ea1efce06913c7fa28b923261557d8d8a937701801519673f8120a6",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_ntcore_ntcore_java",
        artifact = "edu.wpi.first.ntcore:ntcore-java:2024.1.1",
        artifact_sha256 = "eaaa4748f402e9f3c9e0a01cdd16ef97473f57bfe3316d0c0bae6664b4d76f54",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cscore_cscore_java",
        artifact = "edu.wpi.first.cscore:cscore-java:2024.1.1",
        artifact_sha256 = "7e5d44fe1becb274b9dc3eb65cd919f025513bfc4a69a7f47ecfdba276669eae",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cameraserver_cameraserver_java",
        artifact = "edu.wpi.first.cameraserver:cameraserver-java:2024.1.1",
        artifact_sha256 = "b8b484d6c8952c303590b6b5ded7ab9d0734fe2cd643281bc25ea6ff9503a0d1",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibj_wpilibj_java",
        artifact = "edu.wpi.first.wpilibj:wpilibj-java:2024.1.1",
        artifact_sha256 = "540acaf821fbca6cfd98e8963c96ba0408232b51ecbf1b0682927b6fd5acf858",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibnewcommands_wpilibnewcommands_java",
        artifact = "edu.wpi.first.wpilibNewCommands:wpilibNewCommands-java:2024.1.1",
        artifact_sha256 = "8eba5e4887b6c78c97ceca0c0ad424c2d93a3f9fa32aec2843b53e39ff7c6515",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_fieldimages_fieldimages_java",
        artifact = "edu.wpi.first.fieldImages:fieldImages-java:2024.1.1",
        artifact_sha256 = "e90498ef25654d43a6b7d6eb7074ffadc74ebfe3e6384cd3df70c0ef290da011",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_shuffleboard_api",
        artifact = "edu.wpi.first.shuffleboard:api:2024.1.1",
        artifact_sha256 = "fd6f2cff6b040ea9c074ded0801a2010279c37f1c73b95de54c351c7c679de6e",
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
