void main() {
  String precioTexto = "2.50";
  double precio = double.parse(precioTexto);

  print("Precio convertido: $precio");
  print("Precio + IVA (12%): ${precio * 1.12}");
}
