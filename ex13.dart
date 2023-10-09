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
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    PersonalTab(),
    EducationTab(),
    ExperienceTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu perfil'),
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Pessoal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Formação',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Experiência',
          ),
        ],
      ),
    );
  }
}

class PersonalTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(
              'https://avatars.githubusercontent.com/u/84816069?v=4',
            ),
          ),
          SizedBox(height: 20),
          Text('Nome completo: Gustavo Lopes de Oliveira'),
          Text('Idade: 21 anos'),
          Text('Data de nascimento: 13/01/2002'),
        ],
      ),
    );
  }
}

class EducationTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Escolaridade: Graduação em andamento - Sistemas para Internet 2022-2023 FIAP',
        textAlign: TextAlign.center,
      ),
    );
  }
}

class ExperienceTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              'Estagiário de desenvolvimento - 04/2023-07/2023 - BNP Soluções em TI'),
          Text('Desenvolvedor Júnior - 08/2023-atual - BNP Soluções em TI'),
        ],
      ),
    );
  }
}
