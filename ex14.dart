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

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu perfil'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Pessoal'),
            Tab(text: 'Formação'),
            Tab(text: 'Experiência'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          PersonalTab(),
          EducationTab(),
          ExperienceTab(),
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
