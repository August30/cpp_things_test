#include <iostream>
#include <bitset>
using namespace std;

// Variadic template
// 重载的递归终止函数
void printX() {
}

template<typename T, typename...Types>
void printX(const T& firstArg, const Types&...args) {
    cout << firstArg << endl;
    printX(args...);
}

//重载的递归终止条件
int maximun(int n) {
    return n;
}

template<typename...Args>
int maximun(int n, Args...args) {
    return std::max(n, maximun(args...));
}

int main() {
    // printX(7.5, "hello", bitset<16>(177), 42);
    // return 0;

    //C++11之后已经支持了多个数求最大值的操作，使用initializer_list
	//cout << max({ 57,48,60,100,20,18 });
    cout << maximun(57, 48, 60, 100, 20, 18) << endl;
    return 0;
}
