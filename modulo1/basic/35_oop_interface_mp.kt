interface Promocion {
    fun aplicarPromo(precio: Double): Double
}

class Promo2x1 : Promocion {
    override fun aplicarPromo(precio: Double): Double {
        return precio / 2
    }
}

fun main() {
    val promo = Promo2x1()
    println("Precio con promoción 2x1: ${promo.aplicarPromo(2.50)}")
}
