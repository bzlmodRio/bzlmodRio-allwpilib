load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiutil_wpiutil_java",
        artifact = "edu.wpi.first.wpiutil:wpiutil-java:2024.1.1-beta-4",
        artifact_sha256 = "745fd22ca288c4f580ba74a282e61d13e30f8e4c7b8463fb0ea307e8275b6335",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpinet_wpinet_java",
        artifact = "edu.wpi.first.wpinet:wpinet-java:2024.1.1-beta-4",
        artifact_sha256 = "b04a7e17ca2d376c2db5388438f93f87e30c7d9857099d3d1a0239fb809abc8d",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiunits_wpiunits_java",
        artifact = "edu.wpi.first.wpiunits:wpiunits-java:2024.1.1-beta-4",
        artifact_sha256 = "e48a560ecd90df178927e66b2a68aa7907eb1cbd3311ed50cc213c1a55e32c0c",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpimath_wpimath_java",
        artifact = "edu.wpi.first.wpimath:wpimath-java:2024.1.1-beta-4",
        artifact_sha256 = "b37c29a7e24785b6dd8c0dcf6506bba20880f7ecc0d1e1f361f44d3c341ba513",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_apriltag_apriltag_java",
        artifact = "edu.wpi.first.apriltag:apriltag-java:2024.1.1-beta-4",
        artifact_sha256 = "22263ad28a69a89d6e68daa951fdbb258974b3af5d7eb90bcb907cc225f7f819",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_hal_hal_java",
        artifact = "edu.wpi.first.hal:hal-java:2024.1.1-beta-4",
        artifact_sha256 = "49f1f2db0fa93dbf41f08fca6d998cf6175d2355b2467f9f0c21c544ab454307",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_ntcore_ntcore_java",
        artifact = "edu.wpi.first.ntcore:ntcore-java:2024.1.1-beta-4",
        artifact_sha256 = "33610277da63c8f463dbbf804309222ab65a811ae99d4cfe56e0bbaf9366f4cc",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cscore_cscore_java",
        artifact = "edu.wpi.first.cscore:cscore-java:2024.1.1-beta-4",
        artifact_sha256 = "c3a9c0ad916879adbab0a1424eb543a8a467ceea4db765fb60b4dbb30d2564f6",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cameraserver_cameraserver_java",
        artifact = "edu.wpi.first.cameraserver:cameraserver-java:2024.1.1-beta-4",
        artifact_sha256 = "e69686e18f08d1ce1e3fdee4cf7eea50e0487133506e554c6a43c68be48fc4ea",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibj_wpilibj_java",
        artifact = "edu.wpi.first.wpilibj:wpilibj-java:2024.1.1-beta-4",
        artifact_sha256 = "485e77eb5f4698ad697220003d55d6a80f8c1219898cbf09ed89944a236b917a",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibnewcommands_wpilibnewcommands_java",
        artifact = "edu.wpi.first.wpilibNewCommands:wpilibNewCommands-java:2024.1.1-beta-4",
        artifact_sha256 = "584805cf47e5136b71c54a33ba82e7fd85b364aa47d3f3e5cfabface729e8abd",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_fieldimages_fieldimages_java",
        artifact = "edu.wpi.first.fieldImages:fieldImages-java:2024.1.1-beta-4",
        artifact_sha256 = "e7662a0cff30c19a5ecf7c1db3a740bc0b477c542bce2d54b2f8e27d3fcea437",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_shuffleboard_api",
        artifact = "edu.wpi.first.shuffleboard:api:2024.1.1-beta-4",
        artifact_sha256 = "03889c2ad3ca9e8a53e19606930956fc1ad652b037fa817603269c04e6864bc9",
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
