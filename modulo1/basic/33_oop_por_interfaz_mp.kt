interface Descuento {
    fun aplicarDescuento(precio: Double): Double
}

class DescuentoFijo : Descuento {
    override fun aplicarDescuento(precio: Double): Double {
        return precio - 0.10
    }
}

fun main() {
    val descuento = DescuentoFijo()
    val precioFinal = descuento.aplicarDescuento(1.25)
    println("Precio final con descuento: $precioFinal")
}
