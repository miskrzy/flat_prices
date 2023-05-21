import os
import logging

from dotenv import load_dotenv

logging.getLogger().setLevel(logging.INFO)


def main(event, context):
    load_dotenv()
    logging.info("lambda fired")
    print("lambda fired print")
    return "{} from Lambda!".format(os.environ['greeting'])
