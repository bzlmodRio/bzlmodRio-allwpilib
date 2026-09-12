load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "org_wpilib_annotations_java",
        artifact = "org.wpilib:annotations-java:2027.0.0-alpha-7",
        artifact_sha256 = "5b0732c74e87e58d92abf991f03f5e4c3d5b782a3836b3922ba5c6299dc6783a",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_wpiutil_wpiutil_java",
        artifact = "org.wpilib.wpiutil:wpiutil-java:2027.0.0-alpha-7",
        artifact_sha256 = "086803153340e3070b1f0c4a297b4775f920f6ed53cd134c6d8b28ed19d4b664",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_wpinet_wpinet_java",
        artifact = "org.wpilib.wpinet:wpinet-java:2027.0.0-alpha-7",
        artifact_sha256 = "68405d182a74cce68dfaff2f9cab08553b09430835cf5ee13eed3b5475fe7494",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_datalog_datalog_java",
        artifact = "org.wpilib.datalog:datalog-java:2027.0.0-alpha-7",
        artifact_sha256 = "1aa1042c101e159824aba21635c9750cce0545c7c06051248365d7584539ae70",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_telemetry_telemetry_java",
        artifact = "org.wpilib.telemetry:telemetry-java:2027.0.0-alpha-7",
        artifact_sha256 = "6f83e03a62419fa2cace46e18e6ea56dcc60d5354ff36323fdce4aadb63291ef",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_tunables_tunables_java",
        artifact = "org.wpilib.tunables:tunables-java:2027.0.0-alpha-7",
        artifact_sha256 = "4564954282e960ca95172b89fbd9ffb5d3e2ea5911f4c46fb71aab8d2ba9bfff",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_wpiunits_wpiunits_java",
        artifact = "org.wpilib.wpiunits:wpiunits-java:2027.0.0-alpha-7",
        artifact_sha256 = "c8cd062785ce6ada6af6e092e80555ad345aa1c4a3eec622fc2dec88eec8f7c3",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_wpimath_wpimath_java",
        artifact = "org.wpilib.wpimath:wpimath-java:2027.0.0-alpha-7",
        artifact_sha256 = "720d9441b5abadc5cc2cc28f3f0ebe1c32cec24fc7e874b0a01b08daba183219",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_apriltag_apriltag_java",
        artifact = "org.wpilib.apriltag:apriltag-java:2027.0.0-alpha-7",
        artifact_sha256 = "65720ee88534009541e763afb2371e7f3e956bd7bf617b5f75ca9f4757ef9f9e",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_hal_hal_java",
        artifact = "org.wpilib.hal:hal-java:2027.0.0-alpha-7",
        artifact_sha256 = "859399ba5e86259e65ff0a79ffeec3a07627c15134ab4434287031a285b1867a",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_ntcore_ntcore_java",
        artifact = "org.wpilib.ntcore:ntcore-java:2027.0.0-alpha-7",
        artifact_sha256 = "63867e59b758bf63e82fe11b19c6fb6335396c7a828788fcc121ed26dff21e49",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_epilogue_epilogue_runtime_java",
        artifact = "org.wpilib.epilogue:epilogue-runtime-java:2027.0.0-alpha-7",
        artifact_sha256 = "b7ade0318adf9d9b3e7659f1a395cef819d20acdcc4953751a3ec683af1d4548",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_cscore_cscore_java",
        artifact = "org.wpilib.cscore:cscore-java:2027.0.0-alpha-7",
        artifact_sha256 = "3e7e5b9ceccd43a1a2e6e31ee5990fcbbf1cea3e303b44ec71ce75f8b0e83bc2",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_wpilibj_wpilibj_java",
        artifact = "org.wpilib.wpilibj:wpilibj-java:2027.0.0-alpha-7",
        artifact_sha256 = "08c6d7b6933ecf26422bf49dbc4c50fd84e1158c6d03394a28f9705ffc716a8e",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_cameraserver_cameraserver_java",
        artifact = "org.wpilib.cameraserver:cameraserver-java:2027.0.0-alpha-7",
        artifact_sha256 = "260a8e6d2a8bcd42184cd1ceac53c613dec5e6dc1b85da9d01badf2b02c9eb17",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_drivers_drivers_java",
        artifact = "org.wpilib.drivers:drivers-java:2027.0.0-alpha-7",
        artifact_sha256 = "53cbf1f81dc2f5ab5ec4717ae82a00821f00e8db272ecdc874ed56c467149597",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_commandsv2_commandsv2_java",
        artifact = "org.wpilib.commandsv2:commandsv2-java:2027.0.0-alpha-7",
        artifact_sha256 = "1e24fde28101da1f9e811d9732baa41dc6d63f0026ee887a2da0d939a9ffcdb4",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_commandsv3_java",
        artifact = "org.wpilib:commandsv3-java:2027.0.0-alpha-7",
        artifact_sha256 = "1cb1ec69c2c1c25ed6f035f37f5154b1766287c54ef331d29463b2008d131643",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_epilogue_epilogue_processor_java",
        artifact = "org.wpilib.epilogue:epilogue-processor-java:2027.0.0-alpha-7",
        artifact_sha256 = "93eed74d2b057c4b46cd1ef06856e997d4dc9ad1397d54546ec2818a7ce4bb3e",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_fields_fields_java",
        artifact = "org.wpilib.fields:fields-java:2027.0.0-alpha-7",
        artifact_sha256 = "fcac923940c45792629546c6a6c853a170e4d628e4ff79a9594403cef86576d9",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )

setup_bzlmodrio_allwpilib_java_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_java_dependencies,
)
