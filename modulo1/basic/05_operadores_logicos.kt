fun main() {
  println("Operadores Logicos")
  val esMayor = true
  val tienePermiso=false
  val estaActivo=true
  val mayorEdad=false
  
  println("Operadoe And &&")
  println("$esMayor && $tienePermiso ${esMayor&&tienePermiso}")
  println("$esMayor && $estaActivo ${esMayor&&estaActivo}")
  
  println("Or Logico ||")
  println("$esMayor || $tienePermiso ${esMayor||tienePermiso}")
  println("$esMayor || $estaActivo ${esMayor||estaActivo}")
  println("$mayorEdad || $tienePermiso ${mayorEdad||tienePermiso}")
  println("$esMayor || $tienePermiso || estaActivo ${esMayor || tienePermiso || estaActivo}")
  
  println("Not Logico")
  println("! $esMayor ${!esMayor}")
  println("! $mayorEdad ${!mayorEdad}")
 
  
}