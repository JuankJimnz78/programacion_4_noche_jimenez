// lib/screens/pantalla_paso2.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:modulo12_api_mp/core/config/app_config.dart';

import '../domain/categoria_dto.dart';

class PantallaPaso2 extends StatelessWidget {
  const PantallaPaso2({super.key});

  Future<List<CategoriaDto>> _fetchCategorias() async {
    final res = await http.get(
      Uri.parse('${AppConfig.baseUrl}/kache/categorias/'),
    );
    final data = jsonDecode(res.body) as Map<String, dynamic>;
    final lista = (data['results'] ?? data['resultados']) as List<dynamic>;
    return lista
        .map((e) => CategoriaDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 2 · DTO simple'),
        leading: BackButton(onPressed: () => context.go('/')),
      ),
      body: FutureBuilder<List<CategoriaDto>>(
        future: _fetchCategorias(),
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text('Error: ${snap.error}'));
          }

          final categorias = snap.data!;
          return Column(
            children: [
              // Resumen con chip de conteo
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Chip(
                      label: Text('${categorias.length} categorías'),
                      backgroundColor: Colors.green[100],
                    ),
                  ],
                ),
              ),
              // Lista de categorías
              Expanded(
                child: ListView.builder(
                  itemCount: categorias.length,
                  itemBuilder: (context, i) {
                    final c = categorias[i];
                    return ListTile(
                      leading: const Icon(Icons.category_outlined),
                      title: Text(c.nombre),
                      subtitle: Text(c.descripcion),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
