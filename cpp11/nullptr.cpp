#include <iostream>
#include <string>
using namespace std;

void func(int *num) {
    cout << "this is the ptr function..." << endl;
}

void func(int num) {
    cout << "this is the normal function..." << endl;
}

int main()
{
    // func(NULL);C++11标准之前，编译器进行解释程序时，NULL会被直接解释成0（int）
    func(0);
    func(nullptr);
    std::nullptr_t null_my;
    func(null_my);
    return 0;
}

/*
C++11的出现后为了规避这个问题，nullptr在C++11中就是代表空指针，补充一下：

0和NULL
C语言中将null作为（void *）类型，而C++将null作为int类型，整数值0.

nullptr和void *
nullptr习惯被称作指针空
void*习惯被称作无类型指针

nullptr和nullptr_t
nullptr习惯被称作指针空
nullptr_t习惯被称作指针空值类型
即表示指针空值类型并非仅有nullptr一个实例
可以通过nullptr_t来声明一个指针空值类型的变量

通过之上的理解，可以解释nullptr是一个字面值常量，类型为std::nullptr_t,空指针常数可以转换为任意类型的指针类型。
*/
