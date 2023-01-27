load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiutil_wpiutil_java",
        artifact = "edu.wpi.first.wpiutil:wpiutil-java:2023.1.1",
        artifact_sha256 = "b172d6877fcfc1eac6cf078c7d7654d9dc548aed0d03d7cd7672a0d2e5419294",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpinet_wpinet_java",
        artifact = "edu.wpi.first.wpinet:wpinet-java:2023.1.1",
        artifact_sha256 = "808e57015ccd30a551e2c1ab1fe1a01749f7fa1c3e64398a8675f90748a53b54",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpimath_wpimath_java",
        artifact = "edu.wpi.first.wpimath:wpimath-java:2023.1.1",
        artifact_sha256 = "465bbbadd1cd510454b580a25f80ef01e9bb0fb098241d99740977fb1cf90bb0",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_apriltag_apriltag_java",
        artifact = "edu.wpi.first.apriltag:apriltag-java:2023.1.1",
        artifact_sha256 = "b216449a68e77683774e9fa1060e597ce9e75ec293b73f70c85fac585b354860",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_hal_hal_java",
        artifact = "edu.wpi.first.hal:hal-java:2023.1.1",
        artifact_sha256 = "5323148bed6e1114697ea1012d8ca79e6fa0a2f566951da7ac865e07868464ea",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_ntcore_ntcore_java",
        artifact = "edu.wpi.first.ntcore:ntcore-java:2023.1.1",
        artifact_sha256 = "cc3eb70c6eb4e05c777655021bae73724316afbd589eb15e0f35c26f130fba0e",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cscore_cscore_java",
        artifact = "edu.wpi.first.cscore:cscore-java:2023.1.1",
        artifact_sha256 = "c093f1b46ca9f22aca1a2659d706712514e306db9aeb2eda9c0eb7f986814d02",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cameraserver_cameraserver_java",
        artifact = "edu.wpi.first.cameraserver:cameraserver-java:2023.1.1",
        artifact_sha256 = "a2347b70395b19d156b5ade2676ad9faed6fb3bf1ca08970600ce8ca37cf693a",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibj_wpilibj_java",
        artifact = "edu.wpi.first.wpilibj:wpilibj-java:2023.1.1",
        artifact_sha256 = "6f934cdd7d9f03c6181ffe09a0d4bbbafa400f64bf521209d883c74a291fd8d7",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibnewcommands_wpilibnewcommands_java",
        artifact = "edu.wpi.first.wpilibNewCommands:wpilibNewCommands-java:2023.1.1",
        artifact_sha256 = "2d6a1c9f4b4efefb6330368a8ba35ba6a3d51b9e3cc1d109e6ba7964179f14c6",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_fieldimages_fieldimages_java",
        artifact = "edu.wpi.first.fieldImages:fieldImages-java:2023.1.1",
        artifact_sha256 = "3f31d40c6d62fcdcca045eaa7db2d5ecc93254e19c69316b133ec12433d31e4f",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_shuffleboard_api",
        artifact = "edu.wpi.first.shuffleboard:api:2023.1.1",
        artifact_sha256 = "bd9b91edf7a01b33bad0dad90e38fe414cd88cbe6693837687058472a9b31d70",
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
