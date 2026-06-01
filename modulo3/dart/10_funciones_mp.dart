double calcularIva(double precio) {
  return precio * 1.12;
}

void main() {
  double precio = 2.50;
  print("Precio con IVA: ${calcularIva(precio)}");
}
