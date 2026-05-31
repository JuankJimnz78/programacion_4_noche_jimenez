import 'dart:io';

void main() {
  stdout.write("Ingrese el nombre del producto: ");
  String? producto = stdin.readLineSync();

  stdout.write("Ingrese el precio: ");
  String? precioTexto = stdin.readLineSync();
  double precio = double.parse(precioTexto!);

  print("Producto: $producto con precio \$${precio}");
}
