import logging
import locale
import os
import re
import shutil
import subprocess
import sys
import time
from logging.handlers import TimedRotatingFileHandler
from pathlib import Path
from subprocess import PIPE

from .compare import pareFile
from .config import parser_maple_test_config_file, form_line, do_library_path, do_library_branch

ENCODING = locale.getpreferredencoding(False)
HOME_DIR = os.path.dirname(os.path.abspath(__file__))

LIB_DIR = os.path.dirname(os.path.abspath(__file__))
LIBS = []
LIBS_STR = ""

error_set = set()
TEMP = parser_maple_test_config_file()


def log_output(output, cmd, filename=None):
    """ log command output"""
    LOG.info("CMD ==>> : %s", str(cmd))
    LOG.info("FILE ==>> : %s", str(filename))
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


def init_log(name):
    """init log config"""
    log_path = TEMP.get("log_dir")
    create_file(log_path)
    log = logging.getLogger(name)
    log.setLevel(logging.DEBUG)
    formatter = logging.Formatter("[%(asctime)s:%(module)s:%(lineno)s:%(levelname)s] %(message)s")
    streamhandler = logging.StreamHandler(sys.stdout)
    streamhandler.setLevel(logging.DEBUG)
    streamhandler.setFormatter(formatter)
    log.addHandler(streamhandler)
    filehandler = TimedRotatingFileHandler(
        os.path.join(log_path, "cj-stdx.log"), when="W6", interval=1, backupCount=60
    )
    filehandler.setLevel(logging.DEBUG)
    filehandler.setFormatter(formatter)
    log.addHandler(filehandler)
    return log


def get_cj_toolchain():
    cjc = shutil.which("cjc")
    if not cjc:
        LOG.error("cjc is required to build.")
        sys.exit(1)
    return cjc


def runAll(flag):
    subcmd = ""
    if flag == "true":
        subcmd = " --coverage -overflow no"
    parent_dir = os.path.dirname(os.path.dirname(HOME_DIR))
    lib_dir = os.path.join(parent_dir, "build")
    if os.path.exists(lib_dir):
        parent_dir = os.path.dirname(os.path.dirname(HOME_DIR))
        lib_dir = os.path.join(parent_dir, "build")
        sub_lib_dir = os.listdir(lib_dir)[0]
        global LIB_DIR
        LIB_DIR = os.path.join(lib_dir, str(sub_lib_dir))
        improt_libs(LIB_DIR)
        if os.path.exists(lib_dir):
            env_setup(LIB_DIR)
        else:
            raise AttributeError("not found ci_lib directory.")
    third_path_libs = do_library_path()
    ci_lib_arr = []
    for path_lib in third_path_libs:
        ci_lib_path = os.path.join(parent_dir, "ci_lib")
        third_path_lib = os.path.join(str(ci_lib_path), path_lib)
        if os.path.exists(third_path_lib):
            # set ci_lib lib
            improt_libs(third_path_lib)
            env_setup(third_path_lib)
            ci_lib_arr.append(third_path_lib)
    run_all_lib_dir = LIB_DIR
    loop_dir(TEMP.get("test_home"), lambda file: runOne(file, run_all_lib_dir, subcmd, ci_lib_arr))


def runOne(file, lib_dir, subcmd, ci_lib_arr=None):
    global RESULT
    path = Path(file)
    ci_lib_const = "ci_lib"
    parent_dir = os.path.dirname(os.path.dirname(HOME_DIR))
    ci_lib_dir = os.path.join(parent_dir, ci_lib_const)
    if path.is_file():
        name = (path.name + "_" + str(time.time())).split(".")
        name = "_".join(name)
        runPath = os.path.join(TEMP.get("temp_dir"), name)
        lineDict = pareFile(file)
        exec = lineDict.get("EXEC")
        copy = lineDict.get("DEPENDENCE")
        copy.append(path.name)
        if len(exec):
            create_file(runPath)
            for item in copy:
                try:
                    shutil.copyfile(os.path.join(path.parent, item), os.path.join(runPath, item))
                finally:
                    pass
            else:
                subprocess.Popen("cp ./*.cjo ./*.o {}/".format(runPath),
                                 shell=True, cwd=parent_dir, stderr=subprocess.PIPE, stdout=subprocess.PIPE)
                for item in exec:
                    cmd_temp = item
                    import_path_dir = str(lib_dir + "/..")
                    l_path_dir = lib_dir
                    if len(ci_lib_arr) != 0:
                        for ci_lib in ci_lib_arr:
                            import_path_dir = import_path_dir + " --import-path {} ".format(ci_lib + "/..")
                            l_path_dir = l_path_dir + " -L {} ".format(ci_lib)
                    cmd = form_line(item, {"import-path": "--import-path {}".format(import_path_dir)})
                    cmd = form_line(cmd, {"L": "-L {}".format(l_path_dir)})
                    cmd = form_line(cmd, {"l": LIBS_STR})
                    if str(cmd) == str(cmd_temp):
                        sub_lib_cmd = get_library_cmd(parent_dir, ci_lib_dir, ci_lib_const)
                        cmd = form_line(cmd, {"f": path.name + sub_lib_cmd})
                    else:
                        cmd = form_line(cmd, {"f": path.name})
                    if "cjc" in cmd:
                        cmd = cmd + subcmd
                    output = subprocess.Popen(cmd, shell=True, cwd=runPath, stderr=subprocess.PIPE,
                                              stdout=subprocess.PIPE)
                    out, err = log_output(output, output.args, path.name)
                    if err and ("error" in str(err) or "exception" in str(err)):
                        RESULT.get("FAIL").append(str(path))
                        break
                else:
                    RESULT.get("PASS").append(str(path))


def improt_libs(libsdir):
    global LIBS, LIBS_STR
    for lib in os.listdir(libsdir):
        if lib.startswith("lib") and lib.endswith(".so"):
            aa = lib[3:len(lib) - 3]
            LIBS.append(aa)
        elif lib.startswith("lib") and lib.endswith(".a"):
            aa = lib[3:len(lib) - 2]
            LIBS.append(aa)
    for ss in LIBS:
        LIBS_STR = LIBS_STR + "-l {} ".format(ss)


def loop_dir(currentDirectory, callBack):
    for path, dirs, files in os.walk(currentDirectory):
        for item in files:
            if Path(item).suffix == ".cj":
                callBack(os.path.join(path, item))


SRC_FILES = ""


def unittest():
    parent_dir = os.path.dirname(os.path.dirname(HOME_DIR))
    lib_dir = os.path.join(parent_dir, "build")
    ROOT_DIR = os.path.join(os.path.dirname(os.path.dirname(HOME_DIR)), "src")
    # os.removedirs()
    ut_ci_test = os.path.join(parent_dir, "ci_test")
    ut_src_temp = os.path.join(ut_ci_test, "ci_src")
    if os.path.exists(ut_src_temp):
        os.popen("rm -fr {}/*".format(ut_src_temp))
    else:
        os.makedirs(ut_src_temp)
    copy_cmd = "cp -r {}/src/* {}/".format(parent_dir, ut_src_temp)
    os.popen(copy_cmd)
    time.sleep(0.1)
    try:
        if os.path.exists(lib_dir):
            ut_src_dir = "{}/test/UT".format(parent_dir)
            is_first = True
            for path, dirs, files in os.walk(ut_src_dir):
                for ut_dir in dirs:
                    ut_dir_cmd = "cp -r {}/test/UT/{}/* {}/src/{}/".format(parent_dir, ut_dir, parent_dir, ut_dir)
                    output = subprocess.Popen(ut_dir_cmd, shell=True, cwd=ut_src_dir, stderr=subprocess.PIPE,
                                              stdout=subprocess.PIPE)
                    ut_dir_temp = ut_dir
                    if path != ut_src_dir:
                        sub_ut_src_dir = path.split(ut_src_dir+"/")[1]
                        ut_dir_temp = sub_ut_src_dir + "/" + ut_dir
                    ut_test_cmd = "cpm test {}/src/{}".format(parent_dir, ut_dir_temp)
                    # if
                    is_sub_file_cj = False
                    for _, _, sub_files in os.walk("{}/src/{}".format(parent_dir, ut_dir_temp)):
                        for sub_file in sub_files:
                            if sub_file.endswith(".cj"):
                                is_sub_file_cj = True
                        break
                    if is_sub_file_cj:
                        output = subprocess.Popen(ut_test_cmd, shell=True, cwd=parent_dir, stderr=subprocess.PIPE,
                                                  stdout=subprocess.PIPE)
                        out, err = log_output(output, output.args, ROOT_DIR)
                        ut_result(out, err)
                if len(files) > 0 and is_first:
                    is_first = False
                    is_top_file = False
                    for file in files:
                        if os.path.exists(file) and file.endswith(".cj"):
                            is_top_file = True
                            ut_dir_cmd = "cp {}/test/UT/{} {}/src/{}".format(parent_dir, file, parent_dir, file)
                            output = subprocess.Popen(ut_dir_cmd, shell=True, cwd=parent_dir, stderr=subprocess.PIPE,
                                                      stdout=subprocess.PIPE)
                            out, err = log_output(output, output.args, ROOT_DIR)
                    if is_top_file:
                        ut_test_cmd = "cpm test {}/src".format(parent_dir)
                        output = subprocess.Popen(ut_test_cmd, shell=True, cwd=parent_dir, stderr=subprocess.PIPE,
                                                  stdout=subprocess.PIPE)
                        out, err = log_output(output, output.args, ROOT_DIR)
                        ut_result(out, err)
        else:
            cmd = "cp -r {0}/test/UT {1}/src/".format(parent_dir, parent_dir)
            output = subprocess.Popen(cmd, shell=True, cwd=ROOT_DIR, stderr=subprocess.PIPE,
                                      stdout=subprocess.PIPE)
            out, err = log_output(output, output.args, ROOT_DIR)
            if err:
                exit(1)
            loop_dir(ROOT_DIR, lambda file: src_files(file))
            print(CJC_TOOLS)
            cmd1 = "{0} {1} --test".format(CJC_TOOLS, SRC_FILES)
            print(cmd1)
            output = subprocess.Popen(cmd1, shell=True, cwd=ROOT_DIR, stderr=subprocess.PIPE,
                                      stdout=subprocess.PIPE)
            out, err = log_output(output, output.args, ROOT_DIR)
            if err:
                exit(1)
            cmd2 = "{0}/{1}".format(ROOT_DIR, "main")
            output = subprocess.Popen(cmd2, shell=True, cwd=ROOT_DIR, stderr=subprocess.PIPE,
                                      stdout=subprocess.PIPE)
            out, err = log_output(output, output.args, ROOT_DIR)
            ut_result(out, err)
        os.popen("rm -fr {}/src/*".format(parent_dir))
        os.popen("cp -r {}/* {}/src/ ".format(ut_src_temp, parent_dir))
    except:
        os.popen("rm -fr {}/src/*".format(parent_dir))
        os.popen("cp -r {}/* {}/src/ ".format(ut_src_temp, parent_dir))
        LOG.info(">> cpm测试失败，请查看log日志...")
        exit(1)


def ut_result(out, err):
    arr = [-1, -1, -1, -1, -1]
    resu = str(out).split("TOTAL")[1].split("\\n")
    arr[0] = resu[0].split(": ")[1]
    res = resu[1].split(",")
    for item in res:
        if "PASSED" in item:
            arr[1] = item.split(": ")[1]
        elif "SKIPPED" in item:
            arr[2] = item.split(": ")[1]
        elif "ERROR" in item:
            arr[3] = item.split(": ")[1]
    if "FAILED" in resu[2]:
        arr[4] = resu[2].split(": ")[1].split(",")[0]
    if int(arr[3]) > 0 or int(arr[4]) > 0:
        RESULT.get("FAIL").append(str(arr[3]))
        RESULT.get("FAIL").append(str(arr[4]))
        raise Exception()


def src_files(file):
    global SRC_FILES
    SRC_FILES = SRC_FILES + " " + file


def create_file(path):
    if not os.path.exists(path):
        os.makedirs(path)


LOG: logging.Logger
CJC_TOOLS: str = ""


def start():
    global LOG, CJC_TOOLS
    LOG = init_log("root")
    CJC_TOOLS = get_cj_toolchain()


# 加载三方库
def loding_library():
    py_exe = sys.executable
    ci_lib_const = "ci_lib"
    parent_dir = os.path.dirname(os.path.dirname(HOME_DIR))
    ci_lib_dir = os.path.join(parent_dir, ci_lib_const)
    if os.path.exists(ci_lib_dir):
        subprocess.Popen("rm -rf {}/*".format(ci_lib_const), shell=True, cwd=parent_dir, stderr=subprocess.PIPE,
                         stdout=subprocess.PIPE)
        LOG.info(">>> 清理ci_lib中缓存文件...")
    else:
        subprocess.Popen("mkdir {}".format(ci_lib_const), shell=True, cwd=parent_dir, stderr=subprocess.PIPE,
                         stdout=subprocess.PIPE)
        LOG.info(">>> 创建ci_lib中缓存文件...")
    my_librarys = do_library_path()
    if not my_librarys:
        LOG.info(">>> 无其他三方库依赖")
        return ""
    my_branchs = do_library_branch()
    if not my_branchs:
        LOG.info(">>> 三方库依赖没有默认分支...")
        return ""
    LOG.info(">>> 三方库依赖 compiling....")
    for lib in my_librarys:
        LOG.info("clone {} starting".format(lib))
        cmd = "git clone -b {} {} ./{}".format(str(my_branchs[lib]), str(my_librarys[lib]), lib)
        output = subprocess.Popen(cmd, shell=True, cwd=parent_dir, stderr=subprocess.PIPE, stdout=subprocess.PIPE)
        log_output(output, output.args, parent_dir)
        LOG.info("clone {} successs".format(lib))
        output = subprocess.Popen(
            "cp -r ci_test {}".format(lib), shell=True, cwd=parent_dir, stderr=subprocess.PIPE, stdout=subprocess.PIPE
        )
        log_output(output, output.args, parent_dir)
        output = subprocess.Popen(
            "{} ./{}/ci_test/main.py build".format(py_exe, lib), shell=True, cwd=parent_dir, stderr=PIPE, stdout=PIPE
        )
        out, err = log_output(output, output.args, parent_dir)
        if err:
            exit(1)
        output = subprocess.Popen(
            "cp -r ./{}/build/* ./{}".format(lib, ci_lib_const), shell=True, cwd=parent_dir, stderr=subprocess.PIPE,
            stdout=subprocess.PIPE
        )
        out, err = log_output(output, output.args, parent_dir)
        if err:
            exit(1)
    return get_library_cmd(parent_dir, ci_lib_dir, ci_lib_const)


def get_library_cmd(parent_dir, ci_lib_dir, ci_lib_const):
    my_libs_cmd = ""
    my_lib_dir = os.path.join(parent_dir, ci_lib_const)
    for sub_lib_dir in os.listdir(ci_lib_dir):
        global LIB_DIR
        LIB_DIR = os.path.join(ci_lib_dir, str(sub_lib_dir))
        my_libs = []
        for lib in os.listdir(LIB_DIR):
            if lib.startswith("lib") and lib.endswith(".so"):
                aa = lib[3:len(lib) - 3]
                my_libs.append(aa)
            elif lib.startswith("lib") and lib.endswith(".a"):
                aa = lib[3:len(lib) - 2]
                my_libs.append(aa)
        for ss in my_libs:
            my_libs_cmd = my_libs_cmd + "-l {} ".format(ss)
        print(LIB_DIR)
        if os.path.exists(ci_lib_dir):
            env_setup(LIB_DIR)
        else:
            raise AttributeError("not found ci_lib directory.")
        print(os.environ['LIBRARY_PATH'])

    return " --import-path {} -L {} {}".format(my_lib_dir, my_lib_dir, my_libs_cmd)


def env_setup(lib_dir):
    liba = os.getenv('LIBRARY_PATH')
    libb = os.getenv('LD_LIBRARY_PATH')
    if libb and liba:
        os.environ['LIBRARY_PATH'] = "{}:".format(lib_dir) + os.getenv('LIBRARY_PATH')
        os.environ['LD_LIBRARY_PATH'] = "{}:".format(lib_dir) + os.getenv('LD_LIBRARY_PATH')
    elif libb and not liba:
        os.environ['LIBRARY_PATH'] = "{}:".format(lib_dir) + os.getenv('LD_LIBRARY_PATH')
        os.environ['LD_LIBRARY_PATH'] = "{}:".format(lib_dir) + os.getenv('LD_LIBRARY_PATH')
    elif not libb and liba:
        os.environ['LIBRARY_PATH'] = "{}:".format(lib_dir) + os.getenv('LIBRARY_PATH')
        os.environ['LD_LIBRARY_PATH'] = "{}:".format(lib_dir) + os.getenv('LIBRARY_PATH')
    else:
        raise AttributeError("No adaptation of the cangjie environment variable.")


RESULT = {
    "FAIL": [],
    "PASS": []
}


def runForeignConfig(depend):
    if depend is None:
        return
    parent_dir = os.path.dirname(os.path.dirname(HOME_DIR))
    depends = os.path.join(parent_dir, depend)
    depend_dir = Path(depends)
    if not depend_dir.exists():
        return
    for path, dirs, files in os.walk(parent_dir + "/build"):
        cmd = "cp {0}/*.so {1}/build/{2}/".format(depends, parent_dir, str(dirs[0]))
        output = subprocess.Popen(cmd, shell=True, cwd=parent_dir, stderr=subprocess.PIPE,
                                  stdout=subprocess.PIPE)
        log_output(output, output.args, parent_dir)
        break


def runBuild(flag, libs_cmd):
    subcmd = ""
    cpmsubcmd = ""
    if flag == "true":
        subcmd = " --coverage -overflow no"
        cpmsubcmd = " --coverage"
    LOG.info("start build.....")
    global SRC_FILES
    parent_dir = os.path.dirname(os.path.dirname(HOME_DIR))
    ROOT_DIR = os.path.join(parent_dir, "src")
    if os.path.exists(os.path.join(parent_dir, "module.json")):
        LOG.info("Building with CPM.....")
        cpmbuild(cpmsubcmd)
    else:
        LOG.info("Building with cjc.....")
        loop_dir(ROOT_DIR, lambda file: src_files(file))
        cmd1 = "{0} {1} -o lib.o -c".format(CJC_TOOLS, SRC_FILES)
        cmd1 = cmd1 + libs_cmd + subcmd
        output = subprocess.Popen(cmd1, shell=True, cwd=parent_dir, stderr=subprocess.PIPE,
                                  stdout=subprocess.PIPE)
        out, err = log_output(output, output.args, parent_dir)
        if err and "error" in str(err):
            LOG.error("build error")
            exit(1)
        LOG.info("end build")


def cpmbuild(subcmd):
    cmd1 = "cpm build {}".format(subcmd)
    parent_dir = os.path.dirname(os.path.dirname(HOME_DIR))
    output = subprocess.Popen(cmd1, shell=True, cwd=parent_dir, stderr=subprocess.PIPE,
                              stdout=subprocess.PIPE)
    out, err = log_output(output, output.args, parent_dir)
    if err and "error" in str(err):
        LOG.error("build error")
        exit(1)
    LOG.info("end build")


def end_build():
    LOG.info(f"")
    for item in RESULT.get("FAIL"):
        LOG.info(f"CASE: {item}, Result: FAIL")
    a = len(RESULT.get("FAIL"))
    b = len(RESULT.get("PASS"))
    LOG.info(f"")
    LOG.info(f"\tTestSuiteTask: Total: {str(a + b)}, PASS: {str(b)}, FAIL: {str(a)}")
    if a:
        exit(1)


def clear():
    print("start clear")
    output = subprocess.Popen(f"rm -rf {TEMP.get('temp_dir')}", shell=True)
    output.communicate()
    output = subprocess.Popen(f"rm -rf {TEMP.get('log_dir')}", shell=True)
    output.communicate()
    print("end clear")
