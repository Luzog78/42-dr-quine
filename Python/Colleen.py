# **************************************************************************** #
#                                                         :::      ::::::::    #
#   Colleen.py                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#   By: luzog78 <luzog78@gmail.com>                 +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#   Created: 2026/02/13 19:48:27 by luzog78            #+#    #+#              #
#                                                     ###   ########.fr        #
# **************************************************************************** #

def get_source():
	return """# **************************************************************************** #
#                                                         :::      ::::::::    #
#   Colleen.py                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#   By: luzog78 <luzog78@gmail.com>                 +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#   Created: 2026/02/13 19:48:27 by luzog78            #+#    #+#              #
#                                                     ###   ########.fr        #
# **************************************************************************** #

def get_source():
	return {q}{s}{q}

def main():
	# First quine program!
	source = get_source()
	print(source.format(s=source, q='"' * 3), end='')

if __name__ == '__main__':
	main()
"""

def main():
	# First quine program!
	source = get_source()
	print(source.format(s=source, q='"' * 3), end='')

if __name__ == '__main__':
	main()
