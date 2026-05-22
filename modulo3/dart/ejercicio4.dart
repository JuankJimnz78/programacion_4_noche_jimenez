//total a pagar y la cantidad de platos con while

import 'dart: io';

void main(){
  print('Ingrese su nombre:');
  String? nombre = stdin.readLineSync();
  print('Hola $nombre');

  print('Ingrese un numero entero:');
  int numero = int.parse(stdin.readLineSync()!);
  print('Numero: $numero');

  print('Ingrese un decimal:');
  double valor = double.parse(stdin.readLineSync()!);
  print('valor: $valor');
  
}