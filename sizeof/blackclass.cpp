/**
 * @file blackclass.cpp
 * @brief 空类的大小为1字节
 * @author dino
 * @version v1
 * @date 2021-09-28
 */
#include <iostream>
using namespace std;
class A{};
int main()
{
    cout << sizeof(A) << endl;
}