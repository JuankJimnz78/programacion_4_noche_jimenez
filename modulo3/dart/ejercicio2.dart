import 'dart:io';

void main() {
  int totalMuebles = 0;
  int trabajadores = 0;

  while (true) {
    stdout.write("Ingrese cantidad de muebles (0 para terminar): ");
    int muebles = int.parse(stdin.readLineSync()!);

    if (muebles == 0) break;

    trabajadores++;
    totalMuebles += muebles;

    if (muebles < 3) {
      print("Producción baja");
    } else if (muebles <= 7) {
      print("Producción normal");
    } else {
      print("Producción alta");
    }
  }

  double promedio = trabajadores > 0 ? totalMuebles / trabajadores : 0;
  print("\n--- Resultados ---");
  print("Total de muebles: $totalMuebles");
  print("Trabajadores registrados: $trabajadores");
  print("Promedio por trabajador: $promedio");
}
