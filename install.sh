for i in `ls install`; do
   echo running ${i}
   ./install/${i}
done
echo "source ~/env/env.sh" >> ~/.bashrc
