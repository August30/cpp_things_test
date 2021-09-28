#include <iostream>
using namespace std;

class Base
{
public:
    inline virtual void who()
    {
        cout << "I am Base\n";
    }
    virtual ~Base(){}
};
class Derived : public Base
{
public:
    inline void who() // 不写inline时隐式内联
    {
        cout << "I am Derived\n";
    }
};

int main()
{
    Base b;
    b.who();

    Base *ptr = new Derived();
    ptr->who();

    delete ptr;
    ptr = nullptr;

    return 0;
}