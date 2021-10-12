#include <iostream>
using namespace std;

enum  Color {RED,BLUE};
enum  Feeling {EXCITED,BLUE};  // build error:redeclaration of ‘BLUE’

int main() 
{
    
    cout << RED << endl;
    return 0;
}