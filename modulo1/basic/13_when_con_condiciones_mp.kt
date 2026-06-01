fun main() {
    val precio = 1.25

    when {
        precio < 1.0 -> println("Muy barato")
        precio in 1.0..2.0 -> println("Precio razonable")
        else -> println("Caro")
    }
}
