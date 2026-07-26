// lib/providers/productos_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../models/producto_local.dart';

// NotifierProvider — estado complejo con métodos propios
class ProductosNotifier extends Notifier<List<ProductoLocal>> {
  @override
  List<ProductoLocal> build() => [
    ProductoLocal(id: '1', nombre: 'Café Nacional 500g', marca: 'Nescafé', precioReferencial: 2.35, categoria: 'Abarrotes', unidadMedida: 'unidad', destacado: true),
    ProductoLocal(id: '2', nombre: 'Arroz Superior 1kg', marca: 'Gustadina', precioReferencial: 1.10, categoria: 'Abarrotes', unidadMedida: 'kilogramos'),
    ProductoLocal(id: '3', nombre: 'Aceite Girasol 1L', marca: 'La Favorita', precioReferencial: 2.89, categoria: 'Abarrotes', unidadMedida: 'litros'),
  ];

  void toggleDestacado(String id) {
    state = state.map((p) =>
        p.id == id
          ? ProductoLocal(id: p.id, nombre: p.nombre, marca: p.marca,
                        precioReferencial: p.precioReferencial, categoria: p.categoria,
                        unidadMedida: p.unidadMedida,
                        destacado: !p.destacado)
          : p
    ).toList();
  }

  void eliminar(String id) {
    state = state.where((p) => p.id != id).toList();
  }

  void agregar(ProductoLocal producto) {
    state = [...state, producto];
  }
}

final productosProvider =
    NotifierProvider<ProductosNotifier, List<ProductoLocal>>(
  ProductosNotifier.new,
);

// Filtro de búsqueda — estado primitivo
final busquedaProvider = StateProvider<String>((ref) => '');

// Provider DERIVADO — se recalcula cuando cualquiera de sus dependencias cambia
final productosFiltradosProvider = Provider<List<ProductoLocal>>((ref) {
  final todos    = ref.watch(productosProvider);
  final busqueda = ref.watch(busquedaProvider);

  if (busqueda.isEmpty) return todos;

  final q = busqueda.toLowerCase();
  return todos.where((p) =>
      p.nombre.toLowerCase().contains(q) || p.marca.toLowerCase().contains(q)
  ).toList();
  // Cuando 'productosProvider' o 'busquedaProvider' cambian,
  // este provider se recalcula automáticamente.
});
