import logging
import locale
import os
import platform
import re
import shutil
import subprocess
import sys
import time
import json
from logging.handlers import TimedRotatingFileHandler
from pathlib import Path
from subprocess import PIPE
from .compare import pareFile
from .config import parser_maple_test_config_file, form_line, do_library_path, do_library_branch, conf_library_depends_dynamic
# sys.stdout.reconfigure(encoding='utf-8')

ENCODING = locale.getpreferredencoding(False)
HOME_DIR = os.path.dirname(os.path.abspath(__file__))

LIB_DIR = os.path.dirname(os.path.abspath(__file__))
LIBS = []
LIBS_STR = ""

error_set = set()
TEMP = parser_maple_test_config_file()


def log_output(output, cmd, filename=None):
    """ log command output"""
    LOG.info("CMD    : %s", str(cmd))
    LOG.info("FILE   : %s", str(filename))
    stdout, stderr = output.communicate()
    encode = "utf-8" if platform.system() == 'Linux' else 'gbk'
    error = stderr.decode(encode, "ignore").strip()
    out = stdout.decode(encode, "ignore").strip()

    if error:
        error = re.split("\r?\n", error)
        for item in error:
            LOG.info("Stderr : {}".format(item))
    if out:
        out = re.split("\r?\n", out)
        for item in out:
            LOG.info("Stdout : {}".format(item))
    return stdout, stderr


def init_log(name):
    """init log config"""
    log_path = TEMP.get("log_dir")
    create_file(log_path)
    log = logging.getLogger(name)
    log.setLevel(logging.DEBUG)
    formatter = logging.Formatter("[%(asctime)s] %(levelname)s - %(message)s", "%m-%d %H:%M:%S")
    # sys.stdout.reconfigure(encoding='utf-8')
    streamhandler = logging.StreamHandler(sys.stdout)
    streamhandler.setLevel(logging.DEBUG)
    streamhandler.setFormatter(formatter)
    log.addHandler(streamhandler)
    filehandler = TimedRotatingFileHandler(
        os.path.join(log_path, "ci_test.log"), when="W6", interval=1, backupCount=60
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
        subcmd = " --coverage"
    parent_dir = os.path.dirname(os.path.dirname(HOME_DIR))
    lib_dir = os.path.join(parent_dir, "build")
    if os.path.exists(lib_dir):
        parent_dir = os.path.dirname(os.path.dirname(HOME_DIR))
        lib_dir = os.path.join(parent_dir, "build")
        global LIB_DIR
        for sub_lib_dir in os.listdir(lib_dir):
            if sub_lib_dir != "bin":
                LIB_DIR = os.path.join(lib_dir, str(sub_lib_dir))
                improt_libs(LIB_DIR)
                if os.path.exists(lib_dir):
                    env_setup(LIB_DIR)
                else:
                    raise AttributeError("not found ci_lib directory.")
    third_path_libs = do_library_path()
    ci_lib_arr = []
    if third_path_libs:
        for path_lib in third_path_libs:
            ci_lib_path = os.path.join(parent_dir, "ci_lib")
            third_path_lib = os.path.join(str(ci_lib_path), path_lib)
            if os.path.exists(third_path_lib):
                # set ci_lib lib
                improt_libs(third_path_lib)
                env_setup(third_path_lib)
                ci_lib_arr.append(third_path_lib)

    depends_dynamic = conf_library_depends_dynamic()
    depends_dynamic_dir = os.path.join(parent_dir, depends_dynamic)
    if os.path.exists(depends_dynamic_dir):
                # set depends_dynamic lib
                improt_libs(depends_dynamic_dir)
                env_setup(depends_dynamic_dir)
                ci_lib_arr.append(depends_dynamic_dir)

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
                    copy_path = os.path.join(path.parent, item)
                    if os.path.isdir(copy_path):
                        shutil.copytree(copy_path, os.path.join(runPath, item))
                        shutil.copymode(copy_path, os.path.join(runPath, item))
                    else:
                        shutil.copyfile(copy_path, os.path.join(runPath, item))
                        shutil.copymode(copy_path, os.path.join(runPath, item))
                finally:
                    pass
            else:
                subprocess.Popen("cp ./*.cjo ./*.o {}/".format(runPath),
                                 shell=True, cwd=parent_dir, stderr=subprocess.PIPE, stdout=subprocess.PIPE)
                case_one_return_code = 0
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
                    cmd = form_line(cmd, {"project-path": "--import-path {}".format(parent_dir)})
                    cmd = form_line(cmd, {"project-L": "-L {}".format(parent_dir)})
                    cmd = form_line(cmd, {"project": "{}".format(parent_dir)})
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
                    if output.returncode != 0:
                        case_one_return_code = output.returncode
                else:
                    LOG.info("return : %s", str(output.returncode))
                    LOG.info(" >>=============================================<< ")
                    LOG.info("")
                    if case_one_return_code != 0:
                        RESULT.get("FAIL").append(str(path))
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
                        if file.endswith(".cj"):
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
            # print(CJC_TOOLS)
            cmd1 = "{0} {1} --test".format(CJC_TOOLS, SRC_FILES)
            # print(cmd1)
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


LOG: logging.Logger = init_log("root")
CJC_TOOLS: str = get_cj_toolchain()


# 加载三方库
def loding_library():
    py_exe = sys.executable
    ci_lib_const = "temp_ci_lib"
    parent_dir = os.path.dirname(os.path.dirname(HOME_DIR))
    ci_lib_dir = os.path.join(parent_dir, ci_lib_const)
    if os.path.exists(ci_lib_dir):
        LOG.info(">>> 清理ci_lib中缓存文件...")
        try :
            shutil.rmtree(ci_lib_const)
        except:
            LOG.warn(">>> ci_lib文件夹为空...")
    else:
        os.mkdir(ci_lib_dir)
        LOG.info(">>> 创建ci_lib中缓存文件...")

    load_c_library(parent_dir, ci_lib_dir, ci_lib_const)
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
        cmd = "git clone {} ./{}".format(str(my_librarys[lib]), lib)
        output = subprocess.Popen(cmd, shell=True, cwd=parent_dir, stderr=subprocess.PIPE, stdout=subprocess.PIPE)
        log_output(output, output.args, parent_dir)
        LOG.info("clone {} successs".format(lib))
        # 拉取tag
        cmd = "git checkout {}".format(str(my_branchs[lib]))
        output = subprocess.Popen(cmd, shell=True, cwd=os.path.join(parent_dir, lib), stderr=subprocess.PIPE, stdout=subprocess.PIPE)
        log_output(output, output.args, parent_dir)
        LOG.info("checkout tag {} successs".format(lib))
        # // TODO
        try:
            shutil.copytree(os.path.join(parent_dir, "ci_test"), os.path.join(os.path.join(parent_dir, lib), "ci_test"))
        except:
            shutil.rmtree(os.path.join(os.path.join(parent_dir, lib), "ci_test"))
            shutil.copytree(os.path.join(parent_dir, "ci_test"), os.path.join(os.path.join(parent_dir, lib), "ci_test"))
        output = subprocess.Popen(
            "{} {} download".format(py_exe, os.path.join(parent_dir, lib, "ci_test", "main.py")), shell=True, cwd=parent_dir, stderr=PIPE, stdout=PIPE
        )
        out, err = log_output(output, output.args, parent_dir)
        if err:
            exit(1)
    return get_library_cmd(parent_dir, ci_lib_dir, ci_lib_const)


    # 加载so/dll
def load_c_library(parent_dir, ci_lib_dir, ci_lib_const):
    LOG.info('parent_dir:{}'.format(parent_dir))
    LOG.info('ci_lib_dir:{}'.format(ci_lib_dir))
    LOG.info('modulejson:{}'.format(os.path.join(parent_dir, "module.json")))
    file = open(os.path.join(parent_dir, "module.json"))
    mainlib = json.load(file)['name']
    file.close()
    # foreignlib = '{}/lib_{}'.format(ci_lib_const,mainlib)
    foreignlib = os.path.join(ci_lib_const, "lib_{}".format(mainlib))
    OS = 'linux_x86_64' if platform.system() == 'Linux' else 'windows'
    if not os.path.exists(foreignlib):
        output = subprocess.Popen(
            "git clone -b lib_{} https://gitee.com/HW-PLLab/ci_lib.git {} --depth 1".format(mainlib, "{}/lib_{}".format(ci_lib_const, mainlib)),
            shell=True,
            cwd=parent_dir,
            stderr=subprocess.PIPE,
            stdout=subprocess.PIPE,
        )
        # if
        out, err = log_output(output, output.args, parent_dir)
        if "not find remote branch" in str(err):
            return
    if os.path.exists(os.path.join(parent_dir, "lib")):
        try:
            shutil.rmtree(os.path.join(parent_dir, "lib"))
        except:
            LOG.warn(">>> lib文件夹为空...")
    else:
        os.mkdir(os.path.join(parent_dir, "lib"))

    todo = " ; cp -r lib/protobuf ." if mainlib == "grpc" else ""
    aaa = os.path.join(parent_dir, foreignlib, OS, "lib", "lib_{}".format(mainlib))
    bbb = os.path.join(parent_dir, "lib")
    try:
        shutil.copytree(aaa, bbb)
    except:
        try:
            shutil.rmtree(bbb)
            shutil.copytree(aaa, bbb)
        except:
            return
    if not todo == "":
        try:
            shutil.copytree(os.path.join(parent_dir, "lib", "protobuf"), os.path.join(parent_dir,"protobuf"))
        except:
            shutil.rmtree(os.path.join(parent_dir,"protobuf"))
            shutil.copytree(os.path.join(parent_dir, "lib", "protobuf"), os.path.join(parent_dir,"protobuf"))
    LOG.info("load foreign lib for {}".format(mainlib))


def get_library_cmd(parent_dir, ci_lib_dir, ci_lib_const):
    my_libs_cmd = ""
    my_lib_dir = os.path.join(parent_dir, ci_lib_const)
    dynamic_lib = ".dll" if platform.system() == "Windows" else ".so"
    static_lib = ".lib" if platform.system() == "Windows" else ".a"
    if os.path.exists(ci_lib_dir):
        for sub_lib_dir in os.listdir(ci_lib_dir):
            global LIB_DIR
            LIB_DIR = os.path.join(ci_lib_dir, str(sub_lib_dir))
            my_libs = []
            for lib in os.listdir(LIB_DIR):
                if lib.startswith("lib") and lib.endswith(dynamic_lib):
                    aa = lib[3:len(lib) - 3]
                    my_libs.append(aa)
                elif lib.startswith("lib") and lib.endswith(static_lib):
                    aa = lib[3:len(lib) - 2]
                    my_libs.append(aa)
            for ss in my_libs:
                my_libs_cmd = my_libs_cmd + "-l {} ".format(ss)
            # print(LIB_DIR)
            # if os.path.exists(ci_lib_dir):
            #     env_setup(LIB_DIR)
            # else:
            #     raise AttributeError("not found ci_lib directory.")
            # print(os.environ['LIBRARY_PATH'])

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


def runForeignConfig():
    parent_dir = os.path.dirname(os.path.dirname(HOME_DIR))
    build_dir = os.path.join(parent_dir, "build")
    for path, dirs, files in os.walk(build_dir):
        for dd in dirs:
            if dd != "bin":
                for _, _, lib_files in os.walk(os.path.join(parent_dir, dd, "lib")):
                    for lib_file in lib_files:
                        shutil.copyfile(os.path.join(parent_dir, dd, "lib", lib_file), os.path.join(build_dir, dd, lib_file))


def end_build():
    LOG.info(f"")
    for item in RESULT.get("FAIL"):
        LOG.info(f"CASE: {item}, Result: FAIL")
    a = len(RESULT.get("FAIL"))
    b = len(RESULT.get("PASS"))
    LOG.info("")
    LOG.info("  TestSuiteTask: Total: {}, PASS: {}, FAIL: {}, Ratio  : {}%".format(str(a + b), str(b), str(a), round(b / (a + b) * 100, 2) if (a + b) > 0 else 0))
    if a:
        exit(1)


def clear():
    LOG.info("start clear")
    output = subprocess.Popen(f"rm -rf {TEMP.get('temp_dir')}", shell=True)
    output.communicate()
    output = subprocess.Popen(f"rm -rf {TEMP.get('log_dir')}", shell=True)
    output.communicate()
    LOG.info("end clear")
