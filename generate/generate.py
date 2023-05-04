import os
from get_allwpilib_dependencies import get_allwpilib_dependencies

from bazelrio_gentool.generate_group import generate_group
from bazelrio_gentool.generate_module_project_files import (
    generate_module_project_files,
    create_default_mandatory_settings,
)
from bazelrio_gentool.clean_existing_version import clean_existing_version
from bazelrio_gentool.utils import TEMPLATE_BASE_DIR, render_template
from bazelrio_gentool.cli import add_generic_cli, GenericCliArgs
import argparse


def main():
    SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
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
    generate_module_project_files(REPO_DIR, group, mandatory_dependencies)
    generate_group(output_dir, group, force_tests=args.force_tests)

    manual_cleanup(REPO_DIR)


def manual_cleanup(REPO_DIR):
    # Manual cleanup
    hal_build = os.path.join(REPO_DIR, "libraries", "cpp", "hal", "BUILD.bazel")
    with open(hal_build, "r") as f:
        contents = f.read()

    contents = contents.replace(
        "@bzlmodrio-ni//libraries/cpp/ni:static",
        "@bzlmodrio-ni//libraries/cpp/ni:shared",
    )
    with open(hal_build, "w") as f:
        f.write(contents)


if __name__ == "__main__":
    """
    bazel run @allwpilib//generate_allwpilib --enable_bzlmod
    """
    main()
