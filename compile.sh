a=$2
if [ $a == 0 ]
then 
  #standard
	g++ -std=c++17 -o $1 $1.cpp
elif [ $a == 1 ]
then 
	#compile with flags (faster - F8)
	g++ -std=c++17 -Wshadow -Wall -o "$1" "$1.cpp" -O2 -Wno-unused-result
elif [ $a == 2 ]
then
	#compile with additional flags (slower - F9)
	g++ -std=c++17 -Wshadow -Wall -o "$1" "$1.cpp" -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
else
	echo "Select proper flags...File not compiled"
fi
