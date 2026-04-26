load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "org_wpilib_wpiutil_wpiutil_java",
        artifact = "org.wpilib.wpiutil:wpiutil-java:2027.0.0-alpha-4",
        artifact_sha256 = "385f7014bd756497d859bc22b839c1f8fb294b0c09a133581363da13c89c4f44",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_wpinet_wpinet_java",
        artifact = "org.wpilib.wpinet:wpinet-java:2027.0.0-alpha-4",
        artifact_sha256 = "af756b1684b1c1f4674cbb86dc2a4299b4b1d9f26edd1f3d5469a62db7fe5b46",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_wpiunits_wpiunits_java",
        artifact = "org.wpilib.wpiunits:wpiunits-java:2027.0.0-alpha-4",
        artifact_sha256 = "c5c0c30a9eddc81e4ace5f6aca4915d6bbc0d57a045eeb380d23218c0ef1bf19",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_wpimath_wpimath_java",
        artifact = "org.wpilib.wpimath:wpimath-java:2027.0.0-alpha-4",
        artifact_sha256 = "7db38f93e59b06276ebb4db0265100687ce22f97415b794761b56fac9dd5932f",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_apriltag_apriltag_java",
        artifact = "org.wpilib.apriltag:apriltag-java:2027.0.0-alpha-4",
        artifact_sha256 = "9b11b8f3f80d78c71cf1a8761d23f4e8710caf94f1ad4d045ae34809bedbb478",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_hal_hal_java",
        artifact = "org.wpilib.hal:hal-java:2027.0.0-alpha-4",
        artifact_sha256 = "e5a968b7ea0b9d5cd573aaa0fe01620798693fc605dadfb280d40b9743680022",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_ntcore_ntcore_java",
        artifact = "org.wpilib.ntcore:ntcore-java:2027.0.0-alpha-4",
        artifact_sha256 = "f865675842df5814c3fe89b854a4ea9edaf4f32381598f1d4eabcc4cb5a75af9",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_epilogue_epilogue_runtime_java",
        artifact = "org.wpilib.epilogue:epilogue-runtime-java:2027.0.0-alpha-4",
        artifact_sha256 = "39d6c1de8e3e254e799b330b7bcd53bc36210b015066b799f01d1824de6707b3",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_cscore_cscore_java",
        artifact = "org.wpilib.cscore:cscore-java:2027.0.0-alpha-4",
        artifact_sha256 = "e045606801b2ec62c94aa78b3fee3d683ef6f4e83486ad5c502315a45b77b39e",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_cameraserver_cameraserver_java",
        artifact = "org.wpilib.cameraserver:cameraserver-java:2027.0.0-alpha-4",
        artifact_sha256 = "194f5b1043210652743131cab36b56a23541ecfb3a3d7f05cb7604bedc2b74d2",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_wpilibj_wpilibj_java",
        artifact = "org.wpilib.wpilibj:wpilibj-java:2027.0.0-alpha-4",
        artifact_sha256 = "fd920e94320009ae7f86e873eb1a725c8514ce397b1561d916e86da673a26424",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_commandsv2_commandsv2_java",
        artifact = "org.wpilib.commandsv2:commandsv2-java:2027.0.0-alpha-4",
        artifact_sha256 = "844de4f2723093144126e4e485d6d64d1210c11f404c2457bf6c9c21ee17677b",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_commands3_java",
        artifact = "org.wpilib:commands3-java:2027.0.0-alpha-4",
        artifact_sha256 = "a3eec5321ad2268521178f1a2238bad4a2b4f755fa71d7d86e31ce59d192484b",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_epilogue_epilogue_processor_java",
        artifact = "org.wpilib.epilogue:epilogue-processor-java:2027.0.0-alpha-4",
        artifact_sha256 = "a3668b6d0716723a1bf6dd2e15d6647901fc9c4d41a0b23d73caa8567a80fd7a",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_fields_fields_java",
        artifact = "org.wpilib.fields:fields-java:2027.0.0-alpha-4",
        artifact_sha256 = "15657d329f3463bede2e57ac8428451458fe249108b047342f72b16ccbc7edaa",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
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
