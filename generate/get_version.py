from get_allwpilib_dependencies import get_allwpilib_dependencies


def main():
    group = get_allwpilib_dependencies()
    print(group.version)


if __name__ == "__main__":
    main()
