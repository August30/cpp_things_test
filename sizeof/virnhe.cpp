/**
 * @file virnhe.cpp
 * @brief 虚继承
 * @author dino
 * @version v1
 * @date 2021-09-28
 */

#include<iostream>
using namespace std;
class A
{
    virtual void fun() {}
};
class B
{
    virtual void fun2() {}
};
class C : virtual public  A, virtual public B
{
    public:
        virtual void fun3() {}
};
class D : virtual public  A
{
    public:
        virtual void fun4() {}
};

int main()
{
    /**
     * @brief 8 8 16 8  派生类虚继承多个虚函数，会继承所有虚函数的vptr
     */
    cout << sizeof(A) << " " << sizeof(B) << " " << sizeof(C) << " " << sizeof(D) << endl;

    return 0;
}