class Supermercado(private val nombre: String) {
    private val productos = mutableListOf<String>()

    fun agregarProducto(producto: String) {
        productos.add(producto)
    }

    fun mostrarProductos() {
        println("Productos en $nombre:")
        for (p in productos) {
            println("- $p")
        }
    }
}

fun main() {
    val supermaxi = Supermercado("Supermaxi")
    supermaxi.agregarProducto("Arroz")
    supermaxi.agregarProducto("Leche")
    supermaxi.mostrarProductos()
}
