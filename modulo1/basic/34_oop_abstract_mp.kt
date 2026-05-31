abstract class Supermercado(val nombre: String) {
    abstract fun calcularPrecioFinal(precio: Double): Double
}

class Supermaxi : Supermercado("Supermaxi") {
    override fun calcularPrecioFinal(precio: Double): Double {
        return precio * 1.12 // IVA
    }
}

fun main() {
    val supermaxi = Supermaxi()
    println("Precio final en ${supermaxi.nombre}: ${supermaxi.calcularPrecioFinal(1.25)}")
}
