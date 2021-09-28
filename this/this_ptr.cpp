#include <iostream>
#include <cstring>
using namespace std;

class Person {

public:
    typedef enum {
        BOY = 0,
        GIRL
    }SexType;
    Person(char *n, int a, SexType s) {
        name = new char[strlen(n) + 1];
        strcpy(name, n);
        age = a;
        sex = s;
    }
    ~Person() {
        delete[] name;
    }
    int getAge() const {
        return this->age;
    }
    Person& addAge(int a) {
        age += a;
        return *this;
    }

private:
    char *name;
    int age;
    SexType sex;

};

int main() {
    Person p("zhangsan", 20, Person::BOY);
    cout << p.getAge() << endl;
    cout << p.addAge(10).getAge() << endl;
    return 0;
}