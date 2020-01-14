import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({
    Key key,
  }) : super(key: key);
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notifications',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color.fromRGBO(243, 156, 18, 1),
          centerTitle: true,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () => Navigator.pop(context, false),
          ),
        ),
        body: ListView(
        children: <Widget>[
          _note(
              title: 'La llegada al festival de Metallica',
              text: 'La banda estadounidense esta ya estos días en el festival disfrutando de la buena música.' +
                  'Gran cantidad de fans se han acercado a su hotel y ellos han estado esta mañana firmando camisetas.'),
          _note(
              title: 'SoulMala, baja de última hora',
              text: 'La banda de dancehall no acudirá a esta edición del festival debido a problemas personales de' +
                  'su líder y cantante Karl Mayer. El conjunto se esta viendo obligado a anular los proximos conciertos de la gira.'),
          _note(
              title: 'Nuevas camisetas de The Extrepits',
              text: 'Los irlandeses llegan al festival con nuevo merchandising de estreno para la ocasión.' +
                  'Sus nuevas camisetas estaran disponibles en todos los puntos de venta del festival.'),
          _note(
              title: 'El tiempo nos respeta',
              text: 'Parece que de momento la previsión metereológica para los días del festival será favorable.' +
                  'Tendremos sol gran parte del día con algunas nubes durante la tarde del segundo día.'),
          _note(
              title: 'Documental de la nueva edición',
              text: 'Como ya es de costumbre durante los días del festival se grabará un vídeo resumen de la experiencia' +
                  'de los asistentes. Estara disponible la semana siguiente al festival en nuestra pagina web.'),
        ],
      ),
        bottomNavigationBar: BottomAppBar(
          color: Color.fromRGBO(243, 156, 18, 1),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: IconButton(
                  iconSize: 32.0,
                  icon: Icon(Icons.home),
                  onPressed: () => Navigator.of(context).pushNamed('/mainPage'),
                ),
              ),
              IconButton(
                icon: Icon(Icons.calendar_today),
                iconSize: 26.0,
                onPressed: () => Navigator.of(context).pushNamed('/calendar'),
              ),
              IconButton(
                icon: Icon(Icons.music_note),
                iconSize: 29.0,
                onPressed: () => Navigator.of(context).pushNamed('/days'),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  iconSize: 28.0,
                  onPressed: () => Navigator.of(context).pushNamed('/merchandising'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _note({String title, String text}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 0, 12),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 100,
                      width: 320,
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ]),
              IconButton(
                alignment: Alignment.topRight,
                icon: Icon(Icons.clear),
                color: Colors.black,
                onPressed: () => Navigator.of(context).pushNamed('/stages'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}