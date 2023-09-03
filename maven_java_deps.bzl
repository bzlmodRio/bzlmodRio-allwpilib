load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiutil_wpiutil_java",
        artifact = "edu.wpi.first.wpiutil:wpiutil-java:2024.0.0-alpha-1",
        artifact_sha256 = "b0157e7967b64a60f7ada40a4a08448bbdd056fc803fc4dc5e3b4f04571d29a5",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpinet_wpinet_java",
        artifact = "edu.wpi.first.wpinet:wpinet-java:2024.0.0-alpha-1",
        artifact_sha256 = "688a41a44e27a5dcd2e8d76155ced9b1aa16eb6cc863278e623c25323bb9f500",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpimath_wpimath_java",
        artifact = "edu.wpi.first.wpimath:wpimath-java:2024.0.0-alpha-1",
        artifact_sha256 = "516d2af8bf85ee8d12f6ee7914233fa74887f5e3c91e5a3dd9933fd1c082d4fd",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_apriltag_apriltag_java",
        artifact = "edu.wpi.first.apriltag:apriltag-java:2024.0.0-alpha-1",
        artifact_sha256 = "90fe59530c26ef32a8d319a5f1511b029cd9cc16d82c2d117505db9a7536ce3f",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_hal_hal_java",
        artifact = "edu.wpi.first.hal:hal-java:2024.0.0-alpha-1",
        artifact_sha256 = "da1e7ddba491146c56dd970b4fca4a6f36d59f71efe95adc0b6cb55f22f5abe3",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_ntcore_ntcore_java",
        artifact = "edu.wpi.first.ntcore:ntcore-java:2024.0.0-alpha-1",
        artifact_sha256 = "84fbad49f6fb25d1f1eb276012c04e6ab72ad16a599eac28507c8facd358ed15",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cscore_cscore_java",
        artifact = "edu.wpi.first.cscore:cscore-java:2024.0.0-alpha-1",
        artifact_sha256 = "cdef1218b6f8699324ea3d800419cf0c11dd2d8af6d8be38d9cf041bcf5d9225",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cameraserver_cameraserver_java",
        artifact = "edu.wpi.first.cameraserver:cameraserver-java:2024.0.0-alpha-1",
        artifact_sha256 = "cbfdffe69ca4ed9b936fa581a18b8df4a1412d589a2a5f933511d2873fb9402a",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibj_wpilibj_java",
        artifact = "edu.wpi.first.wpilibj:wpilibj-java:2024.0.0-alpha-1",
        artifact_sha256 = "81bce4d36c996a3e7c91f0b55ba5d0ae6ecc2b880f891c1e51251c85c67a7b20",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibnewcommands_wpilibnewcommands_java",
        artifact = "edu.wpi.first.wpilibNewCommands:wpilibNewCommands-java:2024.0.0-alpha-1",
        artifact_sha256 = "9267f5ea0d9db24e0a8ed51cc6f2795796194f15d23adb90825b46f88895fa8a",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_fieldimages_fieldimages_java",
        artifact = "edu.wpi.first.fieldImages:fieldImages-java:2024.0.0-alpha-1",
        artifact_sha256 = "7dfd840f414ef259b301008255eb3f1848c37e1198656a52c36b2940129820a5",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_shuffleboard_api",
        artifact = "edu.wpi.first.shuffleboard:api:2024.0.0-alpha-1",
        artifact_sha256 = "4d3a5c75fd6181282fda646815ce5546d4c2e8acba95ea707fdee5dc848de2d3",
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
