#include <iostream>
#include <list>

using namespace std;
// template template parameter 模板模板参数
template<typename T, template<typename U> class Container>
class XCls {
private:
    Container<T> c;
};

// alias template
template<typename T>
using Lst = list<T>;

int main() {

    // XCls<string, list> mylist1; // class template "std::__cxx11::list" is not compatible with template template parameter "Container"
    XCls<string, Lst> mylist2;
    return 0;
}
// https://blog.csdn.net/luke_sanjayzzzhong/article/details/103088539