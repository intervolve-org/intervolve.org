#!/bin/bash

./_build.sh
cd _site/
python3 -m http.server 8000
#Jekyll has built in serving capabilities with `bundle exec jekyll serve`   But python makes it simple too.  `bundle exec jekyll build` can run in the background. Just remember to force refresh. <shift> + F5 on most browsers.
