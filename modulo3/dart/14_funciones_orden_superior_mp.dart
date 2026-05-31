double aplicarDescuento(double precio, double Function(double) descuento) {
  return descuento(precio);
}

void main() {
  double precio = 5.00;

  double resultado = aplicarDescuento(precio, (p) => p * 0.90);
  print("Precio con descuento aplicado: $resultado");
}
