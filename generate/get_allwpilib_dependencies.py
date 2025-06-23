from bazelrio_gentool.deps.dependency_container import (
    DependencyContainer,
    ModuleDependency,
)
from get_ni_dependencies import get_ni_dependencies
from get_opencv_dependencies import get_opencv_dependencies


def _default_native_shared_platforms():
    return [
        "linuxarm32",
        "linuxarm64",
        "linuxx86-64",
        "osxuniversal",
        "windowsx86-64",
        "windowsarm64",
    ]


def _make_native_static_platforms(platforms):
    return [x + "static" for x in platforms]


def _make_native_shared_debug_platforms(platforms):
    return [x + "debug" for x in platforms]


def _make_native_static_debug_platforms(platforms):
    return [x + "staticdebug" for x in platforms]


def _make_all_native_platforms(platforms):
    return (
        platforms
        + _make_native_static_platforms(platforms)
        + _make_native_shared_debug_platforms(platforms)
        + _make_native_static_debug_platforms(platforms)
    )


def _default_embedded_platforms():
    return ["linuxsystemcore"]


def _default_all_platforms():
    return (
        []
        + _make_all_native_platforms(_default_native_shared_platforms())
        + _make_all_native_platforms(_default_embedded_platforms())
    )


def _cc_dependency(group, parent_folder, resources=None, **kwargs):
    if resources == None:
        resources = _default_all_platforms()
    group.create_cc_dependency(
        f"{parent_folder}-cpp",
        group_id=f"edu.wpi.first.{parent_folder}",
        parent_folder=parent_folder,
        headers="headers",
        sources="sources",
        resources=resources,
        **kwargs,
    )


def _java_dependency(group, parent_folder, has_jni=False, **kwargs):
    group.create_java_dependency(
        f"{parent_folder}-java",
        group_id=f"edu.wpi.first.{parent_folder}",
        parent_folder=parent_folder,
        **kwargs,
    )


def _halsim_dependency(group, parent_folder, resources=None, **kwargs):
    if resources == None:
        resources = _make_all_native_platforms(_default_native_shared_platforms())
    group.create_cc_dependency(
        f"{parent_folder}",
        group_id=f"edu.wpi.first.halsim",
        has_jni=False,
        parent_folder=parent_folder,
        headers="headers",
        sources="sources",
        resources=resources,
        **kwargs,
    )


def _executable_tool(
    maven_dep,
    artifact_name,
    group_id="edu.wpi.first.tools",
    native_platforms=None,
    lower_target_name=False,
):
    native_platforms = native_platforms or _default_native_shared_platforms()

    maven_dep.create_executable_tool(
        artifact_name=artifact_name,
        group_id=group_id,
        resources=native_platforms,
        lower_target_name=lower_target_name,
        fail_on_hash_miss=not ("alpha" in maven_dep.version),
    )


def get_allwpilib_dependencies(
    use_local_opencv=False,
    use_local_ni=False,
    opencv_version_override="2025.4.10.0-3.bcr2",
    ni_version_override="2025.2.0.bcr1",
):
    year = "2027"
    version = "2027.0.0-alpha-1"
    patch = ".bcr1"

    opencv_dependency = ModuleDependency(
        get_opencv_dependencies(),
        use_local_version=use_local_opencv,
        override_version=opencv_version_override,
        local_rel_folder="../../libraries/bzlmodRio-opencv",
        remote_repo="bzlmodRio-opencv",
    )
    ni_dependency = ModuleDependency(
        get_ni_dependencies(),
        use_local_version=use_local_ni,
        override_version=ni_version_override,
        local_rel_folder="../../libraries/bzlmodRio-ni",
        remote_repo="bzlmodRio-ni",
    )

    group = DependencyContainer(
        "bzlmodrio-allwpilib",
        version,
        year,
        "https://frcmaven.wpi.edu/artifactory/release-2027",
        patch=patch,
    )
    group.add_module_dependency(opencv_dependency)
    group.add_module_dependency(ni_dependency, meta_deps=["ni"])

    _cc_dependency(
        group,
        "wpiutil",
        has_jni=True,
        dependencies=["ni"],
    )
    _cc_dependency(
        group,
        "datalog",
        has_jni=True,
        dependencies=["wpiutil-cpp"],
    )
    _cc_dependency(group, "wpinet", has_jni=True, dependencies=["wpiutil-cpp"])
    _cc_dependency(group, "wpimath", has_jni=True, dependencies=["wpiutil-cpp"])
    _cc_dependency(
        group, "apriltag", has_jni=True, dependencies=["wpiutil-cpp", "wpimath-cpp"]
    )
    _cc_dependency(
        group,
        "hal",
        has_jni=True,
        dependencies=["wpiutil-cpp", "ni"],
        artifact_install_name="wpiHal",
    )
    _cc_dependency(
        group,
        "ntcore",
        has_jni=True,
        dependencies=["wpiutil-cpp", "wpinet-cpp", "datalog-cpp"],
    )
    _cc_dependency(
        group,
        "cscore",
        has_jni=True,
        dependencies=["wpiutil-cpp", "wpinet-cpp", "opencv-cpp"],
    )
    _cc_dependency(
        group,
        "cameraserver",
        has_jni=False,
        dependencies=[
            "wpiutil-cpp",
            "cscore-cpp",
            "ntcore-cpp",
            "wpinet-cpp",
            "opencv-cpp",
        ],
    )
    _cc_dependency(
        group,
        "wpilibc",
        has_jni=False,
        dependencies=[
            "wpiutil-cpp",
            "wpimath-cpp",
            "ntcore-cpp",
            "hal-cpp",
            "wpinet-cpp",
        ],
    )
    _cc_dependency(
        group,
        "wpilibNewCommands",
        has_jni=False,
        dependencies=[
            "wpiutil-cpp",
            "wpimath-cpp",
            "cscore-cpp",
            "ntcore-cpp",
            "hal-cpp",
            "cameraserver-cpp",
            "opencv-cpp",
            "wpilibc-cpp",
            "wpinet-cpp",
        ],
    )

    _cc_dependency(
        group,
        "romiVendordep",
        has_jni=False,
        dependencies=[
            "wpilibc-cpp",
        ],
    )

    _cc_dependency(
        group,
        "xrpVendordep",
        has_jni=False,
        dependencies=[
            "wpilibc-cpp",
        ],
    )

    _java_dependency(
        group,
        "wpiutil",
        dependencies=["wpiutil-cpp"],
        maven_deps=[
            ("com.fasterxml.jackson.core:jackson-annotations", "2.15.2"),
            ("com.fasterxml.jackson.core:jackson-core", "2.15.2"),
            ("com.fasterxml.jackson.core:jackson-databind", "2.15.2"),
            ("us.hebi.quickbuf:quickbuf-runtime", "1.3.2"),
        ],
    )
    _java_dependency(
        group, "wpinet", dependencies=["wpiutil-java", "wpiutil-cpp", "wpinet-cpp"]
    )
    _java_dependency(group, "wpiunits", dependencies=[])
    _java_dependency(
        group,
        "wpimath",
        dependencies=["wpiutil-java", "wpiutil-cpp", "wpimath-cpp", "wpiunits-java"],
        maven_deps=[
            ("com.fasterxml.jackson.core:jackson-annotations", "2.15.2"),
            ("com.fasterxml.jackson.core:jackson-core", "2.15.2"),
            ("com.fasterxml.jackson.core:jackson-databind", "2.15.2"),
            ("org.ejml:ejml-simple", "0.43.1"),
        ],
    )
    _java_dependency(group, "apriltag", dependencies=["wpimath-java", "apriltag-cpp"])
    _java_dependency(
        group, "hal", dependencies=["wpiutil-java", "wpiutil-cpp", "hal-cpp"]
    )
    _java_dependency(
        group, "ntcore", dependencies=["wpiutil-java", "wpiutil-cpp", "ntcore-cpp"]
    )
    _java_dependency(
        group,
        "cscore",
        dependencies=[
            "wpiutil-java",
            "wpiutil-cpp",
            "cscore-cpp",
            "opencv-cpp",
            "opencv-java",
        ],
    )
    _java_dependency(
        group,
        "cameraserver",
        dependencies=[
            "wpiutil-java",
            "wpiutil-cpp",
            "cscore-cpp",
            "cscore-java",
            "ntcore-java",
            "ntcore-cpp",
            "opencv-cpp",
        ],
    )
    _java_dependency(
        group,
        "wpilibj",
        dependencies=[
            "wpiutil-cpp",
            "wpiutil-java",
            "wpimath-cpp",
            "wpimath-java",
            "cscore-cpp",
            "cscore-java",
            "ntcore-cpp",
            "ntcore-java",
            "hal-cpp",
            "hal-java",
            "cameraserver-java",
            "opencv-cpp",
        ],
    )
    _java_dependency(
        group,
        "wpilibNewCommands",
        dependencies=[
            "wpiutil-cpp",
            "wpiutil-java",
            "wpimath-cpp",
            "wpimath-java",
            "cscore-cpp",
            "cscore-java",
            "ntcore-cpp",
            "ntcore-java",
            "hal-cpp",
            "hal-java",
            "cameraserver-java",
            "opencv-cpp",
            "wpilibj-java",
        ],
    )

    _java_dependency(
        group,
        "fieldImages",
        dependencies=[],
        maven_deps=[
            ("com.fasterxml.jackson.core:jackson-annotations", "2.15.2"),
            ("com.fasterxml.jackson.core:jackson-core", "2.15.2"),
            ("com.fasterxml.jackson.core:jackson-databind", "2.15.2"),
        ],
    )

    _halsim_dependency(
        group, "halsim_ds_socket", dependencies=["hal-cpp", "wpinet-cpp", "wpiutil-cpp"]
    )
    _halsim_dependency(
        group,
        "halsim_gui",
        dependencies=["hal-cpp", "wpimath-cpp", "wpiutil-cpp", "ntcore-cpp"],
    )
    _halsim_dependency(
        group, "halsim_ws_client", dependencies=["hal-cpp", "wpinet-cpp", "wpiutil-cpp"]
    )
    _halsim_dependency(
        group, "halsim_ws_server", dependencies=["hal-cpp", "wpinet-cpp", "wpiutil-cpp"]
    )

    _executable_tool(group, "Glass", lower_target_name=True)
    _executable_tool(group, "OutlineViewer", lower_target_name=True)
    _executable_tool(group, "DataLogTool", lower_target_name=True)
    _executable_tool(
        group,
        "SysId",
        lower_target_name=True,
        native_platforms=[
            "linuxx86-64",
            "osxuniversal",
            "windowsx86-64",
            "windowsarm64",
        ],
    )

    return group


if __name__ == "__main__":
    get_allwpilib_dependencies()
