// lib/domain/categoria_dto.dart
//
// DTO simple para GET /kache/categorias/ — equivalente didáctico
// de TodoDto en el módulo original.
class CategoriaDto {
  final int id;
  final String nombre;
  final String descripcion;

  const CategoriaDto({
    required this.id,
    required this.nombre,
    required this.descripcion,
  });

  factory CategoriaDto.fromJson(Map<String, dynamic> json) => CategoriaDto(
    id:          json['id_categoria'] as int,
    nombre:      json['nombre']       as String,
    descripcion: json['descripcion']  as String? ?? '',
  );
}
