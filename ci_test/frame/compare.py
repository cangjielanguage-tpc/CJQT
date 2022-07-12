from .config import filter_line


def pareFile(path):
    file = open(file=path, mode="r", encoding="utf-8")
    lines = file.readlines()
    dicts = {
        "EXEC": [],
        "DEPENDENCE": []
    }
    for item in lines:
        exec = filter_line(item, "// EXEC")
        dep = filter_line(item, "// DEPENDENCE")
        if exec:
            dicts.get("EXEC").append(exec)
        if dep:
            for item2 in dep.split(" "):
                if item2.strip():
                    dicts.get("DEPENDENCE").append(item2)
    else:
        file.close()
        return dicts