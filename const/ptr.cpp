#include <iostream>
using namespace std;

// 指向常量的指针
int main() {
    
    int a = 3;
    const int *ptr = &a;

    // *ptr = 10; // error
    // const int p = 10;
    // const void *vp = &p;
    // void *vp = &p; // error

    int *ptr2;
    *ptr2 = 2;
    cout << "*ptr2 = " << *ptr2 << endl;
    cout << "*ptr = " << *ptr << endl;

    ptr = ptr2;
    *ptr2 = 22;
    // *ptr = 1; // error
    cout << "*ptr2 = " << *ptr2 << endl;
    cout << "*ptr = " << *ptr << endl;

    return 0;
}