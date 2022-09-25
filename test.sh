#bin/sh

rm *.gcda
rm *.gcno

python3 ci_test/main.py build
python3 ci_test/main.py test
cjcov -o doc/cjcov --html-details