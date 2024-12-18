load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiutil_wpiutil_java",
        artifact = "edu.wpi.first.wpiutil:wpiutil-java:2025.1.1-beta-3",
        artifact_sha256 = "19b5c65631e78a7a9e27d3e96bac0159aa8821b0475d7dcf199c18ff60e16d48",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpinet_wpinet_java",
        artifact = "edu.wpi.first.wpinet:wpinet-java:2025.1.1-beta-3",
        artifact_sha256 = "1fe1bdb1d48f2d6fa07e32698ed0837c210d1912dc80ba6b9e463bbc4f50c2d4",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiunits_wpiunits_java",
        artifact = "edu.wpi.first.wpiunits:wpiunits-java:2025.1.1-beta-3",
        artifact_sha256 = "dc14b79f2a8ecefdf99390fc0c12882a677134eb7804c86024d2b4102dd28d2a",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpimath_wpimath_java",
        artifact = "edu.wpi.first.wpimath:wpimath-java:2025.1.1-beta-3",
        artifact_sha256 = "18c29932ce99aea5f368385f3a28ef6724e770bef32c29c40e9dd119a516268b",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_apriltag_apriltag_java",
        artifact = "edu.wpi.first.apriltag:apriltag-java:2025.1.1-beta-3",
        artifact_sha256 = "1678008941ee138e01f70f9a0eecd4251d2ef10dcfed1ad8e3a4548a38ddf8a4",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_hal_hal_java",
        artifact = "edu.wpi.first.hal:hal-java:2025.1.1-beta-3",
        artifact_sha256 = "32b04e0df50e47f753189ab3dadc6189ab6c750bb753237b34e12272360f79f1",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_ntcore_ntcore_java",
        artifact = "edu.wpi.first.ntcore:ntcore-java:2025.1.1-beta-3",
        artifact_sha256 = "4d38abc83217466aa95ae4ff3be272073a6bfe8e390efddd196f6ed9fcdd9b64",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cscore_cscore_java",
        artifact = "edu.wpi.first.cscore:cscore-java:2025.1.1-beta-3",
        artifact_sha256 = "2625e39516c9ff9b8a3d296bf89327172ce2cec3907ef8d9695f9df640972478",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cameraserver_cameraserver_java",
        artifact = "edu.wpi.first.cameraserver:cameraserver-java:2025.1.1-beta-3",
        artifact_sha256 = "27bae40ce3c871e82b74e4a41d500d376ababd38db51ec82b99826d2ad44a1f7",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibj_wpilibj_java",
        artifact = "edu.wpi.first.wpilibj:wpilibj-java:2025.1.1-beta-3",
        artifact_sha256 = "2d125aa37136878169360b6457dc7ca6459a36b0fd743891b0cdbc8047c8af2a",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibnewcommands_wpilibnewcommands_java",
        artifact = "edu.wpi.first.wpilibNewCommands:wpilibNewCommands-java:2025.1.1-beta-3",
        artifact_sha256 = "bc839d3aecc04aa4525219661a873564918dcf876a9f88c7ddbde96595ae5103",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_fieldimages_fieldimages_java",
        artifact = "edu.wpi.first.fieldImages:fieldImages-java:2025.1.1-beta-3",
        artifact_sha256 = "bbb8ba47728dc33825c38ca47d3a467cf49c6a6c6ea1ce77537625a00f7cbabe",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_shuffleboard_api",
        artifact = "edu.wpi.first.shuffleboard:api:2025.1.1-beta-3",
        artifact_sha256 = "61fceb62c5e54d22f5c5bb71fd9c1a3dd3d1605f18a498c3981ca99e6f6530f5",
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
