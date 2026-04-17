fun main() {
  println("If anidado")
  println("El paciente tiene antecedentes cardiacos? s/n")
  val tieneAntecedente = readLine()?.trim()?.lowerscase=="s"
  println("frecuencia cardiaca lpm")
  val frecuencia = = readLine()?.toIntOrNull():0
  if(tieneAntecedente){
    println("Paciente con antecedentes cardiacos")
    if(frecuencia<50){
        println("Bradicardia")
          
      }else if(frecuencia>100){
        println("Taquicardia")
      
      }else {
        println("Frecuencia dentro del rango")
      }
  }else {
      println("Paciente sin antecedentes cardiacos")
      if(frecuencia <60 || frecuencia >100){
        println("Frecuencia fuera de lo normal")
      }else{
        println("freciencia cardiaca normal")
      }
  }
}