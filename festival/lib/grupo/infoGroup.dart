import 'package:flutter/material.dart';
import 'package:festival/concierto/concierto.dart';

class InfoGroup extends StatefulWidget {
  final Concierto grupConcert;
  InfoGroup({Key key, this.grupConcert}) : super(key: key);
  @override
  _InfoGroupState createState() => _InfoGroupState();
}

class _InfoGroupState extends State<InfoGroup> {
  bool isPressed;

  @override
  void initState() {
    isPressed = widget.grupConcert.favorito;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Información',
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
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              onPressed: () =>
                  Navigator.of(context).pushNamed('/notifications'),
            )
          ],
        ),
        body: Container(
            color: Color.fromRGBO(243, 156, 18, 1),
            child: Column(
              children: <Widget>[
                Foto(widget.grupConcert.imagenGrupo),
                Informacion(widget.grupConcert),
              ],
            )),
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
                  onPressed: () =>
                      Navigator.of(context).pushNamed('/merchandising'),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.star,
            color: Colors.black,
          ),
          backgroundColor: isPressed ? Colors.yellow : Colors.grey,
          onPressed: () {
            /*setState(() {
              isPressed = !isPressed;
            });*/
          },
        ),
      ),
    );
  }
}

class Foto extends StatelessWidget {
  final String imagenGrupo;
  Foto(this.imagenGrupo);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Container(
          width: 270,
          height: 270,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(5, 5),
                blurRadius: 10.0,
              )
            ],
            image: DecorationImage(
              image: AssetImage(imagenGrupo),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class Informacion extends StatelessWidget {
  final Concierto concierto;
  Informacion(this.concierto);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(50, 25, 25, 25),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      'Artist',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      'Hour',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      'Description',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(35, 4, 4, 4),
                  child: Text(
                    concierto.nombreGrupo,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(35, 4, 4, 4),
                  child: Text(
                    "${concierto.horaFinal} - ${concierto.horaInicio}",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(35, 4, 4, 4),
                  child: Text(concierto.descripcionGrupo,
                      maxLines: 2,
                      style:
                          Theme.of(context).primaryTextTheme.subhead.copyWith(
                                color: Colors.black,
                              ),
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
