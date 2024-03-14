.PHONY: clean
clean:
	find . -name '*.pyo' -delete
	find . -name '*.pyc' -delete
	find . -name __pycache__ -delete
	find . -name '*~' -delete
	find . -name '.coverage.*' -delete

PYTEST_CMD := poetry run pytest -s -vv gridstatusio/ -n auto --reruns 5 --reruns-delay 3

.PHONY: test
test:
	$(PYTEST_CMD)

.PHONY: lint
lint:
	poetry run ruff gridstatusio/
	poetry run black gridstatusio/ --check

.PHONY: lint-fix
lint-fix:
	poetry run ruff gridstatusio/ --fix
	poetry run black gridstatusio/

.PHONY: package
package: upgradepip upgradebuild upgradesetuptools
	poetry build
