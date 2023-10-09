import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _buildAppBar(),
        backgroundColor: Colors.white,
        body: _buildBody(),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: Text("Vagas de TI"),
      centerTitle: true,
      backgroundColor: Colors.green,
    );
  }

  _buildBody() {
    return Container(
      child: ListView(
        children: <Widget>[
          _jobListing('Desenvolvedor Backend',
              'Salário: R\$ 6.000,00. Oportunidade na IBM para trabalhar com Node.js e Prisma em projetos desafiadores. Entre em contato: rh@ibm.com'),
          _jobListing('Engenheiro de Software',
              'Salário: R\$ 8.500,00. Vaga na Google Brasil para atuar no desenvolvimento de aplicativos Android. Contato: recrutamento@google.com'),
          _jobListing('Desenvolvedor Frontend',
              'Salário: R\$ 7.200,00. Oportunidade na Microsoft Brasil para trabalhar com React.js e Angular em soluções inovadoras. Contato: carreiras@microsoft.com'),
          _jobListing('Analista de Dados',
              'Salário: R\$ 6.800,00. Vaga na Amazon Web Services (AWS) para trabalhar com Big Data e análise de dados em nuvem. Contato: awsrecruitment@amazon.com'),
        ],
      ),
    );
  }

  _jobDescription(String description) {
    return Text(
      description,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 20,
      ),
    );
  }

  _jobTitle(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.red,
        fontSize: 28,
      ),
    );
  }

  _jobListing(String jobTitle, String jobDescription) {
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
      child: Column(children: <Widget>[
        SizedBox(height: 15),
        _jobTitle(jobTitle),
        SizedBox(height: 10),
        _jobDescription(jobDescription),
      ]),
    );
  }
}
