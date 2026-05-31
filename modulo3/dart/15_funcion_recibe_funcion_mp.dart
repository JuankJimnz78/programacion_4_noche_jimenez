void ejecutarOperacion(double precio, double Function(double) operacion) {
  print("Resultado: ${operacion(precio)}");
}

void main() {
  ejecutarOperacion(3.50, (p) => p * 1.12); // IVA
  ejecutarOperacion(3.50, (p) => p * 0.85); // Descuento
}
