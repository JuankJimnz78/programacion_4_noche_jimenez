class Producto {
  String nombre;
  double precio;

  Producto(this.nombre, this.precio);

  void mostrar() {
    print("Producto: $nombre - Precio: \$${precio}");
  }
}

void main() {
  Producto p = Producto("Aceite", 3.50);
  p.mostrar();
}
