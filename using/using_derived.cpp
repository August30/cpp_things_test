/**
 * @file using_derived.cpp
 * @brief 函数重装
 * @author dino
 * @version v1
 * @date 2021-10-11
 */
#include <iostream>
using namespace std;

class Base{
    public:
        void f() { cout << "f()" << endl;
        }
        void f(int n) {
            cout << "Base::f(int)" << endl;
        }
};

class Derived : private Base {  // public
    public:
        using Base::f;
        void f(int n) {
            cout << "Derived::f(int)" << endl;
        }
};

int main()
{
    // Base b;
    Derived d;
    d.f();
    d.f(1);
    return 0;
}

