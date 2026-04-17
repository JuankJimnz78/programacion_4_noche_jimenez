fun main() {
    println("Condicional When")
    println("Código de especialidad? (1-7)")
    val codigo = readLine()?.toIntOrNull() ?: 0

    println("1 -> Medicina General")
    println("2 -> Pediatría")
    println("3 -> Cardiología")
    println("4 -> Ginecología")
    println("5 -> Traumatología")
    println("6 -> Neurología")
    println("7 -> Dermatología")

    val especialidad = when (codigo) {
        1 -> "Medicina General"
        2 -> "Pediatría"
        3 -> "Cardiología"
        4 -> "Ginecología"
        5 -> "Traumatología"
        6 -> "Neurología"
        7 -> "Dermatología"
        else -> "Código inválido"
    }

    println("Especialidad: $especialidad")
}
