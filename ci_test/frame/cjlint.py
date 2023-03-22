import os
import subprocess
from subprocess import PIPE

from .run import clear, HOME_DIR, log_output, LOG


def cjlint_run(out_type='json'):
    clear()
    parent_dir = os.path.dirname(os.path.dirname(HOME_DIR))
    if os.path.exists("{}/report.{}".format(parent_dir, out_type)):
        os.remove("{}/report.{}".format(parent_dir, out_type))
        LOG.info("删除旧文件....")
    if 'grpc' in str(parent_dir):
        cmd = "cjlint -f {}/src -r {} -o {}/report".format(parent_dir, out_type, parent_dir)
        output = subprocess.Popen(cmd, shell=True, cwd=os.path.dirname(parent_dir), stderr=PIPE, stdout=PIPE)
        log_output(output, output.args, parent_dir)
        if not os.path.exists("{}/report.{}".format(parent_dir, out_type)):
            LOG.info("check fail.")
            exit(1)
        LOG.info("check success.")
    else:
        cmd = "cjlint -f ./src -r {} -o ./report".format(out_type)
        output = subprocess.Popen(cmd, shell=True, cwd=parent_dir, stderr=PIPE, stdout=PIPE)
        log_output(output, output.args, parent_dir)
        if not os.path.exists("{}/report.{}".format(parent_dir, out_type)):
            LOG.info("check fail.")
            exit(1)
        LOG.info("check success.")
