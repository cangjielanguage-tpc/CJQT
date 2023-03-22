import os
import re
import platform
import shutil
import subprocess
from subprocess import PIPE
from .run import LOG, HOME_DIR, runForeignConfig

SRC_FILES = ""
OTHER_BUILD_DICT = {".sh": "bash", ".java": "java", ".py": "python3", ".go": "go"}


def log_output(output, cmd, filename=None):
    """ log command output"""
    LOG.info("CMD    : %s", str(cmd))
    LOG.info("FILE   : %s", str(filename))
    stdout, stderr = output.communicate()
    error = stderr.decode("utf-8", "ignore").strip()
    out = stdout.decode("utf-8", "ignore").strip()

    if error:
        error = re.split("\r?\n", error)
        for item in error:
            LOG.info(f"Stderr : {item}")
    if out:
        out = re.split("\r?\n", out)
        for item in out:
            LOG.info(f"Stdout : {item}")
    return stdout, stderr


def build_clear():
    LOG.info("clear build cache directory, doing.")
    output = subprocess.Popen(f"rm -rf build", shell=True)
    output.communicate()
    output = subprocess.Popen(f"rm -rf ci_lib", shell=True)
    output.communicate()
    LOG.info("clear build cache directory, done.")


def build_other_file(build_file):
    LOG.info("Custom build method starting....")
    parent_dir = os.path.dirname(os.path.dirname(HOME_DIR))
    build_file_path = os.path.join(parent_dir, build_file)
    if os.path.exists(build_file_path):
        bash = shutil.which("bash")
        cmd = "{} {}".format(bash, build_file_path)
        output = subprocess.Popen(cmd, shell=True, cwd=parent_dir, stderr=PIPE, stdout=PIPE)
        out, err = log_output(output, output.args, parent_dir)
        if b"cpm build success" in out:
            LOG.info("other build success!!")
        else:
            LOG.error("other build error..")
            exit(1)
    else:
        LOG.error("No Other Build File Found")
        exit(1)


# 删除后缀名文件
def delete_suffix_file(filepath, suffix_name):
    for file in os.listdir(filepath):
        if '.' in file and file.split('.')[-1] == suffix_name:
            os.remove(os.path.join(filepath, file))


def runBuild(coverage, libs_cmd):
    subcmd = ""
    cpm_sub_cmd = ""
    parent_dir = os.path.dirname(os.path.dirname(HOME_DIR))
    if coverage == "true":
        subcmd = " --coverage -overflow no"
        cpm_sub_cmd = " --coverage"
        delete_suffix_file(parent_dir, 'gcda')
        delete_suffix_file(parent_dir, 'gcno')
    LOG.info("start build.....")
    root_dir = os.path.join(parent_dir, "src")
    if os.path.exists(os.path.join(parent_dir, "module.json")):
        LOG.info("Building with CPM.....")
        cpmbuild(cpm_sub_cmd)
        ## 复制 lib 到 build里
        copy_lib_to_build()
    else:
        LOG.info("Please use cpm to build. cjc compilation is not supported now....")
        # loop_dir(root_dir, lambda file: src_files(file))
        # cmd1 = "{0} {1} -o lib.o -c".format(CJC_TOOLS, SRC_FILES)
        # cmd1 = cmd1 + libs_cmd + subcmd
        # output = subprocess.Popen(cmd1, shell=True, cwd=parent_dir, stderr=subprocess.PIPE,
        #                           stdout=subprocess.PIPE)
        # out, err = log_output(output, output.args, parent_dir)
        # if err and ("error" in str(err) or "Error" in str(err)):
        #     LOG.error("cjc build error..")
        #     exit(1)
        # LOG.info("cjc build success!!")


def copy_lib_to_build():
    runForeignConfig()
    parent_dir = os.path.dirname(os.path.dirname(HOME_DIR))
    depends = os.path.join(parent_dir, "lib")
    dynamic_lib = ".dll" if platform.system() == "Windows" else ".so"
    static_lib = ".lib" if platform.system() == "Windows" else ".a"
    tag_dir = "build"
    for path, dirs, files in os.walk(os.path.join(parent_dir, "build")):
        for d in dirs:
            if d != "bin":
                tag_dir = str(d)

    for path, dirs, files in os.walk(depends):
        if path == depends:
            for ff in files:
                if dynamic_lib in ff or static_lib in ff:
                    LOG.info("copy {} -> {}".format(os.path.join(path, ff), os.path.join(parent_dir, "build", tag_dir, ff)))
                    shutil.copyfile(os.path.join(path, ff), os.path.join(parent_dir, "build", tag_dir, ff))
        for dd in dirs:
            if not os.path.exists(os.path.join(parent_dir, "build", dd)):
                shutil.copytree(os.path.join(path, dd), os.path.join(parent_dir, "build", dd))

    if os.path.exists(os.path.join(parent_dir, "ci_lib")):
        shutil.rmtree(os.path.join(parent_dir, "ci_lib"))
    shutil.copytree(os.path.join(parent_dir, "build"), os.path.join(parent_dir, "ci_lib"))


def cpmbuild(subcmd):
    parent_dir = os.path.dirname(os.path.dirname(HOME_DIR))
    for file in os.listdir(parent_dir):
        if file == 'module-resolve.json':
            os.remove(os.path.join(parent_dir, 'module-resolve.json'))
    cmd1 = "cpm build --verbose {}".format(subcmd)
    output = subprocess.Popen(cmd1, shell=True, cwd=parent_dir, stderr=subprocess.PIPE,
                              stdout=subprocess.PIPE)
    out, err = log_output(output, output.args, parent_dir)
    if err and "cpm build failed" in str(err):
        LOG.error("cpm build error..")
        exit(1)
    LOG.info("cpm build success!!")


def src_files(file):
    global SRC_FILES
    SRC_FILES = SRC_FILES + " " + file
