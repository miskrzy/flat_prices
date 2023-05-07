import os
import logging

logging.getLogger().setLevel(logging.INFO)


def main(event, context):
    logging.info("lambda fired")
    print("lambda fired print")
    return "{} from Lambda!".format(os.environ['greeting'])
