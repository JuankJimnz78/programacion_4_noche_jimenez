interface DescuentoA {
    fun aplicar(precio: Double): Double {
        return precio - 0.10
    }
}

interface DescuentoB {
    fun aplicar(precio: Double): Double {
        return precio * 0.90
    }
}

class ProductoConConflicto : DescuentoA, DescuentoB {
    override fun aplicar(precio: Double): Double {
        // Resolver conflicto eligiendo una implementación
        return super<DescuentoB>.aplicar(precio)
    }
}

fun main() {
    val producto = ProductoConConflicto()
    println("Precio con descuento: ${producto.aplicar(1.25)}")
}
