#include <iostream>
using namespace std;

class LeafOfTree{
public:
    LeafOfTree() = default;
    ~LeafOfTree() = default;
 
    LeafOfTree(const LeafOfTree&) = delete;     // mark copy ctor or copy assignment operator as deleted functions
    LeafOfTree & operator=(const LeafOfTree&) = delete;
};

//  在模板特例化中，也可以用 delete 来过滤一些特定的形参类型:
class Widget {
public:
    template<typename T>
    void ProcessPointer(T* ptr) {}
};
 
template<>
void Widget::ProcessPointer<void>(void*) = delete; // still public, but deleted　　 
//这样，当程序代码中，有调用 void* 作形参的 ProcessPointer 函数时，则编译时就会报错。

// 在函数重载中，可用 delete 来滤掉一些函数的形参类型，如下：
bool IsLucky(int number) { return number; };        // original function
bool IsLucky(char) = delete;     // reject chars
bool IsLucky(bool) = delete;     // reject bools
bool IsLucky(double) = delete;   // reject doubles and floats



int main() {

    LeafOfTree  leaf1;
    LeafOfTree  leaf2;
    // LeafOfTree  leaf3(leaf1);     // attempt to copy Leaf1 — should not compile!
    // Leaf1 = Leaf2;              // attempt to copy Leaf2 — should not compile!　　

    if (IsLucky(2)) {};
    // if (IsLucky('a')) {};     // error !    call to deleted function
    // if (IsLucky(true)) {};    // error !
    // if (IsLucky(3.5)) {};     // error !　　

    return 0;
}