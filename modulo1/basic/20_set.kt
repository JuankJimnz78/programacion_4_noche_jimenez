// Online Kotlin compiler to run Kotlin program online
// Print "Try programiz.pro" message

fun main() {
    println("Set")
    println("Inmutables")
    val numeros = setOf(1, 2, 3, 4, 5, 1, 3, 8, 6, 7)
    println(numeros)

    println("Operaciones de conjuntos")
    val pares = setOf(2, 4, 6, 8, 10)
    println("pares $pares")

    val impares = setOf(1, 3, 5, 7, 9)
    val multiplos3 = setOf(3, 6, 9, 12)
    println("impares $impares")

    println("union ${impares union pares}")
    println("intersección ${impares intersect pares}")
    println("intersección ${multiplos3 intersect pares}")
    println("sustracción ${impares subtract pares}")
    println("sustracción ${impares subtract multiplos3}")
    println("pares $pares")
    println("impares $impares")

    println("Set mutable")
    val lenguajes = mutableSetOf("kotlin", "java", "reactnative")
    println(lenguajes)
    lenguajes.add("kotlin") // no se duplica
    println(lenguajes)
    lenguajes.add("javascript")
    println(lenguajes)
    lenguajes.remove("java")
    println(lenguajes)
    println("Verificar si un valor existe: ${"kotlin" in lenguajes}")
    println("Verificar si un valor existe: ${"java" in lenguajes}")
}
