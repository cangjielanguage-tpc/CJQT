from .config import parse_args, conf_UT_test, conf_coverage_LLT, conf_library_depends_dynamic, conf_other_build_file
from .run import end_build, clear, unittest, runAll, loding_library, runForeignConfig
from .cjlint import cjlint_run
from .build import runBuild, build_other_file, build_clear


def main():
    handler = parse_args().get("type")
    if handler == "clear":
        clear()
        build_clear()
    elif handler == "build":
        build()
    elif handler == "test":
        test()
    elif handler == "ut":
        ut()
    elif handler == "cjlint":
        cjlint_run()
    elif handler == "download":
        loding_library()
    else:
        print("Your command is not supported.")


def build():
    build_file = conf_other_build_file()
    if build_file:
        build_other_file(build_file)
    else:
        cmd = loding_library()
        runBuild(str(conf_coverage_LLT()), cmd)
        # runForeignConfig(conf_library_depends_dynamic())
        # runForeignConfig()

def test():
    clear()
    runAll(str(conf_coverage_LLT()))
    end_build()
    if str(conf_UT_test()) == "true":
        unittest()


def ut():
    clear()
    unittest()
    end_build()
