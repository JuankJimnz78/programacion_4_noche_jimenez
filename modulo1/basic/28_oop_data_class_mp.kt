// Data class para representar un producto en Kache1.1
data class Producto(val nombre: String, val precio: Double, val supermercado: String)

fun main() {
    val arroz = Producto("Arroz", 1.25, "Supermaxi")
    val leche = Producto("Leche", 0.95, "Tía")

    println(arroz)
    println(leche)
}
