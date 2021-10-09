#include <iostream>
extern "C" {
    #include "add.h"
}
using namespace std;

int main() 
{
    cout << add(2, 3) << endl;
    return 0;
}