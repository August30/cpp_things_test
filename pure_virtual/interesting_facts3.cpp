/**
 * @file interesting_facts3.cpp
 * @brief 如果我们不在派生类中覆盖纯虚函数，那么派生类也会变成抽象类。
 * @author dino
 * @version v1
 * @date 2021-09-29
 */

#include <iostream>
using namespace std;

class Base
{
    int x;
public:
    virtual void show() = 0;
    int getx() { return x; }
};
class Derived: public Base
{
public:
    // void show() {}
};

int main()
{
    // Derived d; //error! 派生类没有实现纯虚函数，那么派生类也会变为抽象类，不能创建抽象类的对象
    return 0;
}