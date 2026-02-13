# **************************************************************************** #
#                                                         :::      ::::::::    #
#    Sully.c                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: luzog78 <luzog78@gmail.com>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/02/13 19:48:27 by luzog78           #+#    #+#              #
#                                                     ###   ########.fr        #
# **************************************************************************** #

import os
import sys

source = """# **************************************************************************** #
#                                                         :::      ::::::::    #
#    Sully.c                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: luzog78 <luzog78@gmail.com>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/02/13 19:48:27 by luzog78           #+#    #+#              #
#                                                     ###   ########.fr        #
# **************************************************************************** #

import os
import sys

source = {q}{s}{q}
level = {l}

def	main():
	global level

	if level <= 0:
		return 0
	level -= 1

	with open('Sully_%L.py'.replace('%L', str(level)), 'w') as f:
		f.write(source.format(s=source, q='"' * 3, l=level))
	return os.system('%P ./Sully_%L.py'.replace('%L', str(level)).replace('%P', sys.orig_argv[0]))

if __name__ == '__main__':
	sys.exit(main())
"""
level = 5

def	main():
	global level

	if level <= 0:
		return 0
	level -= 1

	with open('Sully_%L.py'.replace('%L', str(level)), 'w') as f:
		f.write(source.format(s=source, q='"' * 3, l=level))
	return os.system('%P ./Sully_%L.py'.replace('%L', str(level)).replace('%P', sys.orig_argv[0]))

if __name__ == '__main__':
	sys.exit(main())
