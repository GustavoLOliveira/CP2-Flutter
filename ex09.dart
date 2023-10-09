import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TelaConversor();
  }
}

class TelaConversor extends StatefulWidget {
  const TelaConversor({Key? key}) : super(key: key);

  @override
  _TelaConversorState createState() => _TelaConversorState();
}

class _TelaConversorState extends State<TelaConversor> {
  TextEditingController valorController = TextEditingController();

  String moedaOrigem = "Real";
  String moedaDestino = "Dólar";
  String resultado = "";

  void _converter() {
    setState(() {
      double valor = double.parse(valorController.text);
      double valorConvertido = 0.00;

      if ((moedaOrigem == "Real") && (moedaDestino == "Dólar")) {
        valorConvertido = valor * 0.19;
      } else if ((moedaOrigem == "Real") && (moedaDestino == "Euro")) {
        valorConvertido = valor * 0.20;
      } else if ((moedaOrigem == "Dólar") && (moedaDestino == "Real")) {
        valorConvertido = valor * 4.98;
      } else if ((moedaOrigem == "Dólar") && (moedaDestino == "Euro")) {
        valorConvertido = valor * 0.93;
      } else if ((moedaOrigem == "Euro") && (moedaDestino == "Real")) {
        valorConvertido = valor * 5.28;
      } else if ((moedaOrigem == "Euro") && (moedaDestino == "Dólar")) {
        valorConvertido = valor * 1.05;
      }

      resultado = valorConvertido.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Conversor de Moedas"),
          centerTitle: true,
        ),
        body: _body(),
      ),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _campo(),
          SizedBox(height: 16),
          _dropdownDestino(),
          SizedBox(height: 16),
          _dropdownOrigem(),
          SizedBox(height: 30),
          _button(),
          SizedBox(height: 16),
          _texto(),
        ],
      ),
    );
  }

  _texto() {
    return Text(
      resultado,
      style: TextStyle(
        color: Colors.orange,
        fontSize: 28,
      ),
    );
  }

  _button() {
    return ElevatedButton(
      onPressed: () {
        _converter();
      },
      child: Text(
        "Converter",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
    );
  }

  _campo() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Digite um valor',
        labelStyle: TextStyle(color: Colors.blue),
        border: OutlineInputBorder(),
      ),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.orange, fontSize: 25.0),
      controller: valorController,
    );
  }

  _dropdownOrigem() {
    return DropdownButton<String>(
      value: moedaOrigem,
      items: <String>['Real', 'Dólar', 'Euro'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? valorSelecionado) {
        setState(() {
          moedaOrigem = valorSelecionado!;
        });
      },
    );
  }

  _dropdownDestino() {
    return DropdownButton<String>(
      value: moedaDestino,
      items: <String>['Dólar', 'Euro', 'Real'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? valorSelecionado) {
        setState(() {
          moedaDestino = valorSelecionado!;
        });
      },
    );
  }
}
