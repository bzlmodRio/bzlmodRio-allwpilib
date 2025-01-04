import argparse
import os

from bazelrio_gentool.clean_existing_version import clean_existing_version
from bazelrio_gentool.cli import GenericCliArgs, add_generic_cli
from bazelrio_gentool.generate_group import generate_group
from bazelrio_gentool.generate_module_project_files import (
    create_default_mandatory_settings,
    generate_module_project_files,
)
from bazelrio_gentool.manual_cleanup_helper import manual_cleanup_helper
from get_allwpilib_dependencies import get_allwpilib_dependencies


def main():
    SCRIPT_DIR = os.environ["BUILD_WORKSPACE_DIRECTORY"]
    REPO_DIR = os.path.join(SCRIPT_DIR, "..")
    output_dir = os.path.join(REPO_DIR, "libraries")

    parser = argparse.ArgumentParser()
    add_generic_cli(parser)
    parser.add_argument("--use_local_opencv", action="store_true")
    parser.add_argument("--use_local_ni", action="store_true")
    args = parser.parse_args()

    group = get_allwpilib_dependencies(
        use_local_opencv=args.use_local_opencv, use_local_ni=args.use_local_ni
    )

    mandatory_dependencies = create_default_mandatory_settings(GenericCliArgs(args))

    clean_existing_version(REPO_DIR)
    generate_module_project_files(
        REPO_DIR,
        group,
        mandatory_dependencies,
    )
    generate_group(output_dir, group, force_tests=args.force_tests)

    manual_cleanup(REPO_DIR)


def manual_cleanup(REPO_DIR):

    # Manual cleanup
    for lib in ["hal", "wpiutil"]:
        lib_build = os.path.join(REPO_DIR, "private", "cpp", lib, "static.BUILD.bazel")
        manual_cleanup_helper(
            lib_build,
            lambda contents: contents.replace(
                "@bzlmodrio-ni//libraries/cpp/ni:static",
                "@bzlmodrio-ni//libraries/cpp/ni:shared",
            ),
        )

    filepath = os.path.join(REPO_DIR, "libraries", "tools", "tool_launchers.bzl")
    manual_cleanup_helper(
        filepath,
        lambda contents: contents.replace(
            "main_class = main_class,",
            'main_class = main_class,\n        javacopts = ["-Werror"],',
        ),
    )

    filepath = os.path.join(REPO_DIR, "libraries", "tools", "RobotBuilder", "BUILD")
    manual_cleanup_helper(
        filepath,
        lambda contents: contents.replace(
            'name = "RobotBuilder",',
            'name = "RobotBuilder",\n    javacopts = ["-Werror"],',
        ),
    )


if __name__ == "__main__":
    """
    bazel run @allwpilib//generate_allwpilib --enable_bzlmod
    """
    main()
