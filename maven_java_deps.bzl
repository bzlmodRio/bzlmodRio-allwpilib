load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiutil_wpiutil_java",
        artifact = "edu.wpi.first.wpiutil:wpiutil-java:2024.1.1-beta-2",
        artifact_sha256 = "424c17eb3da0e20a132db7e1bb60030cae5ddda59e81ce78ab66a7d642acb177",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpinet_wpinet_java",
        artifact = "edu.wpi.first.wpinet:wpinet-java:2024.1.1-beta-2",
        artifact_sha256 = "017ef17b0f2c85c7affab2fadad325634f768c92aa6629f497afc924e5abf1ec",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpimath_wpimath_java",
        artifact = "edu.wpi.first.wpimath:wpimath-java:2024.1.1-beta-2",
        artifact_sha256 = "9cfa65ea3d2af2af4e8cb519f0714893d986af00d4d49442924a8fab648f7781",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_apriltag_apriltag_java",
        artifact = "edu.wpi.first.apriltag:apriltag-java:2024.1.1-beta-2",
        artifact_sha256 = "36bbfb408e28cbf4f08b9ce3c4cf6e67d7b383add8235efd513abdd6478f9723",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_hal_hal_java",
        artifact = "edu.wpi.first.hal:hal-java:2024.1.1-beta-2",
        artifact_sha256 = "03601893415cd342eed0f019e019fbbc64b75aeb802344389469e18f3fdde56c",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_ntcore_ntcore_java",
        artifact = "edu.wpi.first.ntcore:ntcore-java:2024.1.1-beta-2",
        artifact_sha256 = "e0513c46fec68071de19d096623e73fae01af406b75a9abd0d213ce2e945b8d7",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cscore_cscore_java",
        artifact = "edu.wpi.first.cscore:cscore-java:2024.1.1-beta-2",
        artifact_sha256 = "8646356dac8547d4ce04da154010d2bcebd956891c3a1e05c0abdf7af25e4df3",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cameraserver_cameraserver_java",
        artifact = "edu.wpi.first.cameraserver:cameraserver-java:2024.1.1-beta-2",
        artifact_sha256 = "3d4150608770474ee9bf314456b0982e46c6ebad261d0b9316463f3a1fd77def",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibj_wpilibj_java",
        artifact = "edu.wpi.first.wpilibj:wpilibj-java:2024.1.1-beta-2",
        artifact_sha256 = "cb6fc2823da85a6128143e7500b1376461f7d46a368986edb30e6b3190915f2d",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibnewcommands_wpilibnewcommands_java",
        artifact = "edu.wpi.first.wpilibNewCommands:wpilibNewCommands-java:2024.1.1-beta-2",
        artifact_sha256 = "553ea620d50d6563aa754f5a20474e7aa56e4c0eb63e310e5601cd66e2422ed7",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_fieldimages_fieldimages_java",
        artifact = "edu.wpi.first.fieldImages:fieldImages-java:2024.1.1-beta-2",
        artifact_sha256 = "a8b22d1a041eef5fc97d55f0ed7f4510a7df585ab3e165a64db186c5514d782a",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_shuffleboard_api",
        artifact = "edu.wpi.first.shuffleboard:api:2024.1.1-beta-2",
        artifact_sha256 = "8f52348e9c34d7b3752960ca2a4ca6b3073d6126beae29cc22c18c59f2a740e8",
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
