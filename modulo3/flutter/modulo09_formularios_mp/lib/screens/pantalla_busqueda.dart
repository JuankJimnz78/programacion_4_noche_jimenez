// lib/screens/pantalla_busqueda.dart
import 'package:flutter/material.dart';
import 'package:modulo09_formularios_mp/widgets/tarjeta_producto_grid.dart';
import '../models/producto_local.dart';
import '../widgets/fila_producto.dart';

class PantallaBusqueda extends StatefulWidget {
  const PantallaBusqueda({super.key});
  @override
  State<PantallaBusqueda> createState() => _PantallaBusquedaState();
}

class _PantallaBusquedaState extends State<PantallaBusqueda> {
  final _productos = [
    ProductoLocal(id: '1', nombre: 'Café Nacional 500g', marca: 'Nescafé', precioReferencial: 2.35, categoria: 'Abarrotes', unidadMedida: 'unidad', destacado: true),
    ProductoLocal(id: '2', nombre: 'Arroz Superior 1kg', marca: 'Gustadina', precioReferencial: 1.10, categoria: 'Abarrotes', unidadMedida: 'kilogramos'),
    ProductoLocal(id: '3', nombre: 'Aceite Girasol 1L', marca: 'La Favorita', precioReferencial: 2.89, categoria: 'Abarrotes', unidadMedida: 'litros'),
    ProductoLocal(id: '4', nombre: 'Leche Entera 1L', marca: 'Toni', precioReferencial: 0.95, categoria: 'Lácteos', unidadMedida: 'litros'),
  ];

  String _busqueda = '';     // texto actual de la búsqueda
  bool   _modoGrid = false;

  // Getter calculado — filtra sin modificar _productos
  List<ProductoLocal> get _filtrados => _productos
      .where((p) =>
          p.nombre.toLowerCase().contains(_busqueda.toLowerCase()) ||
          p.marca.toLowerCase().contains(_busqueda.toLowerCase()) ||
          p.categoria.toLowerCase().contains(_busqueda.toLowerCase()))
      .toList();

  void _toggleDestacado(ProductoLocal p) =>
      setState(() => p.destacado = !p.destacado);

  void _eliminar(ProductoLocal p) =>
      setState(() => _productos.removeWhere((x) => x.id == p.id));

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final filtrados = _filtrados;   // evalúa el getter una sola vez

    return Scaffold(
      appBar: AppBar(
        title: Text('Productos (${_productos.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          IconButton(
            icon: Icon(_modoGrid ? Icons.list : Icons.grid_view),
            onPressed: () => setState(() => _modoGrid = !_modoGrid),
            tooltip: _modoGrid ? 'Vista lista' : 'Vista cuadrícula',
          ),
        ],
      ),
      body: Column(
        children: [
          // ── SearchBar ─────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: SearchBar(
              hintText: 'Buscar por nombre, marca o categoría...',
              leading: const Icon(Icons.search),
              trailing: _busqueda.isNotEmpty
                  ? [
                      IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => setState(() => _busqueda = ''),
                      ),
                    ]
                  : null,
              onChanged: (v) => setState(() => _busqueda = v),
              padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),

          // ── Contador de resultados ────────────────────────────────
          if (_busqueda.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${filtrados.length} resultado${filtrados.length == 1 ? '' : 's'}',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
                ),
              ),
            ),

          // ── Lista o Grid ──────────────────────────────────────────
          Expanded(
            child: filtrados.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.search_off,
                            size: 56, color: cs.onSurfaceVariant),
                        const SizedBox(height: 12),
                        Text(
                          'Sin resultados para "$_busqueda"',
                          style: TextStyle(color: cs.onSurfaceVariant),
                        ),
                        const SizedBox(height: 8),
                        TextButton(
                          onPressed: () => setState(() => _busqueda = ''),
                          child: const Text('Limpiar búsqueda'),
                        ),
                      ],
                    ),
                  )
                : _modoGrid
                    ? GridView.builder(
                        padding: const EdgeInsets.all(12),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.1,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: filtrados.length,
                        itemBuilder: (ctx, i) => TarjetaProductoGrid(
                          producto: filtrados[i],
                          onDestacado: () => _toggleDestacado(filtrados[i]),
                          onEliminar: () => _eliminar(filtrados[i]),
                        ),
                      )
                    : ListView.separated(
                        itemCount: filtrados.length,
                        separatorBuilder: (_, __) =>
                            const Divider(height: 1, indent: 72),
                        itemBuilder: (ctx, i) => FilaProducto(
                          producto: filtrados[i],
                          onDestacado: () => _toggleDestacado(filtrados[i]),
                          onEliminar: () => _eliminar(filtrados[i]),
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
