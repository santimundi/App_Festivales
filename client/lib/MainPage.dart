import 'package:flutter/material.dart';
import 'package:client/Notifications.dart';

class News {
  String noticia;

}

class MainPage extends StatefulWidget {
  const MainPage({
    Key key,
  }) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<MainPage> {
  List<News> _news;

  @override
  void initState() {
    _news = [
      News
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {    
              Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (_) => Notifications(),
                ),
              );
            },
          ),
                   
        ],
      ),
      body: _newsWidget(_news),
    );
  }

  Widget _newsWidget(List<News> _news ) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 1,
        childAspectRatio: 4 / 4,
        children: <Widget>[
          Cuadro(
            text: _news[0],
          ),
        ],
      ),
    );
  }

  Widget Cuadro({String text, int number}) {
    return Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'La noticia es aquesta',
                  style: TextStyle(
                    fontSize: 30,

                  ),
                ),
                SizedBox(height: 40),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
