class Producto(private val nombre: String, precioInicial: Double) {

    var precio: Double = precioInicial

    fun mostrarInfo() {
        println("Producto: $nombre, Precio: $precio")
    }

    fun actualizarPrecio(nuevoPrecio: Double) {
        if (nuevoPrecio > 0) {
            precio = nuevoPrecio
            println("Precio actualizado a $precio")
        } else {
            println("Precio inválido")
        }
    }
}

fun main() {
    val arroz = Producto("Arroz", 1.25)
    arroz.mostrarInfo()

    arroz.actualizarPrecio(1.10)
    println("El nuevo precio consultado es: ${arroz.precio}")
}
