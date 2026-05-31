fun main() {
    val precios = mapOf(
        "Arroz" to 1.25,
        "Leche" to 0.95,
        "Azúcar" to 1.10
    )

    println("Precios de productos:")
    for ((producto, precio) in precios) {
        println("$producto cuesta $precio")
    }
}
