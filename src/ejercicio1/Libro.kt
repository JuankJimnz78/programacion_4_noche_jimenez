

import mostrarInfo/*Crear una clase Libro con: Título, Autor, Año de publicación, Número de páginas. Debe incluir métodos para: 
Mostrar la información del libro, Indicar si el libro es antiguo o reciente, Condición:Un libro es antiguo si fue publicado antes del año 2000.*/

class Libro(
    val titulo: String,
    val autor : String,
    val anio : Int,
    val paginas: Int
){
    
    fun esAntiguo(): Boolean = anio < 2000
    }
    
    fun mostrarInfo(){
        println("Titulo: $titulo"),
        println("Autor: $autor"),
        println("Año: $anio"),
        println("# de paginas: $paginas")
        println("Estado: ${if (esAntiguo()) "Antiguo" else "Reciente"}")        
}

fun main(){
    val libro1 = Libro("Cien anios de Soledad"", "Garcia Marquez",1967, 432)
    val libro2 = Libro("El problema de los 3 cuerpos", "Liu Cixin", 2008, 400)
    val libro3 = Libro("Don Quijote de la Mancha", "Cervantes", 1605, 863)

    libro1.mostrarInfo()
    libro2.mostrarInfo()
    libro3.mostrarInfo()

}


