load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiutil_wpiutil_java",
        artifact = "edu.wpi.first.wpiutil:wpiutil-java:2024.2.1",
        artifact_sha256 = "f050eaf2b0111811c531d2f6068bdc16d63a832775a6df231191c900c24fb503",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpinet_wpinet_java",
        artifact = "edu.wpi.first.wpinet:wpinet-java:2024.2.1",
        artifact_sha256 = "0afecdd8229ac93894ea20a8f819ec24905cafa00af6eac70c98574ca4530963",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiunits_wpiunits_java",
        artifact = "edu.wpi.first.wpiunits:wpiunits-java:2024.2.1",
        artifact_sha256 = "c2c055e3c201ed565a34bb02c5949b5ab2216f2fbedb7c1d4aa0fad30f1982ca",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpimath_wpimath_java",
        artifact = "edu.wpi.first.wpimath:wpimath-java:2024.2.1",
        artifact_sha256 = "18259590ec2fc085a68188a9bedb37754a6df62b26eeb4aaaa395fae7a60ebf5",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_apriltag_apriltag_java",
        artifact = "edu.wpi.first.apriltag:apriltag-java:2024.2.1",
        artifact_sha256 = "ee386dee107092e7d348fa6046794e541e74e0a2e092b858a1a8359e8b460018",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_hal_hal_java",
        artifact = "edu.wpi.first.hal:hal-java:2024.2.1",
        artifact_sha256 = "0d29c14ca71af47c9d80464e8efc2ab4b6f8b9c8b898f69dd8db153a1d7dc8dc",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_ntcore_ntcore_java",
        artifact = "edu.wpi.first.ntcore:ntcore-java:2024.2.1",
        artifact_sha256 = "5994e87d67740ad1b50cdd5f03a362f78c44eb177525be9b4109aa75a4c17b8c",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cscore_cscore_java",
        artifact = "edu.wpi.first.cscore:cscore-java:2024.2.1",
        artifact_sha256 = "b1c7ed647bc561fcf7d95c21ca416bce088613bcda6eb47e76c2be9c563527ce",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cameraserver_cameraserver_java",
        artifact = "edu.wpi.first.cameraserver:cameraserver-java:2024.2.1",
        artifact_sha256 = "688ac6309270bc5cceacc843dbd872fd2b249e84edf3536d893827855866e617",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibj_wpilibj_java",
        artifact = "edu.wpi.first.wpilibj:wpilibj-java:2024.2.1",
        artifact_sha256 = "f576947df3238aef62f7755bf17f58ee26780bdc5ff35a2fb21384ec7aa4a21e",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibnewcommands_wpilibnewcommands_java",
        artifact = "edu.wpi.first.wpilibNewCommands:wpilibNewCommands-java:2024.2.1",
        artifact_sha256 = "53c34ce5d14a16ecb3b151cad3abe27a1ba85cc55db4cd1f7a56cb837e3bd2cd",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_fieldimages_fieldimages_java",
        artifact = "edu.wpi.first.fieldImages:fieldImages-java:2024.2.1",
        artifact_sha256 = "67130bf10426dc0d8ae956f67eb480a66c9b2f9b291fc2fe370f2aaf53137e5c",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_shuffleboard_api",
        artifact = "edu.wpi.first.shuffleboard:api:2024.2.1",
        artifact_sha256 = "a14757bd4a8b28b1c8b8e7e8f09f62c4aacd93f8ff9f2e63ee4e5f291e69e9ec",
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
