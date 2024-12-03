from setuptools import find_packages, setup

setup(
    name="calculator",
    version="1.0.0",
    packages=find_packages(),
    install_requires=["pandas", "mypy", "black", "flake8", "isort"],
)
