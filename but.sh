#!/bin/bash

# Based on http://serverfault.com/questions/287688/templating-with-linux-in-a-shell-script

PROG=$(basename $0)

usage()
{
    echo "${PROG} <template-file> [-o|--output <output-file>] [[[-c|--config] <config-file>] ...]"
}

expand()
{
    local template="$(cat $1)"
    eval "echo \"${template}\""
}

[[ $# -eq 0 ]] && usage && exit 1;

BUT_template_file=$1
BUT_output_file=""
BUT_config_files=""
shift

while [[ $# -gt 0 ]]; do
    case "$1" in
    -o=*|--output=*)
        BUT_output_file="${1#*=}"
    ;;
    -o|--output)
        BUT_output_file="$2"
        shift
    ;;
    -c=*|--config=*)
        BUT_config_files+=" ${1#*=}"
    ;;
    -c|--config)
        BUT_config_files+=" $2"
        shift
    ;;
    *)
        BUT_config_files+=" $1"
    ;;
    esac
    shift
done

for BUT_conf_file in $BUT_config_files; do
    source $BUT_conf_file
done

if [[ -n "$BUT_output_file" ]]; then
    expand $BUT_template_file > $BUT_output_file
else
    expand $BUT_template_file
fi
