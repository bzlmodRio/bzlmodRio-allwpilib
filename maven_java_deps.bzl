load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiutil_wpiutil_java",
        artifact = "edu.wpi.first.wpiutil:wpiutil-java:2025.1.1-beta-1",
        artifact_sha256 = "57b94fe7f6a583aa58c73a777148e3be5bb0ef26f5d0578da57c5273de063bef",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpinet_wpinet_java",
        artifact = "edu.wpi.first.wpinet:wpinet-java:2025.1.1-beta-1",
        artifact_sha256 = "3cbd01e7533babf3f51cad90f9083da61af88888506c7e7327ae965148f23542",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiunits_wpiunits_java",
        artifact = "edu.wpi.first.wpiunits:wpiunits-java:2025.1.1-beta-1",
        artifact_sha256 = "494486a2785fae6fbad29f7d45c47ae7af8949cfbb0861b6e5f0fae56e6e5893",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpimath_wpimath_java",
        artifact = "edu.wpi.first.wpimath:wpimath-java:2025.1.1-beta-1",
        artifact_sha256 = "96a428335600ea93b7942224d3bbada6778e1b2dbc4409a9c1411e8178f3c415",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_apriltag_apriltag_java",
        artifact = "edu.wpi.first.apriltag:apriltag-java:2025.1.1-beta-1",
        artifact_sha256 = "94de91753f70198fed0439242581cd5228c567fc21578b095d16794f47294f48",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_hal_hal_java",
        artifact = "edu.wpi.first.hal:hal-java:2025.1.1-beta-1",
        artifact_sha256 = "a402c73460a76b7a2239e11f3685cba51bc945939791adc24a11c9fb8763dedd",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_ntcore_ntcore_java",
        artifact = "edu.wpi.first.ntcore:ntcore-java:2025.1.1-beta-1",
        artifact_sha256 = "e8caf72ec81dbaf1db76dff41143ecbea34d3c3ae4e1c34e9619fead936fea7e",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cscore_cscore_java",
        artifact = "edu.wpi.first.cscore:cscore-java:2025.1.1-beta-1",
        artifact_sha256 = "26cdfa7a6e80f27d6ee5c806c411e0cb3d0ac602bddbeb31c222c09ead9d833f",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cameraserver_cameraserver_java",
        artifact = "edu.wpi.first.cameraserver:cameraserver-java:2025.1.1-beta-1",
        artifact_sha256 = "82a84eebcde7a4d7bd1dde5085ab880d24319226845c51a1066cb98ec6f9c5ae",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibj_wpilibj_java",
        artifact = "edu.wpi.first.wpilibj:wpilibj-java:2025.1.1-beta-1",
        artifact_sha256 = "d011699e9b2a53a6b1acfed96189d1312d9425cb0a6ec9ed63f6bc46649ca94f",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibnewcommands_wpilibnewcommands_java",
        artifact = "edu.wpi.first.wpilibNewCommands:wpilibNewCommands-java:2025.1.1-beta-1",
        artifact_sha256 = "55f9446f07fc93268f032170f5fe0a427bf70d16391f82c68e9a5fc9432e249b",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_fieldimages_fieldimages_java",
        artifact = "edu.wpi.first.fieldImages:fieldImages-java:2025.1.1-beta-1",
        artifact_sha256 = "472ad46df812d2546e3c3464c17957d911e465cb0e75d89e01c61d002693d48b",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_shuffleboard_api",
        artifact = "edu.wpi.first.shuffleboard:api:2025.1.1-beta-1",
        artifact_sha256 = "17f2f0f901d194801c5e49b0a0bd398bb196660f7cf050c86afdbd8e494d159a",
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
