load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiutil_wpiutil_java",
        artifact = "edu.wpi.first.wpiutil:wpiutil-java:2027.0.0-alpha-1",
        artifact_sha256 = "e89981fa9a833d42ba2e3b49e111f8bab9e11a48d6019b7719422fabb2e83c20",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpinet_wpinet_java",
        artifact = "edu.wpi.first.wpinet:wpinet-java:2027.0.0-alpha-1",
        artifact_sha256 = "c16fc111ba113a3132c4dfe85160e8455c45af17abe9f32ac79adfcacd8e8485",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiunits_wpiunits_java",
        artifact = "edu.wpi.first.wpiunits:wpiunits-java:2027.0.0-alpha-1",
        artifact_sha256 = "6ffcb724cf2ca21140ffc9386fa563b7a4ee875c2499caf8a732a4d0031f2552",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpimath_wpimath_java",
        artifact = "edu.wpi.first.wpimath:wpimath-java:2027.0.0-alpha-1",
        artifact_sha256 = "997df51f4eb523fcd03bc305928c09c68311d6fb18415c66b3a66d85da2006b2",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_apriltag_apriltag_java",
        artifact = "edu.wpi.first.apriltag:apriltag-java:2027.0.0-alpha-1",
        artifact_sha256 = "10737558d78f56d6476b5a04f0458ad1e4b5c91738a14120b95001cda2cd815e",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_hal_hal_java",
        artifact = "edu.wpi.first.hal:hal-java:2027.0.0-alpha-1",
        artifact_sha256 = "3111263bee90ed92b2e1bd9224c58157b32e28f4909936a4098df64ad16425cb",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_ntcore_ntcore_java",
        artifact = "edu.wpi.first.ntcore:ntcore-java:2027.0.0-alpha-1",
        artifact_sha256 = "bd02e90c03a9906af5bb639e492f3a18855d0714c0e8d08f17f43399166d79cd",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cscore_cscore_java",
        artifact = "edu.wpi.first.cscore:cscore-java:2027.0.0-alpha-1",
        artifact_sha256 = "a5f2f86a5ccb129aa9a20edfc103c6bfb150c856c1f365fe8c7f06a3991a8262",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cameraserver_cameraserver_java",
        artifact = "edu.wpi.first.cameraserver:cameraserver-java:2027.0.0-alpha-1",
        artifact_sha256 = "da17c386547ae557afd3639c63201133b208af1afc62cef9019d259b2b5db3ef",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibj_wpilibj_java",
        artifact = "edu.wpi.first.wpilibj:wpilibj-java:2027.0.0-alpha-1",
        artifact_sha256 = "2763f3778dec8e430958c29d3fdae36be28aa58bbaacef901181b2825ea673b7",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibnewcommands_wpilibnewcommands_java",
        artifact = "edu.wpi.first.wpilibNewCommands:wpilibNewCommands-java:2027.0.0-alpha-1",
        artifact_sha256 = "0d4a9f7527f5f9f7dd17aa79efe6f3b3ea71347b158b661fc49f2f5badfcc60e",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_fieldimages_fieldimages_java",
        artifact = "edu.wpi.first.fieldImages:fieldImages-java:2027.0.0-alpha-1",
        artifact_sha256 = "05307264366864dac6ef0bacf81be15c5adcd16e04bdd8652c5f4ab00a3cca57",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
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
