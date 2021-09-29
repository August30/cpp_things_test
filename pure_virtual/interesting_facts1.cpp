/**
 * @file interesting_facts1.cpp
 * @brief 纯虚函数使一个类变成抽象类
 * @author dino
 * @version v1
 * @date 2021-09-29
 */

#include <iostream>
using namespace std;

/**
 * @brief 抽象类至少包含一个纯虚函数
 */
class Test
{
    int x;
public:
    virtual void show() = 0;
    int getx() { return x; }
};

int main()
{
    // Test t; // error! 不能创建抽象类的对象
    return 0;
}