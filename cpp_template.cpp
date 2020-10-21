#include <bits/stdc++.h>
using namespace std;
#define all(x) x.begin(), x.end()
#define ris return * this
#define tmp template<typename T
#define args(...) " [" << #__VA_ARGS__ ": " << (__VA_ARGS__) << "] "

struct debug {
    #ifdef LOCAL
    ~debug() { cerr << '\n'; }
    debug& operator<<(const string s) { cerr << s; ris; }
    tmp, typename T2> debug& operator<<(pair<T, T2> d) {
        ris << "(" << d.first << ", " << d.second << ")"; }
    tmp> typename enable_if<!is_pod<T>::value, debug&>::type operator<<(T i) {
        *this << "[";
        for(auto it = i.begin(); it != i.end(); it++) {
            cerr << ", " + 2 * (it == i.begin()); *this << *it; }
        ris << "]";
    }
    tmp> typename enable_if<is_pod<T>::value, debug&>::type operator<<(T i) {
        cerr << boolalpha << i; ris; }
    #else
    tmp> debug & operator <<(const T&) { ris; } 
    #endif
};
//debug() << args(...);

typedef long long ll;
typedef pair<int, int> pii;
const int mod = 1e9 + 7;

void solve() {
    
}

int main(void) {
    
    ios_base::sync_with_stdio(false); 
    cin.tie(NULL);
  
    int t;
    cin >> t;

    for(int i = 1; i <= t; i++) {
        solve();
    }

    return 0;
}
