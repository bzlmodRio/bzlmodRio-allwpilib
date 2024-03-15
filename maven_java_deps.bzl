load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiutil_wpiutil_java",
        artifact = "edu.wpi.first.wpiutil:wpiutil-java:2024.3.2",
        artifact_sha256 = "47d49d5e01b945b67f2850b0c1775fcb9fc39341384453b2c9f16b6094704556",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpinet_wpinet_java",
        artifact = "edu.wpi.first.wpinet:wpinet-java:2024.3.2",
        artifact_sha256 = "bec6d44635b48a83408ef7ddd842017915b626c240795fa9710fdb22bd48a6b7",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiunits_wpiunits_java",
        artifact = "edu.wpi.first.wpiunits:wpiunits-java:2024.3.2",
        artifact_sha256 = "c4d70c7bfd83cf6578bd218f755313da15c83f0bade97bcf05d1bb7bd0c1f03c",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpimath_wpimath_java",
        artifact = "edu.wpi.first.wpimath:wpimath-java:2024.3.2",
        artifact_sha256 = "6933ee9a12965917d08f60135fc0dbb95d70066b75dbf6c673abd59ec7fbff87",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_apriltag_apriltag_java",
        artifact = "edu.wpi.first.apriltag:apriltag-java:2024.3.2",
        artifact_sha256 = "7c3c91555cbd846292404fa5ed903fe4641b84907c5925e72f9008a99a0a2e6e",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_hal_hal_java",
        artifact = "edu.wpi.first.hal:hal-java:2024.3.2",
        artifact_sha256 = "3c07e9d8c59f4f9d0863587499adfb56e97904e3d4b8b81de1acbe48f924dd04",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_ntcore_ntcore_java",
        artifact = "edu.wpi.first.ntcore:ntcore-java:2024.3.2",
        artifact_sha256 = "97fd22badcf89d49e5080a6aa930926a5e560f57f95612c888c155e7e4a3f017",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cscore_cscore_java",
        artifact = "edu.wpi.first.cscore:cscore-java:2024.3.2",
        artifact_sha256 = "f84a294febc0fe11c9e83f7a517ad6c1718874a773ff184599d180fcbce8c853",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cameraserver_cameraserver_java",
        artifact = "edu.wpi.first.cameraserver:cameraserver-java:2024.3.2",
        artifact_sha256 = "e1ab57b422cc116266c4e474af27afddd7cd7eb4d02dda7992d6e7238c8fa2a3",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibj_wpilibj_java",
        artifact = "edu.wpi.first.wpilibj:wpilibj-java:2024.3.2",
        artifact_sha256 = "bed4279a81862ebf9e739f2ef4a26bb50c6ff0942f76e14cef0aedd7a6659144",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibnewcommands_wpilibnewcommands_java",
        artifact = "edu.wpi.first.wpilibNewCommands:wpilibNewCommands-java:2024.3.2",
        artifact_sha256 = "1e49e8ac3dc6a9b7fefc889dab0bfa861e4c2f2201481d11e5837bc39dbc1f12",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_fieldimages_fieldimages_java",
        artifact = "edu.wpi.first.fieldImages:fieldImages-java:2024.3.2",
        artifact_sha256 = "269f3a865705f1ceb96affb306ac1ecfd5899a9314dc5c840b305972201ce448",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_shuffleboard_api",
        artifact = "edu.wpi.first.shuffleboard:api:2024.3.2",
        artifact_sha256 = "704576f123340382adb862524beef5f28f79974feb97e3673e2cec553e7ec75d",
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
