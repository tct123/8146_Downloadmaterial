# flutter pub upgrade --major-versions
import os
import subprocess

path = "."
take = 0
first_dir_list = os.listdir()
dir_list = []
for dir in first_dir_list:
    if "." in dir:
        pass
    else:
        dir_list.append(dir)
for dir in dir_list:
    print(dir)
    subprocess.run(["cd", dir])
    subprocess.run(["flutter", "pub", "upgrade", "--major-versions"])

# print(dir_list)
