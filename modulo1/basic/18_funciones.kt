// Online Kotlin compiler to run Kotlin program online
// Print "Try programiz.pro" message

fun main() {
    saludar()
    saludarConParametros("Michael")
    val numero1=10
    val numero2=20
    
  println("Suma de $numero1 + $numero2 = ${sumar(numero1, numero2)}")
  
}

fun saludar(){
    println("Hola mundo de funciones")
}

fun saludarConParametros(nombre: String){
    println("Buenas noches $nombre")
}

fun sumar(numero1: Int, numero2: Int):Int{
    return numero1 + numero2
}

// Funcion simplificada
fun restar(numero1: Int, numero2: Int)= numero1 - numero2


// funcion dentro de funcion
fun operacion(){
    fun cuadrado(x: Int)=x*x
    println(cuadrado(5))
}

// Funciones como variables
val multiplicar={a: Int, b: Int-> a*b}