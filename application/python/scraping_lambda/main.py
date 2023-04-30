import os


def main(event, context):
    return "{} from Lambda!".format(os.environ['greeting'])