#!/bin/python
# This file writes the aliases to the given shell.

import argparse
import os

def toBash(alias: str, cmd: str) -> str:
    return f'alias {alias}={cmd}'


def toZsh(alias: str, cmd: str) -> str:
    return f'alias {alias}={cmd}'

def toFish(alias: str, cmd: str) -> str:
    return f'alias {alias} {cmd}'


def aliasPath(shell: str) -> str:
    return f'~/.dotfiles/config-files/.{shell}_aliases'


def writeAliasFile(shell: str):
    aliases = {
        # Changing ls to exa.
        'ls': 'exa -lah --color=always --group-directories-first --time-style=long-iso',
        'ld': 'exa -laD --color=always --group-directories-first --time-style=long-iso',
        'l.': 'exa -lah | egrep "^\\."',

        # Add color to grep.
        'grep': 'grep --color=always',
        'fgrep': 'fgrep --color=always',
        'egrep': 'egrep --color=always',

        # Minor ripgrep changes.
        'rg': 'rg --hidden',
        'rgf': 'rg --hidden --files | rg',

        # Safety measures to prevent accidental overwriting.
        'cp': 'cp -i',
        'mv': 'mv -i',

        # I use trash-cli, so rm is disabled in my shell.
        'rm': 'echo "Error: rm is not recommended. Please use trash instead."',

        # Quick launch certain applications.
        # Use -p for editing multiple files at once.
        'nv': 'nvim -p',

        # Replace vim with neovim.
        'vim': 'nvim -p',
        # 'fm': '$FILE_MANAGER',
        # 'dmenu_run': 'dmenu_run -fn "JetBrains Mono 10" -c -l 20 -bw 2 -m 0 -g 2',

        # Navigation
        '..': 'cd ..',
        '...': 'cd ../..',
        '.3': 'cd ../../..',
        '.4': 'cd ../../../..',
        '.5': 'cd ../../../../..'
    }
    with open(aliasPath(shell), 'w') as file:
        file.write('# This file was generated using ~/.dotfiles/aliases.py.')
        for alias, cmd in aliases:
            line = ''
            if shell == 'bash':
                line = toBash(alias, cmd)
            elif shell == 'zsh':
                line = toZsh(alias, cmd)
            elif shell == 'fish':
                line = toFish(alias, cmd)
            file.write(line)


def linkFile(shell: str):
    path = aliasPath(shell)
    if shell == 'bash':
        os.system(f'ln -sFi {path} ~/.bash_aliases')
    elif shell == 'zsh':
        os.system(f'ln -sFi {path} ~/.zsh_aliases')
    elif shell == 'fish':
        # Currently not linking to fish.
        # os.system(f'ln -sFi {path}')
        pass


def main():
    validShells = ['bash', 'zsh', 'fish']
    desc = 'Exports aliases to alias file for a shell. Valid shells: bash, zsh, fish.'
    parser = argparse.ArgumentParser(description=desc)
    parser.add_argument(
        '-o',
        '--shell',
        type=str,
        help='Shell to export to. Default: bash.',
        default='bash'
    )
    args = parser.parse_args()
    path = aliasPath(args.shell)
    print(f'Generating aliases in {path}...')
    if args.shell in validShells:
        writeAliasFile(args.shell)
        os.system(f'ln -sFi {path}')
    else:
        print('Please provide a valid shell.')


if __name__ == '__main__':
    pass # not currently working
