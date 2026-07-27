// lib/screens/pantalla_productos.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modulo10_riverpod_mp/models/producto_local.dart';
import '../providers/productos_provider.dart';

class PantallaProductos extends ConsumerWidget {
  const PantallaProductos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productos = ref.watch(productosProvider);
    final cs        = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Productos (${productos.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: productos.isEmpty
          ? const Center(child: Text('Sin productos'))
          : ListView.separated(
              itemCount:        productos.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (context, i) {
                final p = productos[i];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: p.destacado
                        ? Colors.green.shade50
                        : Colors.grey.shade100,
                    child: Icon(Icons.inventory_2,
                        color: p.destacado ? Colors.green : Colors.grey),
                  ),
                  title:    Text(p.nombre,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text('${p.marca} · \$${p.precioReferencial.toStringAsFixed(2)}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          p.destacado ? Icons.star : Icons.star_border,
                          color: p.destacado ? Colors.amber : null,
                        ),
                        onPressed: () => ref
                            .read(productosProvider.notifier)
                            .toggleDestacado(p.id),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline,
                            color: Colors.red),
                        onPressed: () => ref
                            .read(productosProvider.notifier)
                            .eliminar(p.id),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final id = DateTime.now().millisecondsSinceEpoch.toString();
          ref.read(productosProvider.notifier).agregar(
            ProductoLocal(
              id:     id,
              nombre: 'Nuevo producto $id',
              marca:  'Genérica',
              precioReferencial: 1.00,
              categoria: 'Abarrotes',
              unidadMedida: 'unidad',
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
