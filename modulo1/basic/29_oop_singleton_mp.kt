// Singleton para configuración global de Kache1.1
object Configuracion {
    val baseDatos = "kache1.1_db"
    val usuario = "juank_user"

    fun mostrarConfig() {
        println("Conectando a la base: $baseDatos con usuario $usuario")
    }
}

fun main() {
    Configuracion.mostrarConfig()
}
