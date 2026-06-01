void mostrarProducto(String nombre, {double precio = 1.0}) {
  print("Producto: $nombre con precio \$${precio}");
}

void main() {
  mostrarProducto("Arroz");
  mostrarProducto("Leche", precio: 1.25);
}
