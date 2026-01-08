load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "org_wpilib_annotations_java",
        artifact = "org.wpilib:annotations-java:2026.1.1",
        artifact_sha256 = "13d01339842c5813101b4a1a793f48d63d784f00d07b49901cf3785bc61a99dd",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiutil_wpiutil_java",
        artifact = "edu.wpi.first.wpiutil:wpiutil-java:2026.1.1",
        artifact_sha256 = "ee10345727b47729d72e9cb9ef50cf8838dcc01f5016341ec70ac8b03680f2a7",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpinet_wpinet_java",
        artifact = "edu.wpi.first.wpinet:wpinet-java:2026.1.1",
        artifact_sha256 = "b964ec7e9ad340c09ab8ba0d4d165fd538e7ea2dfea5c2efd64819703c059b09",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiunits_wpiunits_java",
        artifact = "edu.wpi.first.wpiunits:wpiunits-java:2026.1.1",
        artifact_sha256 = "d2c9009123efb52041a5a1508da0d2b4781a3ccd2eda31feccd00e5d7f0ff420",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpimath_wpimath_java",
        artifact = "edu.wpi.first.wpimath:wpimath-java:2026.1.1",
        artifact_sha256 = "da0004725fefa2526791c8147fbf1d2698c3f782e4af0fc69b998d1c1f4edc74",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_apriltag_apriltag_java",
        artifact = "edu.wpi.first.apriltag:apriltag-java:2026.1.1",
        artifact_sha256 = "05bd1b649c9713e3996c72e1b67d12d5e2451dfb134aa33e90dd89e450094bdc",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_hal_hal_java",
        artifact = "edu.wpi.first.hal:hal-java:2026.1.1",
        artifact_sha256 = "f7c54b6f3de4a80e3e466951bc8bba0ed5fe2c1dfce40e68f51c727e1ca07314",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_ntcore_ntcore_java",
        artifact = "edu.wpi.first.ntcore:ntcore-java:2026.1.1",
        artifact_sha256 = "7e89cb110175af94155e4e336b9d50beb8917bdc6a73013dc781fd957f223c1d",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_epilogue_epilogue_runtime_java",
        artifact = "edu.wpi.first.epilogue:epilogue-runtime-java:2026.1.1",
        artifact_sha256 = "b483f193973cc82fd98c1a508c7114c6a00c1e8c63c9201713a9f0eb18033830",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cscore_cscore_java",
        artifact = "edu.wpi.first.cscore:cscore-java:2026.1.1",
        artifact_sha256 = "058899de9c1c732604ab805ee7f61a0f40876b965af27c506246d2a66b9d1f66",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cameraserver_cameraserver_java",
        artifact = "edu.wpi.first.cameraserver:cameraserver-java:2026.1.1",
        artifact_sha256 = "92237edbb4119b1a109126b00dbd5091e6d8b15b3cfb1f0c76a606eacf959eaf",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibj_wpilibj_java",
        artifact = "edu.wpi.first.wpilibj:wpilibj-java:2026.1.1",
        artifact_sha256 = "f5b6b64d9a18e22553e02c9c9cff74b289b8a2d3587547f298e69a0a22b5fc62",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibnewcommands_wpilibnewcommands_java",
        artifact = "edu.wpi.first.wpilibNewCommands:wpilibNewCommands-java:2026.1.1",
        artifact_sha256 = "5f5ff5de1f1d703c26068ee9fbcca77cd8a8fc82e2bc540b295bc3cd9a22da3a",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_epilogue_epilogue_processor_java",
        artifact = "edu.wpi.first.epilogue:epilogue-processor-java:2026.1.1",
        artifact_sha256 = "85c48b5e0d63840ec3143a2ce509d2aba1f4bb331d843c83f77cbb039085c823",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_fieldimages_fieldimages_java",
        artifact = "edu.wpi.first.fieldImages:fieldImages-java:2026.1.1",
        artifact_sha256 = "d14ca56d823ff8a91427e8f799238335f40dba7738747110d7fd3dd4b398342c",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_shuffleboard_api",
        artifact = "edu.wpi.first.shuffleboard:api:2026.1.1",
        artifact_sha256 = "d6d3d1db540d69e95b8674fc7ad52015cd2fd44d05574d63fddb15580454ab97",
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
