#!/bin/bash

./_build.sh
cd _site/
python3 -m http.server 8000
