import argparse

def create_help_parser(top_level_subparsers):
    """Help subcommand.
    """
    parser = top_level_subparsers.add_parser("help")
    subparsers = parser.add_subparsers()
    help_subparser = subparsers.add_parser("help")
    return parser

def create_docker_parser(top_level_subparsers):
    """Docker subcommand.
    """
    parser = top_level_subparsers.add_parser("docker")
    subparsers = parser.add_subparsers()
    build_subparser = subparsers.add_parser("build")
    run_subparser = subparsers.add_parser("run")
    return parser

def create_django_parser(top_level_subparsers):
    """Django subcommand.
    """
    parser = top_level_subparsers.add_parser("django")
    subparsers = parser.add_subparsers()
    build_subparser = subparsers.add_parser("compile")
    run_subparser = subparsers.add_parser("check")
    return parser

def create_conf_parser(top_level_subparsers):
    """Conf subcommand.
    """
    parser = top_level_subparsers.add_parser("conf")
    subparsers = parser.add_subparsers()
    build_subparser = subparsers.add_parser("run-dev")
    run_subparser = subparsers.add_parser("start-project")
    return parser

def top_level_parser():
    """Top level parser creation.
    """
    parser = argparse.ArgumentParser(description="Project manager")
    subparsers = parser.add_subparsers()
    docker_parser = create_docker_parser(subparsers)
    django_parser = create_django_parser(subparsers)
    conf_parser = create_conf_parser(subparsers)
    help_parser = create_help_parser(subparsers)
    return parser
