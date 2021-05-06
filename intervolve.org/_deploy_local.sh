#!/bin/bash

./_build.sh
cd _site/
python3 -m http.server 8000
#test commit comment git cli token auth
