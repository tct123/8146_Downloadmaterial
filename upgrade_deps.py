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

print(dir_list)
