#include <iostream>
#include <stdlib.h>
#include <math.h>
using namespace std;

int cuadradosTotales(int );

int main() {
   int valor;
	cout << "Ingrese valor para fila y columna:" << endl;
	cin>>valor;
	cout << "La cantidad de cuadrados que hay es: " <<cuadradosTotales(valor)<< endl;
	system("pause");
	return 0;
}
int cuadradosTotales(int valor){
   int resultado = 0;
   for(int i=1;i<=valor;i++){
         resultado += pow(i,2);
      }
   return resultado;
}
