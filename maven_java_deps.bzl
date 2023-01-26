load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiutil_wpiutil_java",
        artifact = "edu.wpi.first.wpiutil:wpiutil-java:2022.1.1",
        artifact_sha256 = "7b0f5c9d4ef7d98c0d2d735cb1af31461840811c6b8d5fd21d96a61ffaa1e34d",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpimath_wpimath_java",
        artifact = "edu.wpi.first.wpimath:wpimath-java:2022.1.1",
        artifact_sha256 = "e3d2c1e4e46abf98ddaf2e1a77abdd76d63d18b634a212070ac1f350141d06a6",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_hal_hal_java",
        artifact = "edu.wpi.first.hal:hal-java:2022.1.1",
        artifact_sha256 = "cd49ca18066d1eafa8877a3342383127557f594f302bd422f0ea21f850ca94cb",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_ntcore_ntcore_java",
        artifact = "edu.wpi.first.ntcore:ntcore-java:2022.1.1",
        artifact_sha256 = "b5065d34aaadca8968748df86b8850667d3a8397ec5977316d961de5311ebcc0",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cscore_cscore_java",
        artifact = "edu.wpi.first.cscore:cscore-java:2022.1.1",
        artifact_sha256 = "ac38684b7ec825c627ca73d18e41cd956205250af16a90688c8d98e7d9a0c187",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cameraserver_cameraserver_java",
        artifact = "edu.wpi.first.cameraserver:cameraserver-java:2022.1.1",
        artifact_sha256 = "99427cbfd43c933608c7b243509f3f7ad43872fa0057defcadbc09d8b4bdfb46",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibj_wpilibj_java",
        artifact = "edu.wpi.first.wpilibj:wpilibj-java:2022.1.1",
        artifact_sha256 = "27b8d98abffcaca0f493cd5bda9a1b4ab64e8fceb513b2241aab08d961951179",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibnewcommands_wpilibnewcommands_java",
        artifact = "edu.wpi.first.wpilibNewCommands:wpilibNewCommands-java:2022.1.1",
        artifact_sha256 = "d87aab4d067dbb9c06203667bb7a8c9d658d9aa731c91370446f57a75335ffff",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiliboldcommands_wpiliboldcommands_java",
        artifact = "edu.wpi.first.wpilibOldCommands:wpilibOldCommands-java:2022.1.1",
        artifact_sha256 = "a07ecd41b13bff0649a0feb30c9f62694145cc222ee1cb2c8cc57bca2b6bb0cc",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_shuffleboard_api",
        artifact = "edu.wpi.first.shuffleboard:api:2022.1.1",
        artifact_sha256 = "889c805d97a6be839e95ad21eb113621d3f8d24d9b73dcefaee00b492a507c98",
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
