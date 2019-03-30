from setuptools import find_packages, setup

setup(
    name="MyProject",
    version="0.1",
    packages=find_packages(exclude=['tests']),
    setup_requires=['setuptools'],
    install_requires=[
        "MySQL-python"
    ],
)
"""
https://ryaneirwin.com/2015/05/30/python-developer-practices/

Next, three files need to be added at the top level of the repo: setup.py, requirements.txt, and requirements-dev.txt.  These files specify metadata about your repo/project and what dependencies you need. The format of setup.py is shown below. Other arguments including description, author, author_email, and url can also be included.
"""
