load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "org_wpilib_annotations_java",
        artifact = "org.wpilib:annotations-java:2026.2.2",
        artifact_sha256 = "11006a397c61a997ad8172dad22861e1c93aac00ec2bc4843d633c5944b28238",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiutil_wpiutil_java",
        artifact = "edu.wpi.first.wpiutil:wpiutil-java:2026.2.2",
        artifact_sha256 = "54fb1c0e76edc171330feb1e1afbbf7fffbbc83de736052104a4623c0a8c8712",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpinet_wpinet_java",
        artifact = "edu.wpi.first.wpinet:wpinet-java:2026.2.2",
        artifact_sha256 = "6d9a9d196dfa0b607c7e1f8b49fc7785ac0ebe72681d5afc767a36b09168be40",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiunits_wpiunits_java",
        artifact = "edu.wpi.first.wpiunits:wpiunits-java:2026.2.2",
        artifact_sha256 = "1453c202da01d95c390b37975fea74449e8d2e8f4843171b327b782c41d5d66a",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpimath_wpimath_java",
        artifact = "edu.wpi.first.wpimath:wpimath-java:2026.2.2",
        artifact_sha256 = "e9b927562272499d50fbbeb3041ceacf956302d75f281d099e009971ac74d709",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_apriltag_apriltag_java",
        artifact = "edu.wpi.first.apriltag:apriltag-java:2026.2.2",
        artifact_sha256 = "8fc2a13952944932b42a08ee9ef8cc6a0528950886fa8874f1c3333ad3b11663",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_hal_hal_java",
        artifact = "edu.wpi.first.hal:hal-java:2026.2.2",
        artifact_sha256 = "62b4007808aa0a0635a9d60f09855a139e67c1bc8fb551c8ae696db21e0847b5",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_ntcore_ntcore_java",
        artifact = "edu.wpi.first.ntcore:ntcore-java:2026.2.2",
        artifact_sha256 = "10959c3a6db310d394f1f5dfbcf72fdee5e0543bc4798b56b5a03c83ad41b354",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_epilogue_epilogue_runtime_java",
        artifact = "edu.wpi.first.epilogue:epilogue-runtime-java:2026.2.2",
        artifact_sha256 = "d687f4155f5ad0beffc8b1523371c624ca4bf2e028f40db3205347a46eaf7b56",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cscore_cscore_java",
        artifact = "edu.wpi.first.cscore:cscore-java:2026.2.2",
        artifact_sha256 = "61f1a1776a9d148b0851441f92de2b54129adcf3f98bd758e4b8f9bb5704a9b9",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cameraserver_cameraserver_java",
        artifact = "edu.wpi.first.cameraserver:cameraserver-java:2026.2.2",
        artifact_sha256 = "ff4c28f7b43db762936f64911b9af4a31cc4a850644c05a27f3fdc006e842fa4",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibj_wpilibj_java",
        artifact = "edu.wpi.first.wpilibj:wpilibj-java:2026.2.2",
        artifact_sha256 = "f482449e7e251ca3c6a484513d4767e0d382cc75f0e52d1d1b3ddc4370a53b69",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibnewcommands_wpilibnewcommands_java",
        artifact = "edu.wpi.first.wpilibNewCommands:wpilibNewCommands-java:2026.2.2",
        artifact_sha256 = "2fbfee819d217aed49e96ef0dadfc3d399e680701e87819b0e59e5305a922ee3",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_epilogue_epilogue_processor_java",
        artifact = "edu.wpi.first.epilogue:epilogue-processor-java:2026.2.2",
        artifact_sha256 = "119acaf8529fa602574935328d1403cbee6abf181659803017f4b2eb366d4e7e",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_fieldimages_fieldimages_java",
        artifact = "edu.wpi.first.fieldImages:fieldImages-java:2026.2.2",
        artifact_sha256 = "3069354bec636961c9f62a2298cdc3495b20aff10a635ce37e1d8d7c7a00114c",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_shuffleboard_api",
        artifact = "edu.wpi.first.shuffleboard:api:2026.2.2",
        artifact_sha256 = "7738ddf096a8e28f6bb4e50031bc58a3a65e58874812704594f9301a30be90e0",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )

setup_bzlmodrio_allwpilib_java_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_java_dependencies,
)
