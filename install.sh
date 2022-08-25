#!/usr/bin/env bash
for i in `ls install`; do
   echo running ${i}
   ./install/${i}
done

# Configuration
if [ $(uname -s) = "Darwin" ]
then
    RC_FILE=~/.bash_profile
else
    RC_FILE=~/.bashrc
fi

if ! grep --quiet '~/env/env.sh' ${RC_FILE}
then
    echo "Adding source to rc file: ${RC_FILE}"
    cp ${RC_FILE}  ~/.bashrc_backup || true # do not care if fails
    echo "source ~/env/env.sh" > ${RC_FILE}
else
    echo "bashrc is sourcing us, no need to do anything"
fi
