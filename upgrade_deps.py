import os
import subprocess


def is_flutter_project(path):
    return os.path.isfile(os.path.join(path, "pubspec.yaml"))


def upgrade_dependencies(root_dir):
    for dirpath, dirnames, filenames in os.walk(root_dir):
        if "pubspec.yaml" in filenames:
            print(f"Upgrade in: {dirpath}")
            try:
                subprocess.run(
                    ["flutter", "pub", "upgrade", "--major-versions"],
                    cwd=dirpath,
                    check=True,
                )
            except subprocess.CalledProcessError:
                print(f"Fehler beim Upgrade in {dirpath}")
            # Keine weiteren Unterordner durchsuchen, wenn dies ein Flutter-Projekt ist
            dirnames[:] = []


if __name__ == "__main__":
    upgrade_dependencies(os.getcwd())
