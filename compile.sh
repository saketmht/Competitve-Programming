#standard
g++ -std=c++14 -o $1 $1.cpp

#compile with flags (faster - F8)
#g++ -std=c++17 -Wshadow -Wall -o "%e" "%f" -O2 -Wno-unused-result

#compile with additional flags (slower - F9)
#g++ -std=c++17 -Wshadow -Wall -o "%e" "%f" -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
