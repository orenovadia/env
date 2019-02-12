# env
Working environment setup and customization

## Installation

```
cd ~
git clone https://github.com/orenovadia/env.git
cd env && ./install.sh
```

It runs all the installation scripts under `./install/`
It sets `~/.bashrc.sh` to `source ~/env/env.sh` 

## Usage

1. Put local workstation scripts to be sourced under `~/env/per_host/${HOSTNAME}`
2. Put local unversioned scripts to be sourced under `~/env/local/`
