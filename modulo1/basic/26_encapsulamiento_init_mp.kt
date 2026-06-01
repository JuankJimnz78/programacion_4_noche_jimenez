class Sucursal(private val nombre: String, private val direccion: String) {
    init {
        println("Sucursal creada: $nombre en $direccion")
    }
}

fun main() {
    val sucursal = Sucursal("Supermaxi", "Av. Amazonas y Colón")
}
