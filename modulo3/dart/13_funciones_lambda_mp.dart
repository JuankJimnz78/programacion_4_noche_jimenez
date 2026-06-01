void main() {
  var calcularIva = (double precio) => precio * 1.12;

  double precio = 2.00;
  print("Precio con IVA usando lambda: ${calcularIva(precio)}");
}
