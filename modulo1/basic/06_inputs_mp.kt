fun main() {
    println("Ingrese el nombre del producto:")
    val producto = readLine()

    println("Ingrese el precio:")
    val precio = readLine()?.toDoubleOrNull() ?: 0.0

    println("Ingrese el supermercado:")
    val supermercado = readLine()

    println("Producto: $producto, Precio: $precio, Supermercado: $supermercado")
}
