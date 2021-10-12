#include <iostream>
using namespace std;

// class A 
// {
//   const int SIZE = 100;   // 错误，企图在类声明中初始化 const 数据成员 
//   int array[SIZE];  // 错误，未知的 SIZE 
// }; 

class A
{
public:
    A(int size):SIZE(size) {}
private:
    const int SIZE;
};
 
int main()
{
    A  a(100); // 对象 a 的 SIZE 值为 100 
    A  b(200); // 对象 b 的 SIZE 值为 200 
    return 0;
}