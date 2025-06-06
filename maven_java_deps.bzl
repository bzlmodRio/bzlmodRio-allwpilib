load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiutil_wpiutil_java",
        artifact = "edu.wpi.first.wpiutil:wpiutil-java:2025.3.2-123-g22d12d2",
        artifact_sha256 = "c7d5dfaf12216eab36ab90029799c4a227bf9a5f55f2492c2f62c6ada06a28bc",
        server_urls = ["https://frcmaven.wpi.edu/development-2027"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpinet_wpinet_java",
        artifact = "edu.wpi.first.wpinet:wpinet-java:2025.3.2-123-g22d12d2",
        artifact_sha256 = "bedfa780ce3b0784ed5996b0a011ffa7ebdc3060a780cd890cdcbc072349f488",
        server_urls = ["https://frcmaven.wpi.edu/development-2027"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiunits_wpiunits_java",
        artifact = "edu.wpi.first.wpiunits:wpiunits-java:2025.3.2-123-g22d12d2",
        artifact_sha256 = "22edb63f8fa795b45d3f594cf1ade8370912965632fc2381f3f6d0ecb849fb2d",
        server_urls = ["https://frcmaven.wpi.edu/development-2027"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpimath_wpimath_java",
        artifact = "edu.wpi.first.wpimath:wpimath-java:2025.3.2-123-g22d12d2",
        artifact_sha256 = "2e875c24a95c7c5524506ecc4ad902e1c7318830ca4867bf3b82d1f89d62824d",
        server_urls = ["https://frcmaven.wpi.edu/development-2027"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_apriltag_apriltag_java",
        artifact = "edu.wpi.first.apriltag:apriltag-java:2025.3.2-123-g22d12d2",
        artifact_sha256 = "11629a0285a316b94839c5741179bafd8f14153e3d778b691f4abebd1f4ec142",
        server_urls = ["https://frcmaven.wpi.edu/development-2027"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_hal_hal_java",
        artifact = "edu.wpi.first.hal:hal-java:2025.3.2-123-g22d12d2",
        artifact_sha256 = "238502171baf3fff4ff1ded175f9e11e44d16fdbc41bea90203d351a4b771a92",
        server_urls = ["https://frcmaven.wpi.edu/development-2027"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_ntcore_ntcore_java",
        artifact = "edu.wpi.first.ntcore:ntcore-java:2025.3.2-123-g22d12d2",
        artifact_sha256 = "13f200f7ee7a5ea85c18ad23db203ecf69a1f4555b2cc9dbcd0f9e58fdef364c",
        server_urls = ["https://frcmaven.wpi.edu/development-2027"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cscore_cscore_java",
        artifact = "edu.wpi.first.cscore:cscore-java:2025.3.2-123-g22d12d2",
        artifact_sha256 = "38657bac092a58cd80e321a9939023a50d491b45d9082f24a84e1c00528a82c2",
        server_urls = ["https://frcmaven.wpi.edu/development-2027"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cameraserver_cameraserver_java",
        artifact = "edu.wpi.first.cameraserver:cameraserver-java:2025.3.2-123-g22d12d2",
        artifact_sha256 = "f123665e0c459cad1623ec322b4e09ab81d312efbbb1c4cb4c427d6a32da0895",
        server_urls = ["https://frcmaven.wpi.edu/development-2027"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibj_wpilibj_java",
        artifact = "edu.wpi.first.wpilibj:wpilibj-java:2025.3.2-123-g22d12d2",
        artifact_sha256 = "845a864884efb3b245ac36d8def435fc62fabf0ddeebf02b036987d74f69e4ec",
        server_urls = ["https://frcmaven.wpi.edu/development-2027"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibnewcommands_wpilibnewcommands_java",
        artifact = "edu.wpi.first.wpilibNewCommands:wpilibNewCommands-java:2025.3.2-123-g22d12d2",
        artifact_sha256 = "292d4c8505ce81fc4e3b1a5240892668c5661950bfa9aa6e781879535f21990d",
        server_urls = ["https://frcmaven.wpi.edu/development-2027"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_fieldimages_fieldimages_java",
        artifact = "edu.wpi.first.fieldImages:fieldImages-java:2025.3.2-123-g22d12d2",
        artifact_sha256 = "ef74401c042d901404518c2428da8a053712e063eaa913eb79fac5ea6a48a33b",
        server_urls = ["https://frcmaven.wpi.edu/development-2027"],
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
