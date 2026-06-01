void main() {
  List<String> productos = ["Arroz", "Leche", "Azúcar", "Aceite"];

  for (var producto in productos) {
    if (producto == "Azúcar") {
      print("Producto encontrado: $producto");
      break;
    }
    print("Revisando: $producto");
  }
}
