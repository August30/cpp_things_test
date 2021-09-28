/**
 * @file morevir.cpp
 * @brief 对于包含虚函数的类，不管有多少个虚函数，只有一个虚指针,vptr的大小。
 * @author dino
 * @version v1
 * @date 2021-09-28
 */
#include <iostream>
using namespace std;
class A {
    virtual void fun();
    virtual void fun1();
    virtual void fun2();
    virtual void fun3();
};

int main()
{
    cout << sizeof(A) << endl; // 8
    return 0;
}