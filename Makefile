.PHONY: build build-trace check clean cleanc

build:
	python setup.py build_ext --inplace
	cleanc

build-trace:
	python setup.py build_ext --force --inplace --define CYTHON_TRACE
	cleanc

check:
	pre-commit run --all-files

cleanc:
	rm -f src/in_n_out/*.c

clean:
	rm -rf `find . -name __pycache__`
	rm -f `find . -type f -name '*.py[co]' `
	rm -f `find . -type f -name '*~' `
	rm -f `find . -type f -name '.*~' `
	rm -rf .cache
	rm -rf .pytest_cache
	rm -rf htmlcov
	rm -rf *.egg-info
	rm -f .coverage
	rm -f .coverage.*
	rm -rf build
	rm -rf dist
	rm -f `find src/in_n_out -type f -name '*.c' `
	rm -f `find src/in_n_out -type f -name '*.so' `
	rm -rf coverage.xml
