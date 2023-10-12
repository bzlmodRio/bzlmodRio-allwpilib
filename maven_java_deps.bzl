load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiutil_wpiutil_java",
        artifact = "edu.wpi.first.wpiutil:wpiutil-java:2024.1.1-beta-1",
        artifact_sha256 = "f4c15fec8c378bbc006c7dddce6bc21a3e444ee28c07978a3070fc6d325968a7",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpinet_wpinet_java",
        artifact = "edu.wpi.first.wpinet:wpinet-java:2024.1.1-beta-1",
        artifact_sha256 = "779b3e1a01db651e9d3e8b4073ceb7f24950c8f0590dbcfb0b7cabe2730a9be3",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpimath_wpimath_java",
        artifact = "edu.wpi.first.wpimath:wpimath-java:2024.1.1-beta-1",
        artifact_sha256 = "21c652698125f76fe68b27f700d3239e70b764c3b66f5f1f9d4a8e92489f81a9",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_apriltag_apriltag_java",
        artifact = "edu.wpi.first.apriltag:apriltag-java:2024.1.1-beta-1",
        artifact_sha256 = "3af3bf61762630bcd30acc0a102fee6482457368619497059d6b4c91d8f505b5",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_hal_hal_java",
        artifact = "edu.wpi.first.hal:hal-java:2024.1.1-beta-1",
        artifact_sha256 = "70f75088f53d87a2ae7b4318ac7f13a13204ec0042a43c103455e14823206604",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_ntcore_ntcore_java",
        artifact = "edu.wpi.first.ntcore:ntcore-java:2024.1.1-beta-1",
        artifact_sha256 = "42c17642e166feb2e5ed85f6b3eb03e37390fa6671d370f34b268e084972a4ec",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cscore_cscore_java",
        artifact = "edu.wpi.first.cscore:cscore-java:2024.1.1-beta-1",
        artifact_sha256 = "ab1e3bb9d0d54ddad98dc6a0789480206239612c808cd31174e0e8027d5357f7",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cameraserver_cameraserver_java",
        artifact = "edu.wpi.first.cameraserver:cameraserver-java:2024.1.1-beta-1",
        artifact_sha256 = "468f1932a3802afd9172d521888348afce50162694971950f19955328e109644",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibj_wpilibj_java",
        artifact = "edu.wpi.first.wpilibj:wpilibj-java:2024.1.1-beta-1",
        artifact_sha256 = "0caf014074b6145bd31309d23b40e7039eb4879663aa8d126c2bba0f04a3cda7",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibnewcommands_wpilibnewcommands_java",
        artifact = "edu.wpi.first.wpilibNewCommands:wpilibNewCommands-java:2024.1.1-beta-1",
        artifact_sha256 = "966f578f849459acb0074e40f0d531c2a1a1ca0fcf509594fd055dcca6b30d7e",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_fieldimages_fieldimages_java",
        artifact = "edu.wpi.first.fieldImages:fieldImages-java:2024.1.1-beta-1",
        artifact_sha256 = "d98983868bf26c31ae4277629fdd38001a1f86f1061b0c20fa1a8e0ab1f69617",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_shuffleboard_api",
        artifact = "edu.wpi.first.shuffleboard:api:2024.1.1-beta-1",
        artifact_sha256 = "395956e3976dadda62b8699cb01ddadb582adc91787531e6b2027fcf17976ac1",
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
