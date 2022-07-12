from .config import parse_args,conf_UT_test, conf_coverage_LLT, conf_library_depends_dynamic
from .run import start,  runBuild, end_build, clear, unittest, runAll, loding_library, runForeignConfig

def main():
    parse = parse_args()
    oType = parse.get("type")
    if oType == "clear":
        clear()
    elif oType == "build":
        start()
        cmd = loding_library()
        runBuild(str(conf_coverage_LLT()), cmd)
        runForeignConfig(conf_library_depends_dynamic())
    elif oType == "test":
        clear()
        start()
        runAll(str(conf_coverage_LLT()))
        end_build()
        if str(conf_UT_test()) == "true":
            unittest()
    elif oType == "ut":
        clear()
        start()
        unittest()
        end_build()
