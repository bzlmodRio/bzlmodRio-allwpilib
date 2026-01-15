load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "org_wpilib_annotations_java",
        artifact = "org.wpilib:annotations-java:2026.2.1",
        artifact_sha256 = "55dbf3abfd008ac6b87ee4fd6f76cf5e450780cfbd5b4de24c1c72188a08e8da",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiutil_wpiutil_java",
        artifact = "edu.wpi.first.wpiutil:wpiutil-java:2026.2.1",
        artifact_sha256 = "11995475a028278faae74a6133ade40186300f1871abf27179207248323e91ef",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpinet_wpinet_java",
        artifact = "edu.wpi.first.wpinet:wpinet-java:2026.2.1",
        artifact_sha256 = "03101ec330d7e1a1d52e7d308554dbe8fa3ccc53d689a47c9cbbfa6071a93a6d",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiunits_wpiunits_java",
        artifact = "edu.wpi.first.wpiunits:wpiunits-java:2026.2.1",
        artifact_sha256 = "49d23ca9be60f3b24d243bdd38303d5cb1acc87483c520a607acf34ebaafe8a6",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpimath_wpimath_java",
        artifact = "edu.wpi.first.wpimath:wpimath-java:2026.2.1",
        artifact_sha256 = "954f701a8efe76797b55395ea4673e715028e1261651ff360af864c4612ae0e7",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_apriltag_apriltag_java",
        artifact = "edu.wpi.first.apriltag:apriltag-java:2026.2.1",
        artifact_sha256 = "af0c0d9c148b57a3453d1902e823ea6295bf225837450e71b29a0462acd444e4",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_hal_hal_java",
        artifact = "edu.wpi.first.hal:hal-java:2026.2.1",
        artifact_sha256 = "dad6131b1fe97158a61410f69ae665e34180e83ef0271f8e95130c5963e8d9e0",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_ntcore_ntcore_java",
        artifact = "edu.wpi.first.ntcore:ntcore-java:2026.2.1",
        artifact_sha256 = "447383146563db1ac7f4a3998f6bd759696c416bb9fc6cae292ba21698f563e2",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_epilogue_epilogue_runtime_java",
        artifact = "edu.wpi.first.epilogue:epilogue-runtime-java:2026.2.1",
        artifact_sha256 = "2899aa8d257dae2d16c33f1744113870f3c9975e96a059dd4e18070d67d8b288",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cscore_cscore_java",
        artifact = "edu.wpi.first.cscore:cscore-java:2026.2.1",
        artifact_sha256 = "4e727068980850166aa548da75262a56d1d1878c66336f5e244afdf5b22aa670",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cameraserver_cameraserver_java",
        artifact = "edu.wpi.first.cameraserver:cameraserver-java:2026.2.1",
        artifact_sha256 = "91b6bc038c2fe3571cad0d19153680da4b6fbf36c7c4e5657ce2432b3cb468aa",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibj_wpilibj_java",
        artifact = "edu.wpi.first.wpilibj:wpilibj-java:2026.2.1",
        artifact_sha256 = "a8cbb0a5ceab7474d4264fa52211d8c4625f633597ba5d657a2b1b21107fe003",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibnewcommands_wpilibnewcommands_java",
        artifact = "edu.wpi.first.wpilibNewCommands:wpilibNewCommands-java:2026.2.1",
        artifact_sha256 = "0e93d3cac4695ad6d2f12a5c9de7f60d182b5fe3dfc99bd9f74c77a0bc59618d",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_epilogue_epilogue_processor_java",
        artifact = "edu.wpi.first.epilogue:epilogue-processor-java:2026.2.1",
        artifact_sha256 = "b871ea3a47ab741c4a1593be16ebaf20438de53a7a00f4d4770a53c86e0d4bf9",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_fieldimages_fieldimages_java",
        artifact = "edu.wpi.first.fieldImages:fieldImages-java:2026.2.1",
        artifact_sha256 = "20080206d9085bc974346ea6abf0b46f5cdb9f2b73724fc0186c47ecca56130f",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_shuffleboard_api",
        artifact = "edu.wpi.first.shuffleboard:api:2026.2.1",
        artifact_sha256 = "b1d53a89b5d5bddfcfa4fdb209cc387b5b0fec6f44752a36827fa3e4f9e18d43",
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
