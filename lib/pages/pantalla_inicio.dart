import 'package:ejercicio_1_examenpractico_u1/pages/pantalla_calculo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../logica/calcular_operador.dart';

class PantallaInicio extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => PantallaInicioState();

}

class PantallaInicioState extends State<PantallaInicio> {
  //Logica
  final TextEditingController _controllerValor1 = TextEditingController();
  final TextEditingController _controllerValor2 = TextEditingController();

  String? _errorValor1;
  String? _errorValor2;

  void validarEnviar(){
    setState(() {
      _errorValor1 = _validarEntero(_controllerValor1.text);
      _errorValor2 = _validarEntero(_controllerValor2.text);
    });

    if(_errorValor1 == null && _errorValor2 == null){
      int valor1 = int.parse(_controllerValor1.text);
      int valor2 = int.parse(_controllerValor2.text);
      List<String> resultados = OperacionesAritmeticas().realizarOperaciones(valor1, valor2);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CalcularPage(resultados: resultados)),
      );
    }
  }

  String? _validarEntero(String value) {
    if (value.isEmpty) {
      return 'Por favor ingrese un valor';
    }
    final n = int.tryParse(value);
    if (n == null) {
      return 'Por favor ingrese un número entero';
    }
    return null;
  }



  //Diseño
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Operaciones Aritméticas'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(
              Icons.calculate,
              size: 100,
              color: Colors.deepPurple,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _controllerValor1,
              decoration: InputDecoration(
                labelText: 'Ingrese el primer valor',
                errorText: _errorValor1,
                prefixIcon: Icon(Icons.input),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.deepPurple),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _controllerValor2,
              decoration: InputDecoration(
                labelText: 'Ingrese el segundo valor',
                errorText: _errorValor2,
                prefixIcon: Icon(Icons.input),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.deepPurple),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: validarEnviar,
              icon: Icon(Icons.calculate),
              label: Text('Calcular'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.deepPurple,
                textStyle: TextStyle(fontSize: 18),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}