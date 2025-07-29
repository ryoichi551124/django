import os

env = os.getenv('ENV', 'dev')

if env == 'prod':
    from .prod import *
else:
    from .dev import *
