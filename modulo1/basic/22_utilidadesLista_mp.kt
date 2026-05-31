fun main() {
    val precios = listOf(1.25, 0.95, 1.10)

    val precioMinimo = precios.minOrNull()
    val precioMaximo = precios.maxOrNull()
    val promedio = precios.average()

    println("Precio mínimo: $precioMinimo")
    println("Precio máximo: $precioMaximo")
    println("Precio promedio: $promedio")
}
