run:
	python scan_and_fix.py

venv:
	pyenv install 3.11.2 --skip-existing
	-pyenv uninstall -f jank_venv
	-pyenv virtualenv 3.11.2 jank_venv
	pyenv local jank_venv
	pip install --upgrade pip
	pip install --upgrade pip-tools

cov:
	pytest --cov=.  --cov-report html:htmlcov && open htmlcov/index.html

lint-fix:
	black .
	isort .

wheel:
	python setup.py sdist bdist_wheel
	twine upload --repository-url https://test.pypi.org/legacy/ dist/*