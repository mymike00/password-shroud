#!/bin/bash

DIR=$(dirname $(readlink -f "$0"))

$DIR/build.sh
$DIR/password-shroud
