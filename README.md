# bash-unsafe-templates (but.sh)
A rather unsafe, very trusting templating parser for bash

Based on [http://serverfault.com/questions/287688/templating-with-linux-in-a-shell-script/#699377](http://serverfault.com/questions/287688/templating-with-linux-in-a-shell-script/#699377)

## Prerequisites
`but.sh` requires only `bash` and `gnu-coreutils` (for `basename` and `cat`)

## Downloading
    wget https://raw.github.com/nealian/bash-unsafe-templates/master/but.sh && chmod +x but.sh

## Environment
The current shell environment is used, and additional variables may be set in two ways:
* As with any other script, you may specify variable values on the command line (`FOO=bar ./but.sh`)
* Additionally, environment files may be sourced with the `-c` and `--config` flags (and any filenames at the end of the arguments)

## Templates
Templates are text files with bash expansions, and with escaped double-quotes and backslashes.
`but.sh` will expand the following:
* `$VAR` and `${VAR}` (and `${ARRAY[@]}` and other more complicated variable expansions)
* `$(())` arithmetic expansions
* Backtick (``` `` ```) and paren-style (`$()`) command substitions

As mentioned above, templates must have any double-quotes and backslashes escaped (a la `\"` and `\\`).

## Example
This repository includes an example template and its output

## Usage
`but.sh <template-file> [-o|--output <output-file>] [[[-c|--config] <config-file>] ...]`
