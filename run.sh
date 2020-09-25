for((i = 1; i < 1000; ++i)); do
    echo $i
    ./generate $i > int
    ./first_exe < int > out1
    ./second_exe < int > out2
    #diff -w out1 out2 || read -p "Press any key to resume ..."
    diff -w out1 out2 || break
    #diff -w <(./first_exe < int) <(./second_exe < int) || break
    #sleep 5s
done
