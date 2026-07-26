// lib/providers/productos_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/producto.dart';
import '../repository/producto_repository.dart';

final productoRepositoryProvider = Provider((ref) => ProductoRepository());

// AsyncNotifierProvider — expone loading / error / data automáticamente,
// tal como lo hacen tus providers reales en presentation/providers/admin/.
class ProductosNotifier extends AsyncNotifier<List<Producto>> {
  @override
  Future<List<Producto>> build() {
    return ref.read(productoRepositoryProvider).listarProductos();
  }

  Future<void> buscar(String texto) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(productoRepositoryProvider).listarProductos(buscar: texto),
    );
  }

  Future<void> recargar() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(productoRepositoryProvider).listarProductos(),
    );
  }
}

final productosProvider =
    AsyncNotifierProvider<ProductosNotifier, List<Producto>>(
  ProductosNotifier.new,
);
