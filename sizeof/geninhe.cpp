/**
 * @file geninhe.cpp
 * @brief 1.普通单继承,继承就是基类+派生类自身的大小(注意字节对齐)
 * 注意：类的数据成员按其声明顺序加入内存，无访问权限无关，只看声明顺序。
 * 2.虚单继承，派生类继承基类vptr
 * @author dino
 * @version v1
 * @date 2021-09-28
 */
#include <iostream>
using namespace std;

class A
{
public:
    char a;
    int b;
};

/**
 * @brief 此时B按照顺序：
 * char a
 * int b
 * short c
 * long d // 64位系统是8字节
 * 根据字节对齐4+4=8+8+8=24
 */
class B:A
{
public:
    short c;
    long d;
};
class C
{
    A a;
    char c;
};
class A1
{
    virtual void fun(){}
};
class C1:public A1
{
};

int main()
{
    cout<<sizeof(A)<<endl; // 8
    cout<<sizeof(B)<<endl; // 24
    cout<<sizeof(C)<<endl; // 12
    /**
     * @brief 对于虚单函数继承，派生类也继承了基类的vptr，所以是8字节
     */
    cout<<sizeof(C1)<<endl; // 8 
    return 0;
}