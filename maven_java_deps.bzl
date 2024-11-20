load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiutil_wpiutil_java",
        artifact = "edu.wpi.first.wpiutil:wpiutil-java:2025.1.1-beta-2",
        artifact_sha256 = "e1ae5f179b3e4976fc710f638b92e6bc2ae6f98865657672a104c574dbe69d14",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpinet_wpinet_java",
        artifact = "edu.wpi.first.wpinet:wpinet-java:2025.1.1-beta-2",
        artifact_sha256 = "665a0ca9f4303613974f042b17ece096cc442a85c4c2f9a39340c76506824670",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiunits_wpiunits_java",
        artifact = "edu.wpi.first.wpiunits:wpiunits-java:2025.1.1-beta-2",
        artifact_sha256 = "437e50d59ec59274502e7bd6da87ad12797ebd93832bbf0a6cfbabe497b7263b",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpimath_wpimath_java",
        artifact = "edu.wpi.first.wpimath:wpimath-java:2025.1.1-beta-2",
        artifact_sha256 = "84c637fd8df9b7e972fb08ff96aabf7168657b05deaedfbf86750e64b977e620",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_apriltag_apriltag_java",
        artifact = "edu.wpi.first.apriltag:apriltag-java:2025.1.1-beta-2",
        artifact_sha256 = "eea49a72e14f2d4402e8f57cf480b414f6b9f75b5e883c6001cac43b5706920a",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_hal_hal_java",
        artifact = "edu.wpi.first.hal:hal-java:2025.1.1-beta-2",
        artifact_sha256 = "4575f10a96096c780377a77e6ecaeb4ac5cc203010570d3449af276ebbd89090",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_ntcore_ntcore_java",
        artifact = "edu.wpi.first.ntcore:ntcore-java:2025.1.1-beta-2",
        artifact_sha256 = "820fce9688ad1cb09354d52cfb7b68f254e6987d50e856772beb749fbfa14109",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cscore_cscore_java",
        artifact = "edu.wpi.first.cscore:cscore-java:2025.1.1-beta-2",
        artifact_sha256 = "57c94af77d8cda942ac5f6188df3725c74e6512c49a588e91d8b16b6f60a2b76",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cameraserver_cameraserver_java",
        artifact = "edu.wpi.first.cameraserver:cameraserver-java:2025.1.1-beta-2",
        artifact_sha256 = "7288e568b4bc474590701805e9ca38ea5c19d8784edf0b0d8efa3cb60a126c31",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibj_wpilibj_java",
        artifact = "edu.wpi.first.wpilibj:wpilibj-java:2025.1.1-beta-2",
        artifact_sha256 = "715c9ee7e668d6802167c75941f049900ec0fd2aad6a33df1126359ecabf65eb",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibnewcommands_wpilibnewcommands_java",
        artifact = "edu.wpi.first.wpilibNewCommands:wpilibNewCommands-java:2025.1.1-beta-2",
        artifact_sha256 = "1bf76853be551a3c2536d70f5a488ea8384734508c48a2f64143c1a406343e75",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_fieldimages_fieldimages_java",
        artifact = "edu.wpi.first.fieldImages:fieldImages-java:2025.1.1-beta-2",
        artifact_sha256 = "9e99d7c0bd148860494a316335a5ed59b60388b6d1add193177663e543b844f8",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_shuffleboard_api",
        artifact = "edu.wpi.first.shuffleboard:api:2025.1.1-beta-2",
        artifact_sha256 = "a1e8e32e191f047dc4d904c115a3cf6a67ddbac2317e3eee918fb4b618ef44d8",
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
