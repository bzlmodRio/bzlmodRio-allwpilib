load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiutil_wpiutil_java",
        artifact = "edu.wpi.first.wpiutil:wpiutil-java:2023.2.1",
        artifact_sha256 = "9825d5270a3f9bdda765777c9484eb8204ee405fc134e1b0be6c802663b42248",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpinet_wpinet_java",
        artifact = "edu.wpi.first.wpinet:wpinet-java:2023.2.1",
        artifact_sha256 = "6d601f6cbe61b88de8662bf04aa7cde1c9478377dd947473b82c630ddc6473a8",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpimath_wpimath_java",
        artifact = "edu.wpi.first.wpimath:wpimath-java:2023.2.1",
        artifact_sha256 = "503aca22b2c85dafdbdc9803027b854e8a08a3b92f4fa5d0339a6e0c76a987b2",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_apriltag_apriltag_java",
        artifact = "edu.wpi.first.apriltag:apriltag-java:2023.2.1",
        artifact_sha256 = "ef542e701a6926c7f950d35c9242466da789e51ec21085c656c9e49d3f613dff",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_hal_hal_java",
        artifact = "edu.wpi.first.hal:hal-java:2023.2.1",
        artifact_sha256 = "944cdd94a460775fe0351dd4a1bdf989252cdc143f37035261e1ebb2d9d457f3",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_ntcore_ntcore_java",
        artifact = "edu.wpi.first.ntcore:ntcore-java:2023.2.1",
        artifact_sha256 = "5269208600e97fab2ad14a1af26d11b3e3d05d73a969e5506ce0969acd9d0753",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cscore_cscore_java",
        artifact = "edu.wpi.first.cscore:cscore-java:2023.2.1",
        artifact_sha256 = "d8682214b613312d7a6e6a5f28c85628f9a901fa487db7724d589637d5baf5bc",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cameraserver_cameraserver_java",
        artifact = "edu.wpi.first.cameraserver:cameraserver-java:2023.2.1",
        artifact_sha256 = "00cbc42b12e72b311ca7e06f8f0fc750b4b3aead06d46149d7b50ddf72e83ed0",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibj_wpilibj_java",
        artifact = "edu.wpi.first.wpilibj:wpilibj-java:2023.2.1",
        artifact_sha256 = "3a04c7280868eea1f4bac77a9430cfd9b179e6e50eeeb753cd7f036f8f962341",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibnewcommands_wpilibnewcommands_java",
        artifact = "edu.wpi.first.wpilibNewCommands:wpilibNewCommands-java:2023.2.1",
        artifact_sha256 = "52f665e9d3eff661373ed658b28005c2caed8adc778e580fcdeb2a655da04f63",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_fieldimages_fieldimages_java",
        artifact = "edu.wpi.first.fieldImages:fieldImages-java:2023.2.1",
        artifact_sha256 = "007833e8582f595224a0e7e16c63f3c4f0dbc8c1b03723e9d2da9b6857dc4883",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_shuffleboard_api",
        artifact = "edu.wpi.first.shuffleboard:api:2023.2.1",
        artifact_sha256 = "cbe973f2eef7bbc3e42d45de743c666d71a897a8ff01995ec5faf1396d4c1830",
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
