# bash-unsafe-templates (but.sh)
A rather unsafe, very trusting templating parser for bash

`but.sh` takes a template file, consisting of plaintext and expansions-to-parse, expands the embedded bash expansions (a la here-doc), and outputs the result to the command line or to a file, depending on its invocation.

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

### Literal character escapes (backslash-escapes):
#### Outside of expansions:
* `` ` `` may be printed in the output with `` \` ``
* `$` may be printed in the output with `\$`
* `"` may be printed in the output with `\"`
* `\` may be printed in the output unescaped in most cases
 * If it is to be followed immediately by a `` ` ``, a `$`, a `"`, a newline, or another `\`, it must be escaped with `\\`
* All other characters will be printed normally

These follow the rules of a bash [here-document](https://www.gnu.org/software/bash/manual/bashref.html#Here-Documents)

#### Inside expansions:
* See the [bash manual](https://www.gnu.org/software/bash/manual/bashref.html)

## Example
This repository includes an example template and its output.  Additionally, [this gist](https://gist.github.com/nealian/b3e40c8a7326ebea389e5fb97b3eeea3) includes the template I actually initially built this for.

## Usage
`but.sh <template-file> [-o|--output <output-file>] [[[-c|--config] <config-file>] ...]`
