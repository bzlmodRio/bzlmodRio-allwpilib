load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "org_wpilib_annotations_java",
        artifact = "org.wpilib:annotations-java:2026.2.1",
        artifact_sha256 = "031753fc53a4e94e64336ded886f178f6ea1cbe54cbf17f65929be91edd56165",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiutil_wpiutil_java",
        artifact = "edu.wpi.first.wpiutil:wpiutil-java:2026.2.1",
        artifact_sha256 = "14e80d64ff01c8f00d052f93c27f119ec87dcf13433e51651ef75903761406e4",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpinet_wpinet_java",
        artifact = "edu.wpi.first.wpinet:wpinet-java:2026.2.1",
        artifact_sha256 = "8097abd02445a4e89cc31a5561df6ea1a761278f7f6b1b4e465031f967ce8de9",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiunits_wpiunits_java",
        artifact = "edu.wpi.first.wpiunits:wpiunits-java:2026.2.1",
        artifact_sha256 = "cb471acc34c7856e9c77cd45050e1d37ecdb20815cc9235cab7129f881aae9b8",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpimath_wpimath_java",
        artifact = "edu.wpi.first.wpimath:wpimath-java:2026.2.1",
        artifact_sha256 = "71bf7d1c0da17f20b112311693b4a15c600f19ef4652c17d1e8210e6562a6a7d",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_apriltag_apriltag_java",
        artifact = "edu.wpi.first.apriltag:apriltag-java:2026.2.1",
        artifact_sha256 = "19bd99b54885b0baaed14a759bdbf6965d5671cac72745913de93841e56cd251",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_hal_hal_java",
        artifact = "edu.wpi.first.hal:hal-java:2026.2.1",
        artifact_sha256 = "6f25cc2e31cdbf9c6089a864d1a3a695b53d5fff95f725deb7d480e45503f50a",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_ntcore_ntcore_java",
        artifact = "edu.wpi.first.ntcore:ntcore-java:2026.2.1",
        artifact_sha256 = "cd0d67c213f21b476ce8c2f9e9c2f94d1db57b1518172b741435948b49267e0b",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_epilogue_epilogue_runtime_java",
        artifact = "edu.wpi.first.epilogue:epilogue-runtime-java:2026.2.1",
        artifact_sha256 = "8b34a43f2e245c7ac83cbc96fb092f87e65909bd7b02fb506023a7afc48a1840",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cscore_cscore_java",
        artifact = "edu.wpi.first.cscore:cscore-java:2026.2.1",
        artifact_sha256 = "34a710d41860877a6326a85d3d148e75492b26c203ae08d7bf4593c353ebe7fd",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cameraserver_cameraserver_java",
        artifact = "edu.wpi.first.cameraserver:cameraserver-java:2026.2.1",
        artifact_sha256 = "0fb362509338999df27069fbfa34d41679e7d54d29941165e935990ba1ba6fdc",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibj_wpilibj_java",
        artifact = "edu.wpi.first.wpilibj:wpilibj-java:2026.2.1",
        artifact_sha256 = "35c99b7ce0eaecf96a387902c28f0e8982cfca56789e76386b561aa460fa73cd",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibnewcommands_wpilibnewcommands_java",
        artifact = "edu.wpi.first.wpilibNewCommands:wpilibNewCommands-java:2026.2.1",
        artifact_sha256 = "c9c76e15675fd0555bac0cdeeb27c8327c30ef046bb363d0c28e06e89115e84e",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_epilogue_epilogue_processor_java",
        artifact = "edu.wpi.first.epilogue:epilogue-processor-java:2026.2.1",
        artifact_sha256 = "ec709e0fad338ae9fa79e0d58b3adbfb5fe1e5830f35ce7c9fe0347eca82f6f9",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_fieldimages_fieldimages_java",
        artifact = "edu.wpi.first.fieldImages:fieldImages-java:2026.2.1",
        artifact_sha256 = "adec481ea89b4bfe46a2ede6ef59d2e16e9f7261f11e780e5b3ec25f81aea9ce",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_shuffleboard_api",
        artifact = "edu.wpi.first.shuffleboard:api:2026.2.1",
        artifact_sha256 = "811c20c77c83c4c9f79f20e5b12be592fd3a4ea6eff6dde8b36ef203bd2b0b64",
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
