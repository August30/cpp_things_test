
// #include<iostream>
// #include<vector>
// using namespace std;
// int main() {
// 	vector<int> vc({ 1,2,3,4 });	//这里调用了构造函数，实参为{1,2,3,4}
// 	return 0;
// }

#include <iostream>
using namespace std;
 
void print(initializer_list<int> list) {
    for (auto it = list.begin(); it != list.end(); ++it)
        cout << *it << " ";
    cout << endl;
}

int main() {
    print({1, 2, 3, 4, 5 ,6, 7});
    return 0;
}