#for CODEFORCES contests only
#compiles and tests your files against sample test cases
#place the file in the directory with the contest folder
#set a global environment variable 'CURR' to the contest number
# .../$ CURR=124
# .../$ export CURR
#first argument corresponds to problem (A, B..etc)
#second argument corresponds to compilation option...see below for details

a=$2
file=$CURR/$1/$1
compilation_log=""

if [ $a == 0 ]
then 
	#standard
	compilation_log=$(g++ -std=c++17 -o $file $file.cpp 2>&1)
elif [ $a == 1 ]
then 
	#compile with flags (faster)
	compilation_log=$(g++ -std=c++17 -Wshadow -Wall -o "$file" "$file.cpp" -O2 -Wno-unused-result 2>&1)
elif [ $a == 2 ]
then
	#compile with additional flags (slower)
	compilation_log=$(g++ -std=c++17 -Wshadow -Wall -o "$file" "$file.cpp" -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG 2>&1)
else
	compilation_log=$(echo "Select proper flags...File not compiled")
fi

#if compilation unsuccessful print error and exit
if [ "$compilation_log" != "" ]
then
	echo "$compilation_log"
	exit
fi


#check against sample tests
j=1
echo
for i in $(ls $CURR/$1/in*)
do
	echo "Sample Test $j: "
	diff -w --old-line-format="%5dn< %L" --new-line-format="%5dn> %L" --unchanged-line-format="%5dn= %L" $CURR/$1/out$j <(./$file < $i) > res
	sort -o res res
	while read -r line
	do
		r=${line:1:2}
		if [ $r == "=" ]
		then
			echo "Test Case ${line:0:1} : PASSED!!!"
			#echo "Output : ${line#*=}"
		elif [ $r == "<" ]
		then
			echo "Test Case ${line:0:1} : FAILED!!!" | grep --color '.*'
			echo "Expected Output : ${line#*<}" | grep --color '.*'
		else
			echo "Your Output : ${line#*>}" | grep --color '.*'
		fi
	done < res
	((j++))
	echo 
done
