#include <iostream>

extern int ext;
int main() {
    ext = 10;
    std::cout << (ext + 10) << std::endl;
}