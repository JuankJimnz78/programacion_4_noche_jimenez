import 'producto.dart';

class ProductoDto {
  final int     id;
  final String  name;
  final int     price;
  final bool    isActive;
  final String? categoryName;

  const ProductoDto({
    required this.id,
    required this.name,
    required this.price,
    required this.isActive,
    this.categoryName,
  });

  factory ProductoDto.fromJson(Map<String, dynamic> json) => ProductoDto(
    id:           json['id']            as int,
    name:         json['name']          as String,
    price:        json['price']         as int,
    isActive:     json['is_active']     as bool? ?? false,
    categoryName: (json['category'] as Map<String, dynamic>?)?['name'] as String?,
  );

  Producto toDomain() => Producto(
    id:        id,
    nombre:    name,
    precio:    price.toDouble(),
    activo:    isActive,
    categoria: categoryName,
  );
}