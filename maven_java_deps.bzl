load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiutil_wpiutil_java",
        artifact = "edu.wpi.first.wpiutil:wpiutil-java:2022.3.1",
        artifact_sha256 = "9ebea418d5b0518015f6c27ccc7fbb07eb948876538c78c2c34c63cae01b4614",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpimath_wpimath_java",
        artifact = "edu.wpi.first.wpimath:wpimath-java:2022.3.1",
        artifact_sha256 = "d6ffdcc0bc7b1a08df1748819330887e68c2a54e707c8bb90a864b2da30ed978",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_hal_hal_java",
        artifact = "edu.wpi.first.hal:hal-java:2022.3.1",
        artifact_sha256 = "e571485032dfd89a7e8bd36b93176e327a1ed2579356f3b70594a95a83c118e9",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_ntcore_ntcore_java",
        artifact = "edu.wpi.first.ntcore:ntcore-java:2022.3.1",
        artifact_sha256 = "de93f971efce1a4d9bd37bbe313e5315eb88726866db16759b39f02b14f6b144",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cscore_cscore_java",
        artifact = "edu.wpi.first.cscore:cscore-java:2022.3.1",
        artifact_sha256 = "2b4e468a4ce9e5732c1d86daa0b8d7c0a0fb300a1e6f7db4efc9bb387ec53440",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cameraserver_cameraserver_java",
        artifact = "edu.wpi.first.cameraserver:cameraserver-java:2022.3.1",
        artifact_sha256 = "fcef0d9be9915292fa5d6666560922cd091b2a337b96c6b56faf0602ad99a1e8",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibj_wpilibj_java",
        artifact = "edu.wpi.first.wpilibj:wpilibj-java:2022.3.1",
        artifact_sha256 = "4f98ee6970c2ec95b262b8908ed7cd7e7706de5376d3e9ff90ccb9c5ed2f46ac",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibnewcommands_wpilibnewcommands_java",
        artifact = "edu.wpi.first.wpilibNewCommands:wpilibNewCommands-java:2022.3.1",
        artifact_sha256 = "78ece93a3254ddff41d664d0a3757c7887455c0fe9a609b7c8289518ddcce9d7",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiliboldcommands_wpiliboldcommands_java",
        artifact = "edu.wpi.first.wpilibOldCommands:wpilibOldCommands-java:2022.3.1",
        artifact_sha256 = "0d827fd744ea6885ce6c80e7f717b7bc5276152c4c073019b2194208d3bdbdd8",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_fieldimages_fieldimages_java",
        artifact = "edu.wpi.first.fieldImages:fieldImages-java:2022.3.1",
        artifact_sha256 = "8ab0fe2245f56c4e440c31996c772173c2b0530c9962d2a470c981601351b490",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_shuffleboard_api",
        artifact = "edu.wpi.first.shuffleboard:api:2022.3.1",
        artifact_sha256 = "94d313fb326029cf31ca9a04df8d02371e43156af9dda918c2f7660efd75ae5e",
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
