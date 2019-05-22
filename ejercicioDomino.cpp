#include <iostream>
#include <stdlib.h>
using namespace std;

int main() {
   int fichasDeDomino=0;
   int tablero[8][8]={1,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,1};

   cout << "Bienvenido, a continuación verá el tablero de ajedrez mutilado:" << endl;
   cout << "1=casilla mutilada, 0=casilla libre" << endl;

      for(int i=0;i<8;i++){
         for(int j=0;j<8;j++){
            cout <<tablero[i][j];
         }
         cout << endl;
      }

      cout << "Al intentar ingresar 31 fichas de domino, veremos que sucede:" << endl;

      system("pause");

      for(int i=0;i<8;i++){
            for(int j=0;j<8;j+=2){
               if(tablero[i][j]==0 && tablero[i][j+1]==0 and fichasDeDomino<31){
                  tablero[i][j]=1;
                  tablero[i][j+1]=1;
                  fichasDeDomino++;
               }
               cout << tablero[i][j] << tablero[i][j+1];
            }
            cout << endl;
         }

      cout << "Como se ve, no es posible ingresar las 31 fichas en el tablero, solamente entran: "<< fichasDeDomino<< " fichas de domino que ocupan 2 casillas."<<endl;

	return 0;
}
