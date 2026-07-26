// lib/models/producto_local.dart
//
// Versión simplificada (en memoria, sin JSON) del modelo Producto real de
// PreciosEC, pensada para practicar formularios y listas sin depender
// todavía de la API. Los nombres de campo coinciden con
// lib/domain/model/producto.dart del proyecto principal.
class ProductoLocal {
  final String id;
  final String nombre;
  final String marca;
  final double precioReferencial;
  final String categoria;
  final String unidadMedida;
  bool destacado; // mutable — puede cambiar sin recrear el objeto

  ProductoLocal({
    required this.id,
    required this.nombre,
    required this.marca,
    required this.precioReferencial,
    required this.categoria,
    required this.unidadMedida,
    this.destacado = false,
  });
}
