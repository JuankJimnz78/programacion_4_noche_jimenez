// lib/domain/producto.dart
//
// Versión simplificada del modelo de dominio real
// (lib/domain/model/producto.dart de PreciosEC) para practicar el
// mapeo DTO → Dominio sin arrastrar todos los campos del proyecto principal.
class Producto {
  final int id;
  final String nombre;
  final String marca;
  final String unidadMedida;
  final String? categoria;

  const Producto({
    required this.id,
    required this.nombre,
    required this.marca,
    required this.unidadMedida,
    this.categoria,
  });
}
