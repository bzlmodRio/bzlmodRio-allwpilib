load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiutil_wpiutil_java",
        artifact = "edu.wpi.first.wpiutil:wpiutil-java:2023.4.1",
        artifact_sha256 = "9474686c09a6cfef7319a4b06c4bc8a5679dc91195bc45639ca4a32f9b4c6f55",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpinet_wpinet_java",
        artifact = "edu.wpi.first.wpinet:wpinet-java:2023.4.1",
        artifact_sha256 = "ce1efd2be3c278b7eb1496573ce8a1f3abbc01e45dfe958e2c374cade2881441",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpimath_wpimath_java",
        artifact = "edu.wpi.first.wpimath:wpimath-java:2023.4.1",
        artifact_sha256 = "2534c8ef32efdaceb8815ba9d98e072a06299eee50927cec5390abf30eda7314",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_apriltag_apriltag_java",
        artifact = "edu.wpi.first.apriltag:apriltag-java:2023.4.1",
        artifact_sha256 = "1bb58fe7e0c8aba61bae6cfd601bfd0622fb3fb9251c7d20adbc6d3ce5e2b61d",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_hal_hal_java",
        artifact = "edu.wpi.first.hal:hal-java:2023.4.1",
        artifact_sha256 = "fcec5ee4c1a28ecce9d41ae94e1eaef75a57061b243e84089405131b13807a3d",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_ntcore_ntcore_java",
        artifact = "edu.wpi.first.ntcore:ntcore-java:2023.4.1",
        artifact_sha256 = "b9e24e971f8054ad3a31963a31d053edc292d6bbb9d228063da024daa063efa9",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cscore_cscore_java",
        artifact = "edu.wpi.first.cscore:cscore-java:2023.4.1",
        artifact_sha256 = "7602d4a0b2b651d1d07b1a3f0db56652a885e58e530bf839422d7997c1828664",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cameraserver_cameraserver_java",
        artifact = "edu.wpi.first.cameraserver:cameraserver-java:2023.4.1",
        artifact_sha256 = "23bd02665d55a7f6aca58f08a0fc626db8bbfdbadde7c817d3f7c12d31a8e0b2",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibj_wpilibj_java",
        artifact = "edu.wpi.first.wpilibj:wpilibj-java:2023.4.1",
        artifact_sha256 = "3e2cc4fa4ffcc9847c4ea4e092ea5d859cb8a36ad2c3cf0912d7a29a5a095e04",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibnewcommands_wpilibnewcommands_java",
        artifact = "edu.wpi.first.wpilibNewCommands:wpilibNewCommands-java:2023.4.1",
        artifact_sha256 = "6a9d8fdd935f97ed7f4bc5cf38f24595c1f0192b79ebd09968b9f6dac8ad0a19",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_fieldimages_fieldimages_java",
        artifact = "edu.wpi.first.fieldImages:fieldImages-java:2023.4.1",
        artifact_sha256 = "4b63f941bf5df6f2eaf01ee08fba47c30f3a7ea653df2c0f4f1bbbae36b0e4d4",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_shuffleboard_api",
        artifact = "edu.wpi.first.shuffleboard:api:2023.4.1",
        artifact_sha256 = "314ffde0dee48c4a08dec12ce7d7714b2dc155a1e59f0f5b9de3b784e7175b77",
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
