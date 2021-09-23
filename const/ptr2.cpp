#include <iostream>
using namespace std;

// 常指针
int main() {
    
    int num = 0;
    int * const ptr = &num; //const指针必须初始化！且const指针的值不能修改
    int * t = &num;
    *t = 1;
    cout<< *ptr <<endl;

    *ptr = 3;
    cout<< *ptr <<endl;

    // ptr = t; // error 

    return 0;
}