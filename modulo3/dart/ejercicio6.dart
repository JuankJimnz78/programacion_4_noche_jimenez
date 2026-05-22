import 'dart:io';

void main() {
  int totalMuebles = 0;
  int cantidadTrabajador = 0;

  print('Ingrese la cantidad de muebles fabricados de cada trabajador (0 para terminar):');
  int muebles = int.parse(stdin.readLineSync()!);

  while (muebles > 0) {
    cantidadTrabajador++;
    totalMuebles += muebles;

    if (muebles < 3) {
      print('Produccion Baja');
    } else if (muebles <= 7) {
      print('Producción Normal');
    } else {
      print('Entrenamiento intenso');
    }

    print('\nIngrese los minutos de entrenamiento de otro cliente (0 para terminar):');
    minutos = int.parse(stdin.readLineSync()!);
  }

  if (cantidadClientes > 0) {
    double promedio = totalMinutos / cantidadClientes;
    print('\n--- Resumen del día ---');
    print('Total de minutos entrenados: $totalMinutos');
    print('Cantidad de clientes registrados: $cantidadClientes');
    print('Promedio de minutos por cliente: ${promedio.toStringAsFixed(2)}');
  } else {
    print('No se registraron clientes.');
  }
}
