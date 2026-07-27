import 'package:flutter/material.dart';

class SizedboxCustom extends StatelessWidget {
  const SizedboxCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // SizedBox — espaciado fijo
          const Text(
            'SizedBox',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text('Café Nacional 500g'),
          const SizedBox(height: 32), // ← espacio fijo de 32px
          const Text('Precio comparado en 12 comercios (después de 32px)'),

          const Divider(height: 32),

          // Padding — espacio alrededor de un hijo
          const Text(
            'Padding',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            color: Colors.indigo.shade50,
            child: const Padding(
              padding: EdgeInsets.only(left: 24), // ← sangría izquierda
              child: Text('Categoría: Abarrotes'),
            ),
          ),

          const Divider(height: 32),

          // Align — posicionar dentro del espacio disponible
          const Text('Align', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Align(
            alignment: Alignment.centerRight, // ← borde derecho
            child: Icon(Icons.favorite, color: Colors.indigo),
          ),

          const Divider(height: 32),

          // Wrap — flujo automático de elementos
          const Text('Wrap', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              'Abarrotes',
              'Lácteos',
              'Limpieza',
              'Bebidas',
              'En oferta',
              'Precio verificado',
              'Envío gratis',
            ].map((t) => Chip(label: Text(t))).toList(),
          ),
        ],
      ),
    );
  }
}
