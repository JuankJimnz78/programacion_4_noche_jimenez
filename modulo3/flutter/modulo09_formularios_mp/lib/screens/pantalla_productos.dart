// lib/screens/pantalla_productos.dart
import 'package:flutter/material.dart';
import 'package:modulo09_formularios_mp/widgets/tarjeta_producto_grid.dart';
import '../models/producto_local.dart';
import '../widgets/fila_producto.dart';

class PantallaProductos extends StatefulWidget {
  const PantallaProductos({super.key});
  @override
  State<PantallaProductos> createState() => _PantallaProductosState();
}

class _PantallaProductosState extends State<PantallaProductos> {
  final _productos = [
    ProductoLocal(id: '1', nombre: 'Café Nacional 500g', marca: 'Nescafé', precioReferencial: 2.35, categoria: 'Abarrotes', unidadMedida: 'unidad', destacado: true),
    ProductoLocal(id: '2', nombre: 'Arroz Superior 1kg', marca: 'Gustadina', precioReferencial: 1.10, categoria: 'Abarrotes', unidadMedida: 'kilogramos'),
    ProductoLocal(id: '3', nombre: 'Aceite Girasol 1L', marca: 'La Favorita', precioReferencial: 2.89, categoria: 'Abarrotes', unidadMedida: 'litros'),
    ProductoLocal(id: '4', nombre: 'Leche Entera 1L', marca: 'Toni', precioReferencial: 0.95, categoria: 'Lácteos', unidadMedida: 'litros'),
  ];

  bool _modoGrid = false;   // false = lista, true = cuadrícula

  void _toggleDestacado(int i) =>
      setState(() => _productos[i].destacado = !_productos[i].destacado);

  void _eliminar(int i) => setState(() => _productos.removeAt(i));

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Productos (${_productos.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          // Toggle lista / cuadrícula
          IconButton(
            icon: Icon(_modoGrid ? Icons.list : Icons.grid_view),
            onPressed: () => setState(() => _modoGrid = !_modoGrid),
            tooltip: _modoGrid ? 'Vista lista' : 'Vista cuadrícula',
          ),
        ],
      ),
      body: _modoGrid
          ? GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.1,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: _productos.length,
              itemBuilder: (ctx, i) => TarjetaProductoGrid(
                producto: _productos[i],
                onDestacado: () => _toggleDestacado(i),
                onEliminar: () => _eliminar(i),
              ),
            )
          : ListView.separated(
              itemCount: _productos.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) => FilaProducto(
                producto: _productos[i],
                onDestacado: () => _toggleDestacado(i),
                onEliminar: () => _eliminar(i),
              ),
            ),
    );
  }
}
