#!/usr/bin/env bash

cdf()
{
    curFinderDir=`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`
    echo "\033[31m$curFinderDir\033[0m"
    cd $curFinderDir
}
