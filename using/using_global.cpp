/**
 * @file using_global.cpp
 * @brief using各种使用
 * @author dino
 * @version v1
 * @date 2021-10-11
 */

#include <iostream>
#define isNs1 1
// #define isGlobal 2
using namespace std;
void func()
{
    cout << "::func" << endl;
}

namespace ns1 {
    void func()
    {
        cout << "ns1::func" << endl;
    }
}

namespace ns2 {
#ifdef isNs1
    using ns1::func; // ns1中的函数
#elif isGloabl
    using ::func; // 全局中的函数
#else
    void func()
    {
        cout << "other::func" << endl; 
    }
#endif
}

int main()
{
    /**
     * 这就是为什么在c++中使用了cmath而不是math.h头文件
     */
    ns2::func();
    return 0;
}