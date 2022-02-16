#!/usr/bin/env python

import sys
from datetime import datetime

for row in sys.stdin:
    ts = int(row.strip())
    utc_dt = datetime.utcfromtimestamp(ts)
    print(utc_dt)
    sys.stdout.flush()

