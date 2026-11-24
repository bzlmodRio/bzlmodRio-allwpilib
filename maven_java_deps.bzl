load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "org_wpilib_annotations_java",
        artifact = "org.wpilib:annotations-java:2027.0.0-alpha-8",
        artifact_sha256 = "02b168bcb0d77e92a30086d3ed4aa5705ff4ebb9f3d211964ae776d995ac42f4",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_wpiutil_wpiutil_java",
        artifact = "org.wpilib.wpiutil:wpiutil-java:2027.0.0-alpha-8",
        artifact_sha256 = "b7227ff3bf15edcbe3346b244bba72c53ce898806f7d9295c09bba05c70c4023",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_wpinet_wpinet_java",
        artifact = "org.wpilib.wpinet:wpinet-java:2027.0.0-alpha-8",
        artifact_sha256 = "f8a5269f58d800a2a0de92af16f3827067b39cf159275b6a063d8d7cdde16606",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_datalog_datalog_java",
        artifact = "org.wpilib.datalog:datalog-java:2027.0.0-alpha-8",
        artifact_sha256 = "f5cdf81125a848c7535004b77ac3673afd7a569d639674f7ed3ef6ecd727b097",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_telemetry_telemetry_java",
        artifact = "org.wpilib.telemetry:telemetry-java:2027.0.0-alpha-8",
        artifact_sha256 = "fcbed7b77d1b52a7b94ae52645d2a7318effdfc52d0405ff2542e8a2d50abec8",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_tunables_tunables_java",
        artifact = "org.wpilib.tunables:tunables-java:2027.0.0-alpha-8",
        artifact_sha256 = "a955c807c392a64e1d49cf4757cb80d06b832cfb60235426274616952649543e",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_wpiunits_wpiunits_java",
        artifact = "org.wpilib.wpiunits:wpiunits-java:2027.0.0-alpha-8",
        artifact_sha256 = "406b26dd41e5e913e5af5cdff8f6bbe99b3a11fc2ab19aa49ac2de7f10bf1855",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_wpimath_wpimath_java",
        artifact = "org.wpilib.wpimath:wpimath-java:2027.0.0-alpha-8",
        artifact_sha256 = "a79ea1b9da6d4185aecd67830f5e5b1f87cbb3e24eb6e890067979c772e1bbe6",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_apriltag_apriltag_java",
        artifact = "org.wpilib.apriltag:apriltag-java:2027.0.0-alpha-8",
        artifact_sha256 = "d448dbed8afb89cf09857ea29298a1419c5b68a81e8702d58672a3d7547f0a70",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_hal_hal_java",
        artifact = "org.wpilib.hal:hal-java:2027.0.0-alpha-8",
        artifact_sha256 = "f7c0d2534dc3876fc18c65b33e6919938953a551d7d8c571544dbcfd1917befc",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_ntcore_ntcore_java",
        artifact = "org.wpilib.ntcore:ntcore-java:2027.0.0-alpha-8",
        artifact_sha256 = "8850d816cb215cac145fb6e6fe1e8b39de2937e8debb789e8ea02a1b4521eb2c",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_epilogue_epilogue_runtime_java",
        artifact = "org.wpilib.epilogue:epilogue-runtime-java:2027.0.0-alpha-8",
        artifact_sha256 = "4f370c2b62df646f2335ca5b4e8c25de5d10e08b52a6f4b2be4ca710c1c2cb73",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_cscore_cscore_java",
        artifact = "org.wpilib.cscore:cscore-java:2027.0.0-alpha-8",
        artifact_sha256 = "3ae5eef8abc512bba499267f046a2c0cba179b91f10126160563bde0b6b84f84",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_wpilibj_wpilibj_java",
        artifact = "org.wpilib.wpilibj:wpilibj-java:2027.0.0-alpha-8",
        artifact_sha256 = "d119c45af37e44cc6695f51cb68dd11f6d8ff2e6dafa1181aeb137b30e7cbe30",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_cameraserver_cameraserver_java",
        artifact = "org.wpilib.cameraserver:cameraserver-java:2027.0.0-alpha-8",
        artifact_sha256 = "0edaea7ca4aa5d899b8e040b39aba2bf7ebe66d2f0f4b5f25b7ecdb0dba40d6b",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_drivers_drivers_java",
        artifact = "org.wpilib.drivers:drivers-java:2027.0.0-alpha-8",
        artifact_sha256 = "cd1d701ec1a71fd774df3d0c3addc5889128ca51af45d4a2cd1b592b2349b7e3",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_commandsv2_commandsv2_java",
        artifact = "org.wpilib.commandsv2:commandsv2-java:2027.0.0-alpha-8",
        artifact_sha256 = "1facaffa5179542d7bcea03fd5d9134bd2cde85aff8cb01260ab407d8447edad",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_commandsv3_java",
        artifact = "org.wpilib:commandsv3-java:2027.0.0-alpha-8",
        artifact_sha256 = "1486c9e361d58aa37bddd06c1a1d4a89eece0ff7a16c9771034c7e735c9ad3a2",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_epilogue_epilogue_processor_java",
        artifact = "org.wpilib.epilogue:epilogue-processor-java:2027.0.0-alpha-8",
        artifact_sha256 = "8667841a868cf585f014b5c75cea50dc9149d68e9577e064f542d7b9dcb65b71",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_fields_fields_java",
        artifact = "org.wpilib.fields:fields-java:2027.0.0-alpha-8",
        artifact_sha256 = "655139c62100b40a534826a93bd661e9e45c6f47306e136c424ecba7f555c6a6",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )

setup_bzlmodrio_allwpilib_java_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_java_dependencies,
)
