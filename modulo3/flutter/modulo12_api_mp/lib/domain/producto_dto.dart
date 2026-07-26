// lib/domain/producto_dto.dart
//
// DTO que refleja el JSON REAL que devuelve tu backend Django
// en GET /kache/productos/ (ver lib/domain/model/producto.dart y
// lib/data/remote/dto/product_dto.dart del proyecto principal).
import 'producto.dart';

class ProductoDto {
  final int id;
  final String nombre;
  final String marca;
  final String unidadMedida;
  final String? categoriaNombre;

  const ProductoDto({
    required this.id,
    required this.nombre,
    required this.marca,
    required this.unidadMedida,
    this.categoriaNombre,
  });

  factory ProductoDto.fromJson(Map<String, dynamic> json) => ProductoDto(
    id:              json['id_producto']   as int,
    nombre:          json['nombre']        as String,
    marca:           json['marca']         as String,
    unidadMedida:    json['unidad_medida'] as String,
    categoriaNombre: (json['categoria_detalle'] as Map<String, dynamic>?)
        ?['nombre'] as String?,
  );

  Producto toDomain() => Producto(
    id:           id,
    nombre:       nombre,
    marca:        marca,
    unidadMedida: unidadMedida,
    categoria:    categoriaNombre,
  );
}
