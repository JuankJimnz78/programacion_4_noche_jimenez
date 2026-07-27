// lib/models/producto_local.dart
//
// Versión simplificada del modelo Producto real de PreciosEC
// (ver lib/domain/model/producto.dart del proyecto principal),
// usada aquí para practicar go_router sin depender de la API todavía.
class ProductoLocal {
  final String id;
  final String nombre;
  final String marca;
  final double precioReferencial;
  final bool   enOferta;

  ProductoLocal({
    required this.id,
    required this.nombre,
    required this.marca,
    required this.precioReferencial,
    required this.enOferta,
  });
}

// Lista simulada — usada por las pantallas de detalle y filtro
// mientras no se conecta el módulo de API (ver modulo12_api_mp).
final productosSimulados = [
  ProductoLocal(id: '1', nombre: 'Café Nacional 500g', marca: 'Nescafé', precioReferencial: 2.35, enOferta: true),
  ProductoLocal(id: '2', nombre: 'Arroz Superior 1kg', marca: 'Gustadina', precioReferencial: 1.10, enOferta: false),
  ProductoLocal(id: '3', nombre: 'Aceite Girasol 1L', marca: 'La Favorita', precioReferencial: 2.89, enOferta: true),
];
