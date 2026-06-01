open class Producto(val nombre: String, val precio: Double)

class ProductoOferta(nombre: String, precio: Double, val descuento: Double) : Producto(nombre, precio) {
    fun precioConDescuento(): Double {
        return precio - descuento
    }
}

fun main() {
    val arrozOferta = ProductoOferta("Arroz", 1.25, 0.15)
    println("Precio con descuento: ${arrozOferta.precioConDescuento()}")
}
