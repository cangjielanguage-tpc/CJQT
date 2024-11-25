import argparse
import os.path
import configparser
import locale
import os
import platform
import sys
from pathlib import Path


BASE_DIR = Path(__file__).parent.absolute()

SRC_DIR = os.path.join(BASE_DIR, "../../")

PROJECT_ROOT = os.path.join(BASE_DIR, "../../test")

TEST_ROOT = os.path.join(PROJECT_ROOT, "LLT")

ENCODING = locale.getpreferredencoding(False)

OS_SEP = os.path.sep
OS = platform.system()


def conf_other_build_file():
    cfg = read_config(complete_path(SRC_DIR+"gitee_gate.cfg"))
    if cfg:
        # return get_config_value(cfg, "other_build", "shell", default=None)
        try:
            list_entry = cfg["other_build"]
            for item in list_entry:
                if item == "shell" and list_entry[item]:
                    return list_entry[item]
                else:
                    return None
        except KeyError:
            return None
    else:
        return None


def conf_UT_test():
    cfg = read_config(complete_path(SRC_DIR+"gitee_gate.cfg"))
    if cfg:
        return get_config_value(cfg, "unittest", "ut", default="true")
    else:
        return "true"


def conf_coverage_LLT():
    cfg = read_config(complete_path(SRC_DIR+"gitee_gate.cfg"))
    if cfg:
        return get_config_value(cfg, "coverage", "LLT", default="false")
    else:
        return "false"


def conf_coverage_UT():
    cfg = read_config(complete_path(SRC_DIR+"gitee_gate.cfg"))
    if cfg:
        return get_config_value(cfg, "coverage", "UT", default="false")
    else:
        return "false"


def conf_library_depends_dynamic():
    cfg = read_config(complete_path(SRC_DIR+"gitee_gate.cfg"))
    if cfg:
        return get_config_value(cfg, "external_library", "dynamic", default=None)
    else:
        return None


def parse_args():
    parser = argparse.ArgumentParser(description="test script")
    parser.add_argument("type", help="build | test | ut | cjlint")
    parser.add_argument(
        "--cfg",
        metavar="<CFG_FILE>",
        type=complete_path,
        default=os.path.join(TEST_ROOT, "test.cfg"),
        help="cfg",
    )

    parser.add_argument(
        "--test_list",
        metavar="<TEST_LIST_FILE>",
        type=complete_path,
        default=None,
        help="Testlist path for filtering test cases",
    )

    parser.add_argument(
        "-f", "--file",
        metavar="<FILE>",
        type=complete_path,
        default=None,
        help="Single file test",
    )

    args = parser.parse_args()

    run_config = {
        "cfg": args.cfg,
        "test_list": args.test_list,
        "file": args.file,
        "type": args.type,
    }

    return run_config


def do_library_path():
    """read config value from test config"""
    path = Path(complete_path(SRC_DIR + "gitee_gate.cfg"))
    if not path or not path.exists() or not path.is_file():
        return None
    config = read_config(path)
    section = "cangjie_library"
    try:
        return config[section]
    except KeyError:
        return ""


def do_library_branch():
    """read config value from test config"""
    path = Path(complete_path(SRC_DIR + "gitee_gate.cfg"))
    if not path or not path.exists() or not path.is_file():
        return None
    config = read_config(path)
    section = "cangjie_library_branch"
    try:
        return config[section]
    except KeyError:
        return ""


def parser_maple_test_config_file():
    cfg = read_config(complete_path(BASE_DIR / "maple_test.cfg"))
    test_home = complete_path(BASE_DIR / get_config_value(cfg, "test-home", "dir", default="../../test"))
    temp_dir = complete_path(BASE_DIR / get_config_value(cfg, "running", "temp_dir", default="../test_temp/run"))
    log_dir = complete_path(BASE_DIR /get_config_value(cfg, "logging", "name", default="../test_temp/log"))
    level = get_config_value(cfg, "logging", "level", default="INFO")
    return {
        "test_home": test_home,
        "temp_dir": temp_dir,
        "log_dir": log_dir,
        "level": level,
    }
    
    
def parser_run_config_file(run_config: Path):
    if not run_config or not run_config.exists() or not run_config.is_file():
        return None
    cfg = read_config(run_config)
    return {"shell": dict(cfg.items("shell")), "suffix": dict(cfg.items("suffix")),
            "internal_var": dict(cfg.items("internal_var"))}


if OS == 'Windows' and ' ' in sys.executable:
    EXECUTABLE = '"' + sys.executable + '"'
else:
    EXECUTABLE = sys.executable
COMPARE = BASE_DIR / "compare.py"


def complete_path(path):
    """returns the canonical path of a path"""
    path = Path(path)
    if not path.exists():
        return Path(os.path.realpath(str(path)))
    return path.expanduser().resolve()


def split_and_complete_path(paths):
    """ Split the paths and returns the canonical path of each path"""
    canonicalPaths = []
    for path in paths.split(","):
        canonicalPaths.append(complete_path(path))
    return canonicalPaths


def read_config(file_path):
    if not file_path.exists() or not file_path.is_file():
        return None
    config = configparser.ConfigParser()
    config.optionxform = str
    config.read(str(file_path), encoding="utf-8")
    return config


def get_config_value(config, section, option, default=None):
    """read config value from test config"""
    try:
        return config[section][option]
    except KeyError:
        return default




def form_line(line, obj):
    for key, value in obj.items():
        end =0
        while end < len(line):
            start = line.find("%{}".format(key), end)
            if start == -1:
                break
            end = len(key) + start +1
            if end == len(line):
                line = line[:start] + value + line[end:]
            elif not line[end].isalnum() and line[end] != "_":
                line = line[:start] + value + line[end:]
            end = len(value) + start + 1
    return line


def filter_line(line, flag=None):
    """return the line starting with the flag"""
    if flag is None:
        return line
    line_flag = line.strip().split(":")[0].strip()
    if line_flag == flag:
        new_line = line.strip()[len(flag) + 1:].strip().lstrip(":").strip()
        return new_line
    return None


