#include <stdio.h>

extern void qs(int arr[], int inicio, int fin);
/*
void qs(int arr[], int inicio, int fin)
{
    int izq, der, pivote, aux;
    izq = inicio;
    der = fin;
    pivote = arr[(inicio + fin) / 2];
    
    do
    {
        while(arr[izq] < pivote && izq < fin)
        {
            izq++;
        }
        
        while(arr[der] > pivote && der > inicio)
        {
            der--;
        }
        
        if(izq <= der)
        {
            aux = arr[izq];
            arr[izq] = arr[der];
            arr[der] = aux;
            
            izq++;
            der--;
        }

    } while(izq <= der);

    if(inicio <= der)
    {
        qs(arr, inicio, der);
    }
    
    if(fin > izq)
    {
        qs(arr, izq, fin);
    }
    
}
*/

int main()
{
    int array[] = {3, 1, 2};
    int len = 3;
    for(int i = 0; i < len; i++)
    {
        printf("%d, ", array[i]);
    }
    printf("\n");
    
    qs(array, 0, len - 1);
    
    for(int i = 0; i < len; i++)
    {
        printf("%d, ", array[i]);
    }
    printf("\n");
    
    return 0;
}