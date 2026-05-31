class Precio(private val producto: String, private var valor: Double) {
    constructor(producto: String) : this(producto, 0.0)

    fun mostrarPrecio() {
        println("Producto: $producto, Precio: $valor")
    }
}

fun main() {
    val arroz = Precio("Arroz", 1.25)
    arroz.mostrarPrecio()

    val leche = Precio("Leche")
    leche.mostrarPrecio()
}
