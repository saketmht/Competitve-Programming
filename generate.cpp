#include <bits/stdc++.h>
using namespace std;

int rand(int a, int b) 
{
	return a + rand() % (b - a + 1);
}

vector<char> fillChar() {
	vector<char> v(26);
	v[0] = 'a';
	for(int i = 1; i < 26; i++) {
		v[i] = v[i-1] + 1;
	}
	return v;
}

string genString(int n) {
	string s;
	vector<char> v = fillChar();
	for(int i = 0; i < n; i++) {
		int index = rand(0, 25);
		s.push_back(v[index]);
	}
	return s;
}

int main(int argc, char* argv[]) {
	srand(atoi(argv[1]));
	
	//fillChar();
		
	int t = rand(1, 10);
	cout << t << "\n";
	while(t--) {
		int n = rand(0, 20);
		cout << n << " ";
	}
	cout << "\n";
}
