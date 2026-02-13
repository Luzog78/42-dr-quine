#    Grace.c    By: luzog78 <luzog78@gmail.com>                   42.fr        #

SOURCE = """#    Grace.c    By: luzog78 <luzog78@gmail.com>                   42.fr        #

SOURCE = {q}{s}{q}

def WRITE(string, *args, **kwargs):
	with open('Grace_kid.py', 'w') as f:
		f.write(string.format(*args, **kwargs))

FT = lambda x: WRITE(SOURCE, s=SOURCE, q='"' * 3)

FT(0)
"""

def WRITE(string, *args, **kwargs):
	with open('Grace_kid.py', 'w') as f:
		f.write(string.format(*args, **kwargs))

FT = lambda x: WRITE(SOURCE, s=SOURCE, q='"' * 3)

FT(0)
