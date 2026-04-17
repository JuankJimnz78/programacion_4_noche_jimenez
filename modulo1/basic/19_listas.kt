// Online Kotlin compiler to run Kotlin program online
// Print "Try programiz.pro" message

fun main() {
    println("Listas")
    println("Inmutables")
    val frutas = listOf("manzana", "banana", "cereza", "pera", "piña")
    println(frutas)
    println("Size: ${frutas.size}")
    println("Mostrar el índice 0: ${frutas[0]}")
    println("Mostrar primer elemento: ${frutas.first()}")
    println("Mostrar último elemento: ${frutas.last()}")

    println("Mostrar el elemento índice 2: ${frutas.get(2)}")
    println("Mostrar contenido según índice: ${frutas.indexOf("banana")}")
    println("Verificar existencia de un elemento: ${frutas.contains("piña")}")
    println("Verificar existencia de un elemento: ${"naranja" in frutas}")

    // Sublistas
    println("Sublista: ${frutas.subList(1, 4)}")
    println("Tomar primeros 2 elementos: ${frutas.take(2)}")
    println("Suprimir 3 primeros elementos: ${frutas.drop(3)}")
    println("Tomar los 2 últimos elementos: ${frutas.takeLast(2)}")
    println(frutas)

    println("Mutables")
    val colores = mutableListOf("blanco", "azul", "amarillo", "rojo")
    println(colores)
    colores.add("verde")
    println(colores)
    colores.add(0, "morado")
    println(colores)
    colores.remove("verde")
    println(colores)
    colores[1] = "gris"
    println(colores)

    println("Array Deque")
    val numeros = ArrayDeque<Int>()
    println(numeros)
    numeros.addFirst(1)
    println(numeros)
    numeros.addFirst(3)
    println(numeros)
    numeros.addLast(2)
    println(numeros)
    numeros.removeFirst()
    println(numeros)
    // Aquí estaba el error: faltaba un argumento en addLast
    numeros.addLast(5)
    println(numeros)

    // Llamadas a funciones
    saludar()
    saludarConParametros("Michael")
    val numero1 = 10
    val numero2 = 20
    println("Suma de $numero1 + $numero2 = ${sumar(numero1, numero2)}")

    // Ejemplo de función simplificada
    println("Resta de $numero1 - $numero2 = ${restar(numero1, numero2)}")

    // Ejemplo de función dentro de función
    operacion()

    // Funciones como variables (lambda)
    println("Multiplicación de $numero1 * $numero2 = ${multiplicar(numero1, numero2)}")
}

fun saludar() {
    println("Hola mundo de funciones")
}

fun saludarConParametros(nombre: String) {
    println("Buenas noches $nombre")
}

fun sumar(numero1: Int, numero2: Int): Int {
    return numero1 + numero2
}

// Función simplificada
fun restar(numero1: Int, numero2: Int) = numero1 - numero2

// Función dentro de función
fun operacion() {
    fun cuadrado(x: Int) = x * x
    println("Cuadrado de 5 = ${cuadrado(5)}")
}

// Funciones como variables (lambda)
val multiplicar = { a: Int, b: Int -> a * b }
