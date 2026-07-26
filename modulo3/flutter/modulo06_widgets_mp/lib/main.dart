// lib/main.dart
import 'package:flutter/material.dart';
import 'widgets/catalogo_basico.dart';
import 'widgets/etiqueta.dart';
import 'widgets/disponibilidad_producto.dart';
import 'widgets/contador_limitado.dart';
import 'widgets/reloj.dart';
import 'widgets/pantalla_contexto.dart';
import 'widgets/indicador.dart';

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1   StatelessWidget mínimo                             │
// │  2  Paso 1b  Widgets básicos — catálogo de PreciosEC            │
// │  3  Paso 2   StatelessWidget con parámetros — Etiqueta          │
// │  4  Paso 3   StatefulWidget / setState — Disponibilidad         │
// │  5  Paso 3b  Parámetros en StatefulWidget — ContadorLimitado    │
// │  6  Paso 4   Ciclo de vida con Timer — Reloj de comparación     │
// │  7  Paso 5   BuildContext                                        │
// │  8  Paso 6   Composición de widgets — panel de indicadores      │
// └──────────────────────────────────────────────────────────────────┘
const int paso = 8;

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: switch (paso) {
      1 => const Scaffold(body: Center(child: Saludo())),
      2 => const CatalogoBasicos(),
      3 => const Scaffold(
        body: Center(
          child: Wrap(
            spacing: 12,
            runSpacing: 8,
            children: [
              Etiqueta(texto: 'Disponible', color: Colors.green),
              Etiqueta(texto: 'Agotado', color: Colors.red, relleno: true),
              Etiqueta(texto: 'Por confirmar', color: Colors.orange),
              Etiqueta(
                texto: 'Oferta',
                color: Colors.red,
                fontSize: 16,
                relleno: true,
              ),
              Etiqueta(texto: 'Nuevo', color: Colors.blue, fontSize: 11),
            ],
          ),
        ),
      ),
      4 => const Scaffold(
        body: Center(child: DisponibilidadProducto(nombre: 'Café Nacional 500g')),
      ),
      5 => Scaffold(
        // Paso 3b
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContadorLimitado(
                etiqueta: 'Intentos de código promocional',
                limite: 3,
                color: Colors.red,
                onLimite: () => debugPrint('¡Código bloqueado!'),
              ),
              const SizedBox(height: 40),
              ContadorLimitado(
                etiqueta: 'Productos en lista de comparación',
                limite: 10,
                color: Colors.indigo,
              ),
            ],
          ),
        ),
      ),
      6 => Scaffold(
        // Paso 4
        appBar: AppBar(title: const Text('Tiempo desde la última actualización')),
        body: const Center(child: Reloj()),
      ),
      7 => const PantallaContexto(), // Paso 5 — BuildContext
      8 => Scaffold(
        // Paso 6
        body: Center(
          child: Wrap(
            spacing: 32,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: const [
              Indicador(
                label: 'Productos activos',
                valor: '128',
                color: Colors.green,
                icono: Icons.inventory_2,
              ),
              Indicador(
                label: 'Alertas de precio',
                valor: '5',
                color: Colors.red,
                icono: Icons.warning_amber,
                subtitulo: 'Requieren revisión',
              ),
              Indicador(
                label: 'Comercios afiliados',
                valor: '12',
                color: Colors.indigo,
              ),
              Indicador(
                label: 'Ahorro promedio',
                valor: '18.4%',
                color: Colors.teal,
                subtitulo: 'Últimos 30 días',
              ),
            ],
          ),
        ),
      ),
      _ => Scaffold(body: Center(child: Text('Paso $paso: crea el widget primero'))),
    },
  ),
);

class Saludo extends StatelessWidget {
  const Saludo({super.key});
  @override
  Widget build(BuildContext context) =>
      const Text('Hola PreciosEC', style: TextStyle(fontSize: 32));
}
