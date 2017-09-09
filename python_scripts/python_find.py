#!/usr/bin/env python3

import os
import sys
import re


def safe_argv_get(index, default=0):
    try:
        return int(sys.argv[index])
    except IndexError:
        return default


def find_log_files(p):
    p = re.compile(p)

    files = []
    for file in os.listdir(".."):
        if p.search(file):
            file = os.path.abspath(os.path.join("..", file))
            files.append(file)
    files.sort()
    return files


def search_in_log_files(file_list, p):
    for file in file_list:
        print(file)

        with open(file) as f:
            for line in f:
                result = re.search(p, line)

                if result:
                    value = int(result.group(1))
                    print("{0} {1}".format(value, "<==" if value > 20 else ""))
            print("")


if __name__ == "__main__":
    month = safe_argv_get(1, default=1)
    month_offset = safe_argv_get(2)

    day = safe_argv_get(3, default=1)
    day_offset = safe_argv_get(4)


    pattern = r".+-0[{0}-{1}]-0[{2}-{3}].txt" \
        .format(month, month + month_offset, day, day + day_offset)
    files = find_log_files(pattern)

    print(files)

    pattern2 = r".+ = (\d+);$"
    search_in_log_files(files, pattern2)

