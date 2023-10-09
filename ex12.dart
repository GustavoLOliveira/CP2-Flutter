import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Perfil'),
      ),
      drawer: DrawerNavigation(),
      body: Center(
        child: Text('Tela Inicial'),
      ),
    );
  }
}

class DrawerNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Gustavo'),
            accountEmail: Text('rm92927@fiap.com.br'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/84816069?v=4',
              ),
            ),
          ),
          ListTile(
            title: Text('Pessoal'),
            onTap: () {
              Navigator.of(context).pop(); 
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PersonalTab(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Formação'),
            onTap: () {
              Navigator.of(context).pop(); 
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EducationTab(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Experiência'),
            onTap: () {
              Navigator.of(context).pop(); 
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExperienceTab(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class PersonalTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pessoal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nome completo: Gustavo Lopes de Oliveira'),
            Text('Idade: 21 anos'),
            Text('Data de nascimento: 13/01/2002'),
          ],
        ),
      ),
    );
  }
}

class EducationTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formação'),
      ),
      body: Center(
        child: Text(
            'Escolaridade: Graduação em andamento - Sistemas para Internet 2022-2023 FIAP'),
      ),
    );
  }
}

class ExperienceTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Experiência'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Estagiário de desenvolvimento - 04/2023-07/2023 - BNP Soluções em TI'),
            Text('Desenvolvedor Júnior - 08/2023-atual - BNP Soluções em TI'),
          ],
        ),
      ),
    );
  }
}
