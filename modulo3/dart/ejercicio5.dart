import 'dart:io';

void main() {
  int totalPasajeros = 0;
  int totalRetraso = 0;
  int agentes = 0;

  while (true) {
    stdout.write("Ingrese cantidad de vuelos atendidos (0 para terminar): ");
    int vuelos = int.parse(stdin.readLineSync()!);

    if (vuelos == 0) break;

    stdout.write("Ingrese cantidad de pasajeros procesados: ");
    int pasajeros = int.parse(stdin.readLineSync()!);

    stdout.write("Ingrese minutos totales de retraso: ");
    int retraso = int.parse(stdin.readLineSync()!);

    agentes++;
    totalPasajeros += pasajeros;
    totalRetraso += retraso;

    double pasajerosPorVuelo = pasajeros / vuelos;
    double retrasoPorVuelo = retraso / vuelos;

    print("Pasajeros por vuelo: $pasajerosPorVuelo");
    print("Retraso por vuelo: $retrasoPorVuelo");

    if (pasajerosPorVuelo < 50) {
      print("Baja eficiencia");
    } else if (pasajerosPorVuelo <= 120) {
      print("Eficiencia normal");
    } else {
      print("Alta eficiencia");
    }
  }

  double promedioPasajeros = agentes > 0 ? totalPasajeros / agentes : 0;
  double promedioRetrasoPorVuelo = agentes > 0 ? totalRetraso / totalPasajeros : 0;

  print("\n--- Resultados ---");
  print("Total pasajeros: $totalPasajeros");
  print("Total minutos de retraso: $totalRetraso");
  print("Agentes registrados: $agentes");
  print("Promedio pasajeros por agente: $promedioPasajeros");
  print("Promedio general retraso por vuelo: $promedioRetrasoPorVuelo");
}
