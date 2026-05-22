//funcion sin parametros y sin retorno
void saludar(){
  print('Hola mundo');
}

//funcion con parametros y sin retorno
void saludoConParametro(String nombre){
  print('Hola $nombre');
}

//funcion sin parametros y con retorno
int obtenerNumero(){
  return 10;
}

//funcion con parametro y con retorno
int sumar(int a , int b){
  return a+b;
}

//funcion flecha (arrow function)
int multiplicar(int a, int b)=>a*b;

//funcion con parametros opcionales

void saludarOpcional(String nombre,[String apellido='Sin apellido']){
  print("Hola $nombre $apellido");
}

//funcion con parametros nombrados
void registroUsuario({
  required String nombre,
  required int edad,
}){
  print("Hola $nombre edad $edad");
}

// Dart puede inferir el tipo de retorno, pero es buena práctica declararlo
// explícitamente en funciones públicas para mejorar la legibilidad.

// Con tipo explícito — recomendado
String formatearPrecio(double precio) => '\$${precio.toStringAsFixed(2)}';

// Sin tipo — Dart infiere que retorna String
formatearPrecioSinTipo(double precio) => '\$${precio.toStringAsFixed(2)}';

void main() {
  print(formatearPrecio(1299.9));  // $1299.90
}
void main(){
  saludar();
  saludoConParametro('Pedro Perez');
  int numero = obtenerNumero();
  print(numero);
  print('El numero es: ${obtenerNumero()}');
  print('La suma : ${sumar(5,5)}');
  print('La multiplicacion : ${multiplicar(5,5)}');
  saludarOpcional('fran','Jimenez');
  saludarOpcional('Juan');
  registroCliente(
    nombre: 'Ana',
    edad: 22,
  );
  
}