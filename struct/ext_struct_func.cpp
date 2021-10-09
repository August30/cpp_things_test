#include<iostream>
#include<stdio.h>
struct Base {         
    int v1 = 4;
//    private:   //error!
        int v3 = 2;
    public:   //显示声明public
        int v2 = 1;
    virtual void print(){       
        printf("%s\n","Base");
    };    
};
struct Derived:Base {         

    public:
        int v2;
    void print(){       
        printf("%s\n","Derived");
    };    
};
int main()
{
    Base *b = new Derived();
    b->print();
    printf("%d,%d,%d", b->v1, b->v2, b->v3);
    delete b;
    return 0;
}