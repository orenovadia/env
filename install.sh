for i in `ls install`; do
   echo running ${i}
   ./install/${i}
done
! grep --quiet '~/env/env.sh' ~/.bashrc && echo "Adding source to bashrc.sh"  && echo "source ~/env/env.sh" > ~/.bashrc
