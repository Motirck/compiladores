#include <stdio.h>
#include "MyHeader.h"

#define N 20
float notas[N];
int a, b, c;
char d;
void limpeza()
{
    for (int i = 0; i < N; i++)
    {
        notas[i] = 0;
    }
}
int main()
{
    limpeza();
    a = 10;
    b = a * 2;
    c = a + b;
    return 1;
}