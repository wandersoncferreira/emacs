#!/usr/bin/env bash

kill $(ps aux | grep emacs | grep daemon | awk '{ print $2 }')
