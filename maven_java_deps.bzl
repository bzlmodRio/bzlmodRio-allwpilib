load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiutil_wpiutil_java",
        artifact = "edu.wpi.first.wpiutil:wpiutil-java:2022.4.1",
        artifact_sha256 = "2387ec35107790b045afd2f5db2bcab69aa36875a040c64f93a0cf5fa3c04cbb",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpimath_wpimath_java",
        artifact = "edu.wpi.first.wpimath:wpimath-java:2022.4.1",
        artifact_sha256 = "843adba528e74f9f77627aaf8a38a891f04a3f820aadf20ee9dd4c9bd9b003b6",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_hal_hal_java",
        artifact = "edu.wpi.first.hal:hal-java:2022.4.1",
        artifact_sha256 = "eec879c5651feb31474884ad2ff077bf51dc44e80a18c14f5ec3fb5065c0285a",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_ntcore_ntcore_java",
        artifact = "edu.wpi.first.ntcore:ntcore-java:2022.4.1",
        artifact_sha256 = "532d56396c68101dd3480b41364452333856cc695ebd907b0ba5c14b5053fada",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cscore_cscore_java",
        artifact = "edu.wpi.first.cscore:cscore-java:2022.4.1",
        artifact_sha256 = "674490e1712ecf40d1e6f4065837f4962a0889a946ab973d877f7fc6dc0e9cb4",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cameraserver_cameraserver_java",
        artifact = "edu.wpi.first.cameraserver:cameraserver-java:2022.4.1",
        artifact_sha256 = "cb7575568d6dbe4af180877a2b1e62ce7fc967da5c7510c60ea8b09b35b7b87b",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibj_wpilibj_java",
        artifact = "edu.wpi.first.wpilibj:wpilibj-java:2022.4.1",
        artifact_sha256 = "298fec2cf559cdfc429443220647379b6cb0cc2c5c9350101df700eae14f107c",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibnewcommands_wpilibnewcommands_java",
        artifact = "edu.wpi.first.wpilibNewCommands:wpilibNewCommands-java:2022.4.1",
        artifact_sha256 = "79b656150a50bdc8d90b400895fa78f42514b0f96297bff1bb3db38afb443adb",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiliboldcommands_wpiliboldcommands_java",
        artifact = "edu.wpi.first.wpilibOldCommands:wpilibOldCommands-java:2022.4.1",
        artifact_sha256 = "3ad6e309304dd5220bafa1c05b8bd9fbfc1a5c883f7c8171d4daf9949bc52c18",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_fieldimages_fieldimages_java",
        artifact = "edu.wpi.first.fieldImages:fieldImages-java:2022.4.1",
        artifact_sha256 = "900b52ed530ec90cfbd11170690cc3a7c16bf790a51eaccfca13af7a535f631a",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_shuffleboard_api",
        artifact = "edu.wpi.first.shuffleboard:api:2022.4.1",
        artifact_sha256 = "43e169ae1059fcac16e6b571e6fbf7082f6d66ca66058cf45e86a8d793a1dc8a",
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
