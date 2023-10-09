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
      title: Text("Anúncios de instrumentos"),
      centerTitle: true,
      backgroundColor: Colors.green,
    );
  }

  _buildBody() {
    return Container(
      child: PageView(
        scrollDirection: Axis.horizontal, // Define o eixo de rolagem horizontal
        children: <Widget>[
          _buildAdCard(
              'Pandeiro',
              'https://tfcrd2.vteximg.com.br/arquivos/ids/193129-1000-1000/Pandeiro-Gope-11-Polegadas-Profissional-Pele-Cristal-Preto--%7C.jpg?v=637741381617130000',
              'Vende-se Pandeiro com pouco uso!'),
          _buildAdCard(
              'Guitarra',
              'https://m.media-amazon.com/images/I/51LxP0EA2fL._AC_UF894,1000_QL80_.jpg',
              'Vende-se Guitarra com pouco uso!'),
          _buildAdCard(
              'Violão',
              'https://m.media-amazon.com/images/I/51DLmiT01SL._AC_UF894,1000_QL80_.jpg',
              'Vende-se Violão com pouco uso!'),
          _buildAdCard(
              'Banjo',
              'https://harmoniamusical.com.br/media/catalog/product/cache/7c65d8a16c1a9fa15447e0ab5eeb833b/b/a/banjo_rozini_rj14elf.jpg',
              'Vende-se Banjo com pouco uso!'),
        ],
      ),
    );
  }

  _buildAdText(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 20,
      ),
    );
  }

  _buildAdTitle(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.red,
        fontSize: 36,
      ),
    );
  }

  _buildAdCard(String adTitle, String imageUrl, String adText) {
    return Container(
      child: Column(children: <Widget>[
        SizedBox(height: 15),
        _buildAdTitle(adTitle),
        Image.network(
          imageUrl,
          height: 300,
          width: 300,
          fit: BoxFit.contain,
        ),
        _buildAdText(adText),
      ]),
    );
  }
}
