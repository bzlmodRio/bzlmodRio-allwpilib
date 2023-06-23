load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiutil_wpiutil_java",
        artifact = "edu.wpi.first.wpiutil:wpiutil-java:2023.4.2",
        artifact_sha256 = "331cacb16781317d19f8cbf7b7e860c03c16c56fd9cd8ac739a62de464a469d4",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpinet_wpinet_java",
        artifact = "edu.wpi.first.wpinet:wpinet-java:2023.4.2",
        artifact_sha256 = "d2ab680c0a195d19a241e2b08c4b633834201fb8aca4f842c1f2638537a702e7",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpimath_wpimath_java",
        artifact = "edu.wpi.first.wpimath:wpimath-java:2023.4.2",
        artifact_sha256 = "1ab0bc26075675e21e0560d6fa858f8f7e5a95ed83f9f806ea1b28060b670f90",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_apriltag_apriltag_java",
        artifact = "edu.wpi.first.apriltag:apriltag-java:2023.4.2",
        artifact_sha256 = "13981929281cb6937dbd03df889568e90eaaf3e134680f869fb43f50ff33682f",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_hal_hal_java",
        artifact = "edu.wpi.first.hal:hal-java:2023.4.2",
        artifact_sha256 = "fee26594da632d8f3653e51176ad61e800adbebb61d7ab2ba27fb75a6d373422",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_ntcore_ntcore_java",
        artifact = "edu.wpi.first.ntcore:ntcore-java:2023.4.2",
        artifact_sha256 = "e1593e4aaf001059c2dc6da6c3306de1efa520ed7b53a05e3180f53b190c1f78",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cscore_cscore_java",
        artifact = "edu.wpi.first.cscore:cscore-java:2023.4.2",
        artifact_sha256 = "922e1b9269ffcc6c806873f273fe2c131e734ae2483c043e383155634588fb6b",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cameraserver_cameraserver_java",
        artifact = "edu.wpi.first.cameraserver:cameraserver-java:2023.4.2",
        artifact_sha256 = "c2e8ae88fad7768cd46d42fe8e145f0cdc190c127dc9ad4624c337c890883560",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibj_wpilibj_java",
        artifact = "edu.wpi.first.wpilibj:wpilibj-java:2023.4.2",
        artifact_sha256 = "b1bfb57b295e692cb96f86276a84bd77e813b85912493152f056bffa76e2f49b",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibnewcommands_wpilibnewcommands_java",
        artifact = "edu.wpi.first.wpilibNewCommands:wpilibNewCommands-java:2023.4.2",
        artifact_sha256 = "37ad7cd5a28c20508ca633e2d8d36a095a6f2991f089bcaf803caa52049f93b2",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_fieldimages_fieldimages_java",
        artifact = "edu.wpi.first.fieldImages:fieldImages-java:2023.4.2",
        artifact_sha256 = "81e19abdb8016dcb1ebf7999dec2d87e188dbd9462fd89e194eeeb9b48b31e02",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_shuffleboard_api",
        artifact = "edu.wpi.first.shuffleboard:api:2023.4.2",
        artifact_sha256 = "56cde71b3b72f81593a4e688a48abc26a2bb04e962c73625de322370ec09d071",
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
