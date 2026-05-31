fun calcularDiferencia(precio1: Double, precio2: Double): Double {
    return precio1 - precio2
}

fun main() {
    val diferencia = calcularDiferencia(1.25, 1.10)
    println("La diferencia es: $diferencia")
}
