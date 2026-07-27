// lib/screens/pantalla_paso4.dart
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/error/api_exception.dart';
import '../data/api/dio_client.dart';
import '../domain/producto.dart';
import '../domain/producto_dto.dart';

/// Repite la petición de productos, pero ahora usando el DioClient real
/// de PreciosEC y capturando errores como ApiException tipada
/// (igual que hacen tus *_admin_datasource.dart reales).
Future<List<Producto>> _fetchProductosConDio() async {
  try {
    final response = await DioClient.instance.get('/kache/productos/');
    final data = response.data as Map<String, dynamic>;
    final lista = data['results'] as List<dynamic>;
    return lista
        .map((e) => ProductoDto.fromJson(e as Map<String, dynamic>).toDomain())
        .toList();
  } on DioException catch (e) {
    throw ApiException(
      'No se pudieron cargar los productos (${e.type} · ${e.response?.statusCode ?? 's/n'})',
      statusCode: e.response?.statusCode,
    );
  }
}

class PantallaPaso4 extends StatelessWidget {
  const PantallaPaso4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 4 · Errores tipados'),
        leading: BackButton(onPressed: () => context.go('/')),
      ),
      body: FutureBuilder<List<Producto>>(
        future: _fetchProductosConDio(),
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          // Error tipado — mostramos el mensaje de ApiException, no la
          // excepción cruda de Dio.
          if (snap.hasError) {
            final error = snap.error;
            final mensaje = error is ApiException
                ? error.message
                : 'Error inesperado: $error';
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, size: 48, color: Colors.red),
                    const SizedBox(height: 12),
                    Text(mensaje,
                        style: const TextStyle(color: Colors.red),
                        textAlign: TextAlign.center),
                  ],
                ),
              ),
            );
          }

          final productos = snap.data!;
          if (productos.isEmpty) {
            return const Center(child: Text('No hay productos registrados'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: productos.length,
            itemBuilder: (context, i) {
              final p = productos[i];
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.inventory_2),
                  title: Text(p.nombre),
                  subtitle: Text('${p.marca} · ${p.categoria ?? 'Sin categoría'}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
