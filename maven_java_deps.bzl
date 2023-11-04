load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiutil_wpiutil_java",
        artifact = "edu.wpi.first.wpiutil:wpiutil-java:2024.1.1-beta-3",
        artifact_sha256 = "8ce16c36eddceed5e1b3ec3172fe85da698a8566241453b707d118c99c004139",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpinet_wpinet_java",
        artifact = "edu.wpi.first.wpinet:wpinet-java:2024.1.1-beta-3",
        artifact_sha256 = "bef0c7359ad8e76ba85150a05854fda6f54d00f919d263c90d7558e67a9590c0",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpimath_wpimath_java",
        artifact = "edu.wpi.first.wpimath:wpimath-java:2024.1.1-beta-3",
        artifact_sha256 = "b1a2afa9e5c96ce33cc14464eff948bff9c358f72a92e667dfb4f12ff9429275",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_apriltag_apriltag_java",
        artifact = "edu.wpi.first.apriltag:apriltag-java:2024.1.1-beta-3",
        artifact_sha256 = "68f08861bf2f762e030b1083902ff7c3fe1da73e264f290e85b57e25ec06e625",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_hal_hal_java",
        artifact = "edu.wpi.first.hal:hal-java:2024.1.1-beta-3",
        artifact_sha256 = "d1adffa19ef7577cdc78ce9f948a5753de4eb34b807d6f4d66b87fcdb9c7b3cc",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_ntcore_ntcore_java",
        artifact = "edu.wpi.first.ntcore:ntcore-java:2024.1.1-beta-3",
        artifact_sha256 = "10b72659b6847a98228372560dded0b4f6be8a9147d8e5dfe16c4ee10cebe157",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cscore_cscore_java",
        artifact = "edu.wpi.first.cscore:cscore-java:2024.1.1-beta-3",
        artifact_sha256 = "c3e1bf05c8d0e883657d59376e305599d8144ac524cb8688bda87ba575d61b39",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cameraserver_cameraserver_java",
        artifact = "edu.wpi.first.cameraserver:cameraserver-java:2024.1.1-beta-3",
        artifact_sha256 = "d59126ab4927c7d7945f644d3d4b1f1caa3e59ff799d8bebcc938ddc07f00fa3",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibj_wpilibj_java",
        artifact = "edu.wpi.first.wpilibj:wpilibj-java:2024.1.1-beta-3",
        artifact_sha256 = "a3a0c2b6b213d7effa12f2a3f5c23a1018eca04569557ec4be69171f2696380f",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibnewcommands_wpilibnewcommands_java",
        artifact = "edu.wpi.first.wpilibNewCommands:wpilibNewCommands-java:2024.1.1-beta-3",
        artifact_sha256 = "2ba5cf9010384da602715d3ad904775a1a1e7a774c222e7bb79962e06acf72f2",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_fieldimages_fieldimages_java",
        artifact = "edu.wpi.first.fieldImages:fieldImages-java:2024.1.1-beta-3",
        artifact_sha256 = "93382eeecb7ca7147064fdae9a0b0e9d89bbeb247c6ac136c9a8019345a7b02d",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_shuffleboard_api",
        artifact = "edu.wpi.first.shuffleboard:api:2024.1.1-beta-3",
        artifact_sha256 = "5fb4ce93e7eea9af66aa3846e5bad07843a3bd977e60f37d16ab189a928c73f9",
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
