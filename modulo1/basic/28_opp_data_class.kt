
data class Producto(
    val id: Int,
    val name: String, 
    val precio: Double,
    val categoria: String,
    val activo: Boolean = true
)

fun main() {
    val p1 = Producto(1, "Laptop", 999.99, "Electrónica")
    val p2 = Producto(2, "Smartphone", 499.99, "Electrónica", activo = false)

    println(p1)  // Producto(id=1, name=Laptop, precio=999.99, categoria=Electrónica, activo=true)
    println(p2)  // Producto(id=2, name=Smartphone, precio=499.99, categoria=Electrónica, activo=false)

    // Copiar un producto con modificaciones
    val p3 = p1.copy(id = 3, name = "Tablet")
    println(p3)  // Producto(id=3, name=Tablet, precio=999.99, categoria=Electrónica, activo=true)
}