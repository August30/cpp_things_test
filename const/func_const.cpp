class Apple
{
private:
    int people[100];
public:
    Apple(int i);
    const int apple_number;
    void take(int num) const;
    int add(int num);
    int add(int num) const;
};

#include <iostream>
using namespace std;

Apple::Apple(int i):apple_number(i)
{

}

int Apple::add(int num){
    cout<<"add func :"<< num <<endl;
}
int Apple::add(int num) const{
    cout<<"add const func :"<< num <<endl;
}

void Apple::take(int num) const
{
    cout<<"take func :"<< num <<endl;
}

int main(){
    Apple a(2);
    a.add(10);
    const Apple b(3);
    b.add(100);
    return 0;
}