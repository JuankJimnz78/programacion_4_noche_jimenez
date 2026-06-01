fun main() {
    val precios = listOf(1.25, 0.95, 1.10)

    val preciosFiltrados = precios.filter { it < 1.20 }
    println("Precios menores a 1.20: $preciosFiltrados")

    val preciosConIVA = precios.map { it * 1.15 }
    println("Precios con IVA: $preciosConIVA")
}
