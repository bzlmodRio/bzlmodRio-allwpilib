load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiutil_wpiutil_java",
        artifact = "edu.wpi.first.wpiutil:wpiutil-java:2025.3.2",
        artifact_sha256 = "f881ba112e17e1b5fcd45d8324a3f03a6b12d094d1af40525233c72d2dfac12d",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpinet_wpinet_java",
        artifact = "edu.wpi.first.wpinet:wpinet-java:2025.3.2",
        artifact_sha256 = "b8a10529c75e9110629aa2e831610dd55b67f8b03b16e84faf14c14f2d255a23",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiunits_wpiunits_java",
        artifact = "edu.wpi.first.wpiunits:wpiunits-java:2025.3.2",
        artifact_sha256 = "db19d6066cb2bc8efd19fa3bb6c9f386367d2f8ec546d898a9882e8ae5f09608",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpimath_wpimath_java",
        artifact = "edu.wpi.first.wpimath:wpimath-java:2025.3.2",
        artifact_sha256 = "46cb4e1132566b2cf002e7f01caee7a5cc5b8c9dab7fccd6b74c1f5e74ca85b1",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_apriltag_apriltag_java",
        artifact = "edu.wpi.first.apriltag:apriltag-java:2025.3.2",
        artifact_sha256 = "a96e9bf8202e56f4bcbaf0e094ea48aac36355390bc05f0da50230092da2b719",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_hal_hal_java",
        artifact = "edu.wpi.first.hal:hal-java:2025.3.2",
        artifact_sha256 = "63d07acdacb0d5b89a7b4c916592b0723d5b8a9bd232f69fb5ca7809109c4912",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_ntcore_ntcore_java",
        artifact = "edu.wpi.first.ntcore:ntcore-java:2025.3.2",
        artifact_sha256 = "164fa069a57c9d2c8ee48517de28299d4bb4a62e136517176157e0ecf56d5ddb",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cscore_cscore_java",
        artifact = "edu.wpi.first.cscore:cscore-java:2025.3.2",
        artifact_sha256 = "24675c0c39cf67eb09dc9d6a84bd6a802dc203a832ad3b6c927c277ad719a933",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cameraserver_cameraserver_java",
        artifact = "edu.wpi.first.cameraserver:cameraserver-java:2025.3.2",
        artifact_sha256 = "bf109e0302041199860c182e9238dc0cdf244e0d5a5772e3c8b4784484424f2c",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibj_wpilibj_java",
        artifact = "edu.wpi.first.wpilibj:wpilibj-java:2025.3.2",
        artifact_sha256 = "774f9021a5062278561dedd72c90853eb64befd49fb6b88ed7b6a032779de2d3",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibnewcommands_wpilibnewcommands_java",
        artifact = "edu.wpi.first.wpilibNewCommands:wpilibNewCommands-java:2025.3.2",
        artifact_sha256 = "7d85256839a50ee478576be9587dffe665d6d7775960fc987bac32f7bce1b7de",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_fieldimages_fieldimages_java",
        artifact = "edu.wpi.first.fieldImages:fieldImages-java:2025.3.2",
        artifact_sha256 = "89552866ca0681e950d2c4236aaf7b46840b91a50f11de7f12fe1f8c2aa676be",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_shuffleboard_api",
        artifact = "edu.wpi.first.shuffleboard:api:2025.3.2",
        artifact_sha256 = "ad1c9f16c9d7674c15eb3f18af18988d3e6da304e8cc317b7c28c1c5040f1ca5",
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
