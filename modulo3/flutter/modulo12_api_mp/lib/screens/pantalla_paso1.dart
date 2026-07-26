// lib/screens/pantalla_paso1.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:modulo12_api_mp/core/config/app_config.dart';

class PantallaPaso1 extends StatelessWidget {
  const PantallaPaso1({super.key});

  Future<Map<String, dynamic>> _fetchPrimerProducto() async {
    final res = await http.get(
      Uri.parse('${AppConfig.baseUrl}/kache/productos/'),
    );
    final data = jsonDecode(res.body) as Map<String, dynamic>;
    final resultados = data['results'] as List<dynamic>;
    return resultados.first as Map<String, dynamic>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 1 · FutureBuilder crudo'),
        leading: BackButton(onPressed: () => context.go('/')),
      ),
      body: Center(
        child: FutureBuilder<Map<String, dynamic>>(
          future: _fetchPrimerProducto(),
          builder: (context, snap) {
            // Estado 1: esperando respuesta
            if (snap.connectionState != ConnectionState.done) {
              return const CircularProgressIndicator();
            }
            // Estado 2: error de red (p. ej. el backend Django no está corriendo)
            if (snap.hasError) {
              return Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.wifi_off, size: 48, color: Colors.red),
                    const SizedBox(height: 8),
                    Text('Error: ${snap.error}',
                        style: const TextStyle(color: Colors.red),
                        textAlign: TextAlign.center),
                    const SizedBox(height: 8),
                    Text(
                      'Verifica que tu backend Django esté corriendo en ${AppConfig.baseUrl}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }
            // Estado 3: datos disponibles
            final producto = snap.data!;
            return Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.inventory_2, size: 48, color: Colors.green),
                  const SizedBox(height: 16),
                  Text('ID: ${producto['id_producto']}',
                      style: const TextStyle(fontSize: 14, color: Colors.grey)),
                  const SizedBox(height: 8),
                  Text(
                    producto['nombre'] as String,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Chip(
                    label: Text('Marca: ${producto['marca']}'),
                    backgroundColor: Colors.green[100],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
