//declaracion variables
2
fun main(){
3
    //val inmutable
4
    val nombre="Ana"
5
    val edad: Int =28 
6
    //var mutable
7
    var contador = 0
8
    contador = contador + 1 
9
    println("$nombre tiene $edad años")
10
    
11
    //tipo de datos
12
    val numero1: Byte = 127 
13
    val numero2: Short = 32_767 
14
    val numero3: Int = 12 
15
    val numero4: Long = 2_222_222_333_222_233 
16
    
17
    println(numero1)
18
    println(numero2)
19
    println(numero3)
20
    println(numero4)
21
    
22
    //numeros decimales
23
    val numero5: Float = 3.14f 
24
    val numero6: Double = 3.14159265 
25
    
26
    val booleano: Boolean = true 
27
    //Caracteres
28
    val caracter: Char = 'k' 
29
    val cadena: String = "Kotlin" 
30
    val inferido = "string" 
31
    println("tipo de inferido: ${inferido::class.simpleName}") 
32
    val inferido1 = 12 
33
    println("tipo de inferido: ${inferido1::class.simpleName}") 
34
    
35
    //Utilidades de string
36
    //Expresiones
37
    val primerNombre = "Pedro" 
38
    val primerApellido = "Perez" 
39
    val primerNombreMayuscula=primerNombre.uppercase() 
40
    val primerApellidoMayuscula=primerApellido.uppercase() 
41
    println("Nombre Completo: ${primerNombreMayuscula} ${primerApellidoMayuscula}") 
42
    println(Nombre Completo: ${primerNombre.uppercase()} ${primerApellido.uppercase()}) 
43
    
44
}