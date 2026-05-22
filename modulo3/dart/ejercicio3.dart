import 'dart:io';

void main() {
  int totalTablas = 0;
  int operarios = 0;

  while (true) {
    stdout.write("Ingrese cantidad de tablas (0 para terminar): ");
    int tablas = int.parse(stdin.readLineSync()!);

    if (tablas == 0) break;

    operarios++;
    totalTablas += tablas;

    if (tablas < 15) {
      print("Trabajo lento");
    } else if (tablas <= 40) {
      print("Trabajo eficiente");
    } else {
      print("Trabajo sobresaliente");
    }
  }

  double promedio = operarios > 0 ? totalTablas / operarios : 0;
  print("\n--- Resultados ---");
  print("Total de tablas: $totalTablas");
  print("Operarios registrados: $operarios");
  print("Promedio por operario: $promedio");
}
