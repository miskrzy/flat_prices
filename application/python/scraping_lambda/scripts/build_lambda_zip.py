import os
import sys
import shutil
import subprocess


if __name__ == '__main__':
    BUILD_DIR_PATH = os.path.join(os.path.dirname(__file__), os.pardir, "build")
    APP_DIR_PATH = os.path.join(os.path.dirname(__file__), os.pardir, "app")
    REQUIREMENTS_PATH = os.path.join(os.path.dirname(__file__), os.pardir, "requirements.txt")
    ZIP_PATH = os.path.join(os.path.dirname(__file__), os.pardir, "scraping_lambda")

    if os.path.exists(BUILD_DIR_PATH):
        shutil.rmtree(BUILD_DIR_PATH)
        print("removed build directory with content")
    else:
        print("no build directory found")

    shutil.copytree(APP_DIR_PATH, BUILD_DIR_PATH)
    print("copied content of app directory to build")

    subprocess.check_call([sys.executable, "-m", "pip", "install", "-r", REQUIREMENTS_PATH, "-t", BUILD_DIR_PATH])
    print("installed requirements to build directory")
