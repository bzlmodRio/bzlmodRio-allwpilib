load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiutil_wpiutil_java",
        artifact = "edu.wpi.first.wpiutil:wpiutil-java:2025.0.0-alpha-2",
        artifact_sha256 = "5852566f53b840dd895f02fce7e475e649a659fd20728e7ae59896795cefa117",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpinet_wpinet_java",
        artifact = "edu.wpi.first.wpinet:wpinet-java:2025.0.0-alpha-2",
        artifact_sha256 = "3c7b3134c18f433e5bf7b023708a0b40f8fdb86201ed2aee70613bcba60c497e",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiunits_wpiunits_java",
        artifact = "edu.wpi.first.wpiunits:wpiunits-java:2025.0.0-alpha-2",
        artifact_sha256 = "911d3ad2ac053fd1f26591f2c4c53b43feec38513a9f7c36528ed12587e70b1c",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpimath_wpimath_java",
        artifact = "edu.wpi.first.wpimath:wpimath-java:2025.0.0-alpha-2",
        artifact_sha256 = "c5d53f363ef0d4d5cc08cbddf63cc85a27a2f976b01c66e1a43a8bb7602b33db",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_apriltag_apriltag_java",
        artifact = "edu.wpi.first.apriltag:apriltag-java:2025.0.0-alpha-2",
        artifact_sha256 = "8b2161ea518ffdb20b6e3db5ed9e219fa9ecb366b700e348425440e497cb6d06",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_hal_hal_java",
        artifact = "edu.wpi.first.hal:hal-java:2025.0.0-alpha-2",
        artifact_sha256 = "415a94c46340a46b9124a3a76c40c117e8cb59da55a3babbc66112cc941674bf",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_ntcore_ntcore_java",
        artifact = "edu.wpi.first.ntcore:ntcore-java:2025.0.0-alpha-2",
        artifact_sha256 = "aab6edcca6ce81f38f33a3448b047a6d4c92fc1745c47ae0873c9e959a56d26b",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cscore_cscore_java",
        artifact = "edu.wpi.first.cscore:cscore-java:2025.0.0-alpha-2",
        artifact_sha256 = "3e09f559510c2a61b05c6550e06f347aa1e879b2c6ff02ea6242942898a83106",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cameraserver_cameraserver_java",
        artifact = "edu.wpi.first.cameraserver:cameraserver-java:2025.0.0-alpha-2",
        artifact_sha256 = "dc13416950bb456340320b4b887473601ffcb530fb3338060d1f957c25852d55",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibj_wpilibj_java",
        artifact = "edu.wpi.first.wpilibj:wpilibj-java:2025.0.0-alpha-2",
        artifact_sha256 = "e0b516ced1543d43f4ae661b523b40c93d3ebc3ef28f292ceb7077a0ad5ec8fc",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibnewcommands_wpilibnewcommands_java",
        artifact = "edu.wpi.first.wpilibNewCommands:wpilibNewCommands-java:2025.0.0-alpha-2",
        artifact_sha256 = "2371e2b079f2c4478efd03c3213d68f758b024aa2707e08833c8c9fe8c54a2cb",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_fieldimages_fieldimages_java",
        artifact = "edu.wpi.first.fieldImages:fieldImages-java:2025.0.0-alpha-2",
        artifact_sha256 = "a85c80d82a938e0e4b57bd2dfebb06246e099d144bacff6a3ec221f0695e0285",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_shuffleboard_api",
        artifact = "edu.wpi.first.shuffleboard:api:2025.0.0-alpha-2",
        artifact_sha256 = "a46c73bae248414cce102e595bd0b8f691a653f1c694c57edb519ac5dbf0d757",
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
