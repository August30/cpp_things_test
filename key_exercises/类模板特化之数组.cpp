#include <iostream>
#include <cstring>
using namespace std;
#define MAXSIZE 5

template<class T>
class Array {
public:
    Array() {
        for (int i = 0; i < MAXSIZE; i++)
        {
            array[i] = 0;
        }
    }

    T &operator[](int i);
    void sort();
private:
    T array[MAXSIZE];
};

template<class T>
T& Array<T>::operator[](int i) {
    if (i < 0 || i > MAXSIZE - 1) {
        cout << "out of range" << endl;
        exit(0);
    }
    return array[i];
}

template<class T>
void Array<T>::sort() {
    int p,j;
    for (int i = 0; i < MAXSIZE - 1; i++)
    {
        p = i;
        for (int j = i + 1; j < MAXSIZE; j++) {
            if (array[p] < array[j])
                p = j;
        }
        T t;
        t = array[i];
        array[i] = array[p];
        array[p] = t;
    }
}

template<>
void Array<char *>::sort() {
    int p,j;
    for (int i = 0; i < MAXSIZE - 1; i++)
    {
        p = i;
        for (int j = i + 1; j < MAXSIZE; j++)
        {
            if (strcmp(array[p], array[j]) < 0)
                p = j;
        }
        char* t = array[i];
        array[i] = array[p];
        array[p] = t;
    }
    
}

int main()
{
    Array<int> a1;
    Array<char *> b1;
    a1[0]=1;a1[1]=23;a1[2]=6;
    a1[3]=3; a1[4]=9; 
    a1.sort();
    for(int i=0;i<5;i++) 
        cout<<a1[i]<<"\t"<<endl;	
    b1[0]="x1";	b1[1]="ya";	b1[2]="ad";
    b1[3]="be";	b1[4]="bc";
    b1.sort();
    for(int i=0;i<5;i++)
        cout<<b1[i]<<"\t"<<endl;	
    return 0;
}