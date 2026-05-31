fun main() {
    val categoria = "ALIMENTOS"

    when (categoria) {
        "ALIMENTOS" -> println("Categoría de alimentos")
        "BEBIDAS" -> println("Categoría de bebidas")
        "LIMPIEZA" -> println("Categoría de limpieza")
        else -> println("Categoría desconocida")
    }
}
