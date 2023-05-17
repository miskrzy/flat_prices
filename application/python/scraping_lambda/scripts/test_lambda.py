import os
import sys

sys.path.insert(0, os.path.join(os.path.dirname(__file__), os.pardir, os.pardir))

from scraping_lambda.app import main

if __name__ == '__main__':
    EVENT = None
    CONTEXT = None
    result = main.main(event=EVENT, context=CONTEXT)
    print(result)
