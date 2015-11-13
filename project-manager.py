# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    docker-manager.py                                  :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vmonteco <vmonteco@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/11/08 18:08:10 by vmonteco          #+#    #+#              #
#    Updated: 2015/11/13 17:43:30 by vmonteco         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# imports

# arguments parser :
import argparse

# Top-level parser :
parser = argparse.ArgumentParser(description="Project manager.")

# Subparsers
subparsers = parser.add_subparsers(help="Subcommand help")

# Parser for project conf rendering.
render_parser = subparsers.add_parser('render', help = 'Rendering the project configuration from template files.')
render_parser.add_argument('-v')

# Parser for dev running.
render_parser = subparsers.add_parser('run', help = 'Running the project in its dev version.')
render_parser.add_argument('-v')

# Parser for docker container building.
render_parser = subparsers.add_parser('run', help = 'Building the docker image.')
render_parser.add_argument('-v')

# Parser for docker running.
render_parser = subparsers.add_parser('run', help = 'Running the docker container.')
render_parser.add_argument('-v')


# Parse arguments
parser.parse_args()

# Settings

# Parser

# functions
