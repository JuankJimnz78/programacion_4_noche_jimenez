// lib/main.dart
import 'package:flutter/material.dart';
import 'package:modulo09_formularios_mp/models/producto_local.dart';
import 'package:modulo09_formularios_mp/screens/pantalla_busqueda.dart';
import 'package:modulo09_formularios_mp/widgets/fila_producto.dart';
import 'widgets/formulario_producto.dart';
import 'screens/pantalla_productos.dart';
import 'widgets/tarjeta_producto_grid.dart';
// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1  TextField + TextEditingController + FocusNode       │
// │  2  Paso 2  Form + TextFormField + validación                   │
// │  3  Paso 3  Modelo + ListView.builder + ListTile acciones       │
// │  4  Paso 4  GridView.builder + toggle lista/grid                │
// │  5  Paso 5  SearchBar + filtrado en tiempo real                 │
// └──────────────────────────────────────────────────────────────────┘
const int paso = 5;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1B5E20),
    ),
    useMaterial3: true,
  ),
  home: switch (paso) {
    1 => const _Paso1(),
    2 => const _Paso2(),
    3 => const _Paso3(),
    4 => const PantallaProductos(),
    5 => const PantallaBusqueda(),
    _ => Scaffold(
        body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },
));

// ─── Paso 1 — vive en main.dart ────────────────────────────────────────
class _Paso1 extends StatefulWidget {
  const _Paso1();
  @override
  State<_Paso1> createState() => _Paso1State();
}

class _Paso1State extends State<_Paso1> {
  final _ctrlNombre = TextEditingController();
  final _ctrlMarca  = TextEditingController();
  final _ctrlPrecio = TextEditingController(text: '0.00');
  final _ctrlCategoria = TextEditingController();
  final _focusMarca = FocusNode();
  final _focusPrecio = FocusNode();

  @override
  void dispose() {
    _ctrlNombre.dispose();
    _ctrlMarca.dispose();
    _ctrlPrecio.dispose();
    _ctrlCategoria.dispose();
    _focusMarca.dispose();
    _focusPrecio.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar producto'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _ctrlNombre,
              decoration: const InputDecoration(
                labelText: 'Nombre del producto',
                hintText: 'Café Nacional 500g',
                prefixIcon: Icon(Icons.inventory_2),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => _focusMarca.requestFocus(),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _ctrlMarca,
              focusNode: _focusMarca,
              decoration: const InputDecoration(
                labelText: 'Marca',
                hintText: 'Nescafé',
                prefixIcon: Icon(Icons.local_offer_outlined),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => _focusPrecio.requestFocus(),
            ),

            const SizedBox(height: 12),
            TextField(
              controller: _ctrlCategoria,
              decoration: const InputDecoration(
                labelText: 'Categoría',
                hintText: 'Abarrotes',
                prefixIcon: Icon(Icons.category_outlined),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => _focusPrecio.requestFocus(),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _ctrlPrecio,
              focusNode: _focusPrecio,
              decoration: const InputDecoration(
                labelText: 'Precio referencial',
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(),
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => FocusScope.of(context).unfocus(),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () {
                FocusScope.of(context).unfocus();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Buscando ${_ctrlNombre.text} '
                      '(${_ctrlMarca.text} · \$${_ctrlPrecio.text})',
                    ),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              icon: const Icon(Icons.search),
              label: const Text('Buscar'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {
                _ctrlNombre.clear();
                _ctrlMarca.clear();
                _ctrlPrecio.text = '0.00';
                _ctrlCategoria.clear();
              },
              child: const Text('Limpiar campos'),
            ),
          ],
        ),
      ),
    );
  }
}

class _Paso2 extends StatelessWidget {
  const _Paso2();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo producto'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: FormularioProducto(
          onGuardar: (datos) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'Guardado: ${datos['nombre']} — ${datos['marca']} · \$${datos['precio']}'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Paso3 extends StatefulWidget {
  const _Paso3();
  @override
  State<_Paso3> createState() => _Paso3State();
}

class _Paso3State extends State<_Paso3> {
  final _productos = [
    ProductoLocal(id: '1', nombre: 'Café Nacional 500g', marca: 'Nescafé', precioReferencial: 2.35, categoria: 'Abarrotes', unidadMedida: 'unidad', destacado: true),
    ProductoLocal(id: '2', nombre: 'Arroz Superior 1kg', marca: 'Gustadina', precioReferencial: 1.10, categoria: 'Abarrotes', unidadMedida: 'kilogramos'),
    ProductoLocal(id: '3', nombre: 'Aceite Girasol 1L', marca: 'La Favorita', precioReferencial: 2.89, categoria: 'Abarrotes', unidadMedida: 'litros'),
    ProductoLocal(id: '4', nombre: 'Leche Entera 1L', marca: 'Toni', precioReferencial: 0.95, categoria: 'Lácteos', unidadMedida: 'litros'),
    ProductoLocal(id: '5', nombre: 'Detergente 2kg', marca: 'Deja', precioReferencial: 4.20, categoria: 'Limpieza', unidadMedida: 'kilogramos'),
  ];

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Productos (${_productos.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: _productos.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.inventory_2_outlined, size: 56, color: cs.onSurfaceVariant),
                  const SizedBox(height: 12),
                  Text('Sin productos',
                      style: TextStyle(color: cs.onSurfaceVariant)),
                ],
              ),
            )
          : ListView.separated(
              itemCount: _productos.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) => FilaProducto(
                producto: _productos[i],
                onDestacado: () => setState(() =>
                    _productos[i].destacado = !_productos[i].destacado),
                onEliminar: () => setState(() => _productos.removeAt(i)),
              ),
            ),
    );
  }
}
