fun main() {
  println("Control de flujo")
  println("if Simple")
  println("Temperatura corporal")
  val temperatura= readLIne()?.toDoubleOrNull()?:35.5
  if(temperatura>38){
      println("Fiebre detectada")
  }
  if(temperatura>=40){
      println("Fiebre Alta")
  }
  println("Temperatura registrada: $temperatura")
}