import sys

from get_opencv_dependencies import get_opencv_dependencies
from get_ni_dependencies import get_ni_dependencies
from bazelrio_gentool.deps.dependency_container import (
    DependencyContainer,
    ModuleDependency,
)


def _default_native_shared_platforms():
    return [
        "linuxx86-64",
        "osxx86-64",
        "windowsx86-64",
        "windowsx86",
    ]
    # return ["linuxarm32", "linuxarm64", "linuxx86-64", "osxuniversal", "windowsx86-64"]


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
    return ["linuxathena", "linuxaarch64bionic", "linuxraspbian"]


def _default_all_platforms():
    return (
        []
        + _make_all_native_platforms(_default_native_shared_platforms())
        + _make_all_native_platforms(_default_embedded_platforms())
    )


def _default_java_tools_platforms():
    return ["linux64", "mac64", "win64"]


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
        headers=None,
        sources="sources",
        resources=resources,
        **kwargs,
    )


def _java_tool(
    maven_dep,
    artifact_name,
    main_class,
    group_id="edu.wpi.first.tools",
    native_platforms=_default_java_tools_platforms(),
):
    if native_platforms:
        maven_dep.create_java_native_tool(
            main_class=main_class,
            artifact_name=artifact_name,
            group_id=group_id,
            resources=native_platforms,
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
    )


def get_allwpilib_dependencies(
    use_local_opencv=False, use_local_ni=False, version=None
):
    year = "2022"
    version = f"{year}.4.1"
    opencv_version = None  # "3.4.7-4"
    ni_version = None  # ""

    opencv_dependency = ModuleDependency(
        get_opencv_dependencies(),
        use_local_version=use_local_opencv,
        override_version=opencv_version,
        local_rel_folder="../../bzlmodRio-opencv",
        remote_repo="bzlmodRio-opencv",
    )
    ni_dependency = ModuleDependency(
        get_ni_dependencies(),
        use_local_version=use_local_ni,
        override_version=ni_version,
        local_rel_folder="../../bzlmodRio-ni",
        remote_repo="bzlmodRio-ni",
    )

    group = DependencyContainer(
        "bzlmodrio-allwpilib", version, year, "https://frcmaven.wpi.edu/release"
    )
    group.add_module_dependency(opencv_dependency)
    group.add_module_dependency(ni_dependency, meta_deps=["ni"])

    _cc_dependency(group, "wpiutil", has_jni=True)
    # _cc_dependency(group, "wpinet", has_jni=True, dependencies=["wpiutil-cpp"])
    _cc_dependency(group, "wpimath", has_jni=True, dependencies=["wpiutil-cpp"])
    _cc_dependency(group, "hal", has_jni=True, dependencies=["wpiutil-cpp", "ni"])
    _cc_dependency(group, "ntcore", has_jni=True, dependencies=["wpiutil-cpp"])
    _cc_dependency(
        group,
        "cscore",
        has_jni=True,
        dependencies=["wpiutil-cpp", "opencv-cpp"],
    )
    _cc_dependency(
        group,
        "cameraserver",
        has_jni=False,
        dependencies=["wpiutil-cpp", "cscore-cpp", "ntcore-cpp", "opencv-cpp"],
    )
    _cc_dependency(
        group,
        "wpilibc",
        has_jni=False,
        dependencies=[
            "wpiutil-cpp",
            "wpimath-cpp",
            "cscore-cpp",
            "ntcore-cpp",
            "hal-cpp",
            "cameraserver-cpp",
            "opencv-cpp",
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
        ],
    )
    _cc_dependency(
        group,
        "wpilibOldCommands",
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
        ],
    )

    _java_dependency(
        group,
        "wpiutil",
        dependencies=["wpiutil-cpp"],
        maven_deps=[
            ("com.fasterxml.jackson.core:jackson-annotations", "2.12.4"),
            ("com.fasterxml.jackson.core:jackson-core", "2.12.4"),
            ("com.fasterxml.jackson.core:jackson-databind", "2.12.4"),
        ],
    )
    # _java_dependency(
    #     group, "wpinet", dependencies=["wpiutil-java", "wpiutil-cpp"]
    # )
    _java_dependency(
        group,
        "wpimath",
        dependencies=["wpiutil-java", "wpiutil-cpp", "wpimath-cpp"],
        maven_deps=[("org.ejml:ejml-simple", "0.41")],
    )
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
        "wpilibOldCommands",
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

    _java_dependency(group, "fieldImages", dependencies=[])

    _halsim_dependency(
        group, "halsim_ds_socket", dependencies=["hal-cpp", "wpiutil-cpp"]
    )
    _halsim_dependency(
        group, "halsim_gui", dependencies=["hal-cpp", "wpiutil-cpp", "ntcore-cpp"]
    )
    _halsim_dependency(
        group, "halsim_ws_client", dependencies=["hal-cpp", "wpiutil-cpp"]
    )
    _halsim_dependency(
        group, "halsim_ws_server", dependencies=["hal-cpp", "wpiutil-cpp"]
    )

    group.create_java_dependency(
        "api",
        group_id=f"edu.wpi.first.shuffleboard",
        parent_folder="shuffleboard-api",
    )

    _executable_tool(group, "Glass", lower_target_name=True)
    _executable_tool(group, "OutlineViewer", lower_target_name=True)
    _executable_tool(group, "SysId")
    _java_tool(
        group,
        "SmartDashboard",
        main_class="edu.wpi.first.smartdashboard.SmartDashboard",
    )
    _java_tool(group, "PathWeaver", main_class="edu.wpi.first.pathweaver.Main")
    _java_tool(
        group,
        "RobotBuilder",
        main_class="robotbuilder.RobotBuilder",
        native_platforms=[""],
    )
    _java_tool(
        group,
        "shuffleboard",
        main_class="edu.wpi.first.shuffleboard.app.Main",
        group_id="edu.wpi.first.shuffleboard",
        native_platforms=["linux64", "mac64", "win64"],
    )

    return group


if __name__ == "__main__":
    get_allwpilib_dependencies()
