// lib/repository/producto_repository.dart
//
// Repository simplificado, inspirado en tu
// lib/data/repository/catalog_repository_impl.dart real: separa el
// "cómo se obtienen los datos" (Dio) de "qué hace la UI con ellos".
import 'package:dio/dio.dart';
import '../core/error/api_exception.dart';
import '../data/api/dio_client.dart';
import '../domain/producto.dart';
import '../domain/producto_dto.dart';

class ProductoRepository {
  final Dio _dio = DioClient.instance;

  Future<List<Producto>> listarProductos({String? buscar}) async {
    try {
      final response = await _dio.get('/kache/productos/', queryParameters: {
        if (buscar != null && buscar.isNotEmpty) 'buscar': buscar,
      });
      final data = response.data as Map<String, dynamic>;
      final lista = data['results'] as List<dynamic>;
      return lista
          .map((e) => ProductoDto.fromJson(e as Map<String, dynamic>).toDomain())
          .toList();
    } on DioException catch (e) {
      throw ApiException(
        'No se pudieron cargar los productos.',
        statusCode: e.response?.statusCode,
      );
    }
  }
}
