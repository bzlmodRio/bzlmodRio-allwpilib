load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_allwpilib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "org_wpilib_annotations_java",
        artifact = "org.wpilib:annotations-java:2026.1.1-beta-1",
        artifact_sha256 = "c40492bbd65eb0fc2c2697c3c60d2784363c0586371cf3ec84a244d1efaf9d41",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiutil_wpiutil_java",
        artifact = "edu.wpi.first.wpiutil:wpiutil-java:2026.1.1-beta-1",
        artifact_sha256 = "6e622e0adccbc4a907ef454b9ba3f0aac3a161f618ecc0f0756c17e5e8da86d9",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpinet_wpinet_java",
        artifact = "edu.wpi.first.wpinet:wpinet-java:2026.1.1-beta-1",
        artifact_sha256 = "4dcb9104a2322822048bbb35b7a458a7da8c5987be3dc4c4e9386c7db20b5bae",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpiunits_wpiunits_java",
        artifact = "edu.wpi.first.wpiunits:wpiunits-java:2026.1.1-beta-1",
        artifact_sha256 = "7d106203c974ce0e283e9b28f4b03264f85496ef59667ded927e8361d57d8f04",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpimath_wpimath_java",
        artifact = "edu.wpi.first.wpimath:wpimath-java:2026.1.1-beta-1",
        artifact_sha256 = "6d4de38a4f98a6da5b30657941e6bda372b8957cdfb9f034dfc03a0dd079d3cf",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_apriltag_apriltag_java",
        artifact = "edu.wpi.first.apriltag:apriltag-java:2026.1.1-beta-1",
        artifact_sha256 = "2a5704fc14d537a8645a13b4472a14089c812f16dd7f938a34723a287bea2a85",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_hal_hal_java",
        artifact = "edu.wpi.first.hal:hal-java:2026.1.1-beta-1",
        artifact_sha256 = "da876de959446e04d3855e9674e5663250ef143078daec9f6aadfbe634095b56",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_ntcore_ntcore_java",
        artifact = "edu.wpi.first.ntcore:ntcore-java:2026.1.1-beta-1",
        artifact_sha256 = "3d832219243d7349b5788fdb6322d78604b18f5caba5a99db6497cd7061dfdaa",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_epilogue_epilogue_runtime_java",
        artifact = "edu.wpi.first.epilogue:epilogue-runtime-java:2026.1.1-beta-1",
        artifact_sha256 = "62177166921d3af76c92cf8d4a5f13ff799ff12500f3f2ea349c2ab215bc46a7",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cscore_cscore_java",
        artifact = "edu.wpi.first.cscore:cscore-java:2026.1.1-beta-1",
        artifact_sha256 = "5373d379ab9bac9d7d9fb1736170945f51f7e978edd766247df7bff0f4273a04",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_cameraserver_cameraserver_java",
        artifact = "edu.wpi.first.cameraserver:cameraserver-java:2026.1.1-beta-1",
        artifact_sha256 = "6b945bd1892d91903203afc5edaedffdffe86b50f82204804be4256ca6352634",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibj_wpilibj_java",
        artifact = "edu.wpi.first.wpilibj:wpilibj-java:2026.1.1-beta-1",
        artifact_sha256 = "16f9f21759d3640e75621e277e7332e166a51e8ce6da680e77714ebaf1b85d1f",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_wpilibnewcommands_wpilibnewcommands_java",
        artifact = "edu.wpi.first.wpilibNewCommands:wpilibNewCommands-java:2026.1.1-beta-1",
        artifact_sha256 = "f7d2909d0b4e220c325d628feaf159d2f4d2ca3aa8178b7a310ae553373a2c3e",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_epilogue_epilogue_processor_java",
        artifact = "edu.wpi.first.epilogue:epilogue-processor-java:2026.1.1-beta-1",
        artifact_sha256 = "d252d724c308b47cc2a7f0b935bb6ed5108b7edf1704565fb491d3710e2fa965",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_fieldimages_fieldimages_java",
        artifact = "edu.wpi.first.fieldImages:fieldImages-java:2026.1.1-beta-1",
        artifact_sha256 = "e567712c54969263af34b179711af725fffb58921ae0c137972c31adbdb231b9",
        server_urls = ["https://frcmaven.wpi.edu/release"],
    )
    jvm_maven_import_external(
        name = "edu_wpi_first_shuffleboard_api",
        artifact = "edu.wpi.first.shuffleboard:api:2026.1.1-beta-1",
        artifact_sha256 = "9b3aaf6ea0e4b408292722856a257ea436210d21c987e734998674ff4d48b083",
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
