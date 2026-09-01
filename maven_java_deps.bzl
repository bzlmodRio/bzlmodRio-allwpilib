load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "org_wpilib_annotations_java",
        artifact = "org.wpilib:annotations-java:2027.0.0-alpha-6",
        artifact_sha256 = "b72a2d456b2c360e1c5e916c6855ee0a84d170e81e4191166bd21f1ab68d933a",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_wpiutil_wpiutil_java",
        artifact = "org.wpilib.wpiutil:wpiutil-java:2027.0.0-alpha-6",
        artifact_sha256 = "e35024cffc5b8039ccf1eab298a0c575bcde7e730e58f0fb441ece057e243abb",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_wpinet_wpinet_java",
        artifact = "org.wpilib.wpinet:wpinet-java:2027.0.0-alpha-6",
        artifact_sha256 = "fba35cb4a79e36ee66c9d3199143c43d1c26d007a4214d92f7fa6d18be09d74b",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_wpiunits_wpiunits_java",
        artifact = "org.wpilib.wpiunits:wpiunits-java:2027.0.0-alpha-6",
        artifact_sha256 = "51812cc46a99cfb1e79f31e24c8d968e7702da607fdbb819b91fbbce2f84583c",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_wpimath_wpimath_java",
        artifact = "org.wpilib.wpimath:wpimath-java:2027.0.0-alpha-6",
        artifact_sha256 = "69d4f7934823a3add0cc901502e0bd565c89951af657b2ea72b0ca483d25fb7a",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_apriltag_apriltag_java",
        artifact = "org.wpilib.apriltag:apriltag-java:2027.0.0-alpha-6",
        artifact_sha256 = "e6ba5cb612ab19329188a03724b5ec62a71f52882a22a5d36da8346f0a47e11f",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_hal_hal_java",
        artifact = "org.wpilib.hal:hal-java:2027.0.0-alpha-6",
        artifact_sha256 = "8bccdc082b8e15cb710b0f247a5ce76933e1fb9902bf0c7081a58f9f26f69956",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_ntcore_ntcore_java",
        artifact = "org.wpilib.ntcore:ntcore-java:2027.0.0-alpha-6",
        artifact_sha256 = "55400b8856d7a19023423f8cd7195f06648c54b1f88c1269d524f6266312388a",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_epilogue_epilogue_runtime_java",
        artifact = "org.wpilib.epilogue:epilogue-runtime-java:2027.0.0-alpha-6",
        artifact_sha256 = "872577e324a0ddff1631ea2773412280794950c1a06e2e3cd01054c53accc131",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_cscore_cscore_java",
        artifact = "org.wpilib.cscore:cscore-java:2027.0.0-alpha-6",
        artifact_sha256 = "86a8c48878c6fc97a93fc9df1a02854b1975dcf97ba927f6dd13f1190de004ba",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_cameraserver_cameraserver_java",
        artifact = "org.wpilib.cameraserver:cameraserver-java:2027.0.0-alpha-6",
        artifact_sha256 = "052e14b6f9796480e7a7ef1979f782a30c35bbca194badeb159027615a2fd8fd",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_wpilibj_wpilibj_java",
        artifact = "org.wpilib.wpilibj:wpilibj-java:2027.0.0-alpha-6",
        artifact_sha256 = "44c3fbff4b16a36d966af91c62432ae9b71c09fef70c3f9dffea769bfef30d3d",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_commandsv2_commandsv2_java",
        artifact = "org.wpilib.commandsv2:commandsv2-java:2027.0.0-alpha-6",
        artifact_sha256 = "66d3500ebc5363c056561815c32a206379f7868cd2a63c5bbde4033696b31c55",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_commands3_java",
        artifact = "org.wpilib:commands3-java:2027.0.0-alpha-6",
        artifact_sha256 = "a55ab8b37d21c1f21631085968c1259af29e64d389eccf059cb03e8a178b3f41",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_epilogue_epilogue_processor_java",
        artifact = "org.wpilib.epilogue:epilogue-processor-java:2027.0.0-alpha-6",
        artifact_sha256 = "75639212c0be9f510ac596070e6525b13fb09a86f31984392fd8444260e44489",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )
    jvm_maven_import_external(
        name = "org_wpilib_fields_fields_java",
        artifact = "org.wpilib.fields:fields-java:2027.0.0-alpha-6",
        artifact_sha256 = "81927af2a87d1c51c6e37d9debf2d0adf77d580041d5965c057010636ceadf71",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release-2027"],
    )

setup_bzlmodrio_allwpilib_java_dependencies = module_extension(
    __setup_bzlmodrio_allwpilib_java_dependencies,
)
