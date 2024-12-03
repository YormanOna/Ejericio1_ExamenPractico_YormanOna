
class OperacionesAritmeticas{

  List<String> realizarOperaciones(int x, int y) {
    List<String> resultados = [];

    resultados.add("Suma: ${x + y}");
    resultados.add("Resta: ${x - y}");
    resultados.add("Producto: ${x * y}");
    resultados.add("Division: ${x / y}");
    resultados.add("Modulo: ${x % y}");
    resultados.add("Resta (invertida): ${y - x}");
    resultados.add("División (invertida): ${y / x}");
    resultados.add("Módulo (invertido): ${y % x}");

    return resultados;
  }

}