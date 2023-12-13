load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiutil_wpiutil_java",
        artifact = "edu.wpi.first.wpiutil:wpiutil-java:2024.1.1-beta-4",
        artifact_sha256 = "18275b5a6eab43587ac3b0ab207b21dedd641054496eb0d16c32821e763d23d2",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpinet_wpinet_java",
        artifact = "edu.wpi.first.wpinet:wpinet-java:2024.1.1-beta-4",
        artifact_sha256 = "35e0bda12ee22c2dc5967d9a919f358ba0cc0326d8283be65af42e1c634e232e",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpimath_wpimath_java",
        artifact = "edu.wpi.first.wpimath:wpimath-java:2024.1.1-beta-4",
        artifact_sha256 = "a27432f8e4faf6d1f98015a6f21513d23f21eee276ea50f18e5a7c7514fe6a82",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_apriltag_apriltag_java",
        artifact = "edu.wpi.first.apriltag:apriltag-java:2024.1.1-beta-4",
        artifact_sha256 = "83864d0d06748fbdc1a0f7a5ba2c3c1365fe4e882a6a12ac7500e47785cfcbc5",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_hal_hal_java",
        artifact = "edu.wpi.first.hal:hal-java:2024.1.1-beta-4",
        artifact_sha256 = "fcf8d38a195c9c4a945c9f3aa922033106b77ac9fb40b7360180e3b5ac63dc5f",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_ntcore_ntcore_java",
        artifact = "edu.wpi.first.ntcore:ntcore-java:2024.1.1-beta-4",
        artifact_sha256 = "b83242fbb802aaad363b484bd6c750d020aebff8f374a85eee878f0615cfcf35",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cscore_cscore_java",
        artifact = "edu.wpi.first.cscore:cscore-java:2024.1.1-beta-4",
        artifact_sha256 = "f0dfcb4692c4c5c9e1ec4a5b1f5ed30b3f282d46a74daa58993dfbb340bccc39",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cameraserver_cameraserver_java",
        artifact = "edu.wpi.first.cameraserver:cameraserver-java:2024.1.1-beta-4",
        artifact_sha256 = "6eaad31276ed646b1e42717926cd4e8a2bfde4f618075c3ea0c0b7a563d72791",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibj_wpilibj_java",
        artifact = "edu.wpi.first.wpilibj:wpilibj-java:2024.1.1-beta-4",
        artifact_sha256 = "62b8a6a3993aa4d9a0fe4ff8fa43b1099c08b833236422fc712ee4fdd44e9fb5",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibnewcommands_wpilibnewcommands_java",
        artifact = "edu.wpi.first.wpilibNewCommands:wpilibNewCommands-java:2024.1.1-beta-4",
        artifact_sha256 = "56f923892691e6290349644c2ef0870916781d114224c00889fe8801218ed2ac",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_fieldimages_fieldimages_java",
        artifact = "edu.wpi.first.fieldImages:fieldImages-java:2024.1.1-beta-4",
        artifact_sha256 = "4aa25cb766fc2d4b1891c71fd5805c9e776c9c7f3841f0b5ea7a4a5ac872c522",
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
