#include <iostream>
#include "inline.h"

using namespace std;

/**
 * @brief inline要起作用,inline要与函数定义放在一起,inline是一种“用于实现的关键字,而不是用于声明的关键字”
 *
 * @param x
 * @param y
 *
 * @return 
 */
void Foo(int x,int y);  // 函数声明
inline void Foo(int x,int y) // 函数定义
{
    cout << x+y << endl;
}

// 定义处加inline关键字，推荐这种写法！
inline void A::f1(int x){
    cout << "inline void A::f1 x = " << x << endl;
}

int main()
{
    Foo(1,2);
    A a;
    a.f1(5);
    a.Foo(9, 9);
}
/**
 * 编译器对 inline 函数的处理步骤
 * 将 inline 函数体复制到 inline 函数调用点处；
 * 为所用 inline 函数中的局部变量分配内存空间；
 * 将 inline 函数的的输入参数和返回值映射到调用方法的局部变量空间中；
 * 如果 inline 函数有多个返回点，将其转变为 inline 函数代码块末尾的分支（使用 GOTO）。
 */