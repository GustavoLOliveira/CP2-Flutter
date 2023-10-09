import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();
  String sexoSelecionado = "Masculino"; 
  String escolaridadeSelecionada = "Ensino Médio"; 
  double limiteSlider = 500.0; 
  bool brasileiro = true; 

  final List<String> escolaridades = [
    'Ensino Fundamental',
    'Ensino Médio',
    'Graduação',
    'Pós Graduação',
    'Mestrado',
    'Doutorado'
  ];

  void _exibirDados() {
    final String nome = nomeController.text;
    final String idade = idadeController.text;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProfileDetails(
          nome: nome,
          idade: idade,
          sexo: sexoSelecionado,
          escolaridade: escolaridadeSelecionada,
          limite: limiteSlider,
          brasileiro: brasileiro,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Abertura de Conta'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _campo("Nome completo", nomeController),
            _campo("Idade", idadeController),
            _dropdownSexo(),
            _dropdownEscolaridade(),
            _sliderLimite(),
            _switchNacionalidade(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _exibirDados();
              },
              child: Text("Salvar"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _campo(String title, TextEditingController controller) {
    return TextField(
      decoration: InputDecoration(
        labelText: title,
      ),
      controller: controller,
    );
  }

  Widget _dropdownSexo() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Sexo"),
          DropdownButton<String>(
            value: sexoSelecionado,
            items: ['Masculino', 'Feminino'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? valorSelecionado) {
              setState(() {
                sexoSelecionado = valorSelecionado!;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _dropdownEscolaridade() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Escolaridade"),
          DropdownButton<String>(
            value: escolaridadeSelecionada,
            items: escolaridades.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? valorSelecionado) {
              setState(() {
                escolaridadeSelecionada = valorSelecionado!;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _sliderLimite() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Limite"),
          Slider(
            value: limiteSlider,
            min: 0,
            max: 1000,
            divisions: 20,
            label: (limiteSlider > 800)
                ? 'Limite muito alto ($limiteSlider)'
                : limiteSlider.round().toString(),
            onChanged: (double value) {
              setState(() {
                limiteSlider = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _switchNacionalidade() {
    return Container(
      child: Row(
        children: <Widget>[
          Text("Brasileiro?",
              style: TextStyle(fontSize: 20, color: Colors.blue)),
          SizedBox(width: 15),
          Switch(
            value: brasileiro,
            onChanged: (value) {
              setState(() {
                brasileiro = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

class ProfileDetails extends StatelessWidget {
  final String nome;
  final String idade;
  final String sexo;
  final String escolaridade;
  final double limite;
  final bool brasileiro;

  ProfileDetails({
    required this.nome,
    required this.idade,
    required this.sexo,
    required this.escolaridade,
    required this.limite,
    required this.brasileiro,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('Nome completo: $nome'),
            Text('Idade: $idade'),
            Text('Sexo: $sexo'),
            Text('Escolaridade: $escolaridade'),
            Text('Limite: $limite'),
            Text('Nacionalidade: ${brasileiro ? 'Brasileira' : 'Estrangeira'}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Voltar para o Formulário"),
            ),
          ],
        ),
      ),
    );
  }
}
