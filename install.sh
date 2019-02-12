#!/usr/bin/env bash
for i in `ls install`; do
   echo running ${i}
   ./install/${i}
done

if ! grep --quiet '~/env/env.sh' ~/.bashrc
then
    echo "Adding source to bashrc.sh"
    cp ~/.bashrc  ~/.bashrc_backup
    echo "source ~/env/env.sh" > ~/.bashrc
else
    echo "bashrc is sourcing us, no need to do anything"
fi