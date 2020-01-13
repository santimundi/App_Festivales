import 'package:flutter/material.dart';
import 'package:festival/concierto/concierto.dart';
//import 'grupo.dart';

class InfoGroup extends StatelessWidget {
  //final Concierto concierto = linkinparkconcierto;
  //final Grupo grupo = linkinparkgrupo;

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
                //Iconos(),
                Foto(/*grupo*/),
                Informacion(/*concierto, grupo*/),
                //NavBar()
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
                onPressed: () => Navigator.of(context).pushNamed('/stages'),
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
}
/*
class Iconos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, right: 20, left: 20, bottom: 20),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          Expanded(
            child: Text(
              'Información',
              style: TextStyle(
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Icon(
            Icons.notifications,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
*/
class Foto extends StatelessWidget {
  //final Grupo grupo;

  //Foto(this.grupo);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Container(
          width: 450,
          height: 270,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(5, 5),
                blurRadius: 10.0,
              )
            ],
            image: DecorationImage(
              image: AssetImage('assets/LP.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class Informacion extends StatelessWidget {
  //final Grupo grupo;
  // final Concierto concierto;

  //Informacion(this.grupo, this.concierto);

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
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      'Genre',
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
                      'Stage',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
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
                      'Day',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      'Duration',
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(35, 4, 4, 4),
                    child: Text(
                      'Artist',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ), 
                  Padding(
                    padding: EdgeInsets.fromLTRB(35, 4, 4, 4),
                    child: Text(
                      'Genre',
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
                      'Stage',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(35, 4, 4, 4),
                    child: Text(
                      'Hour',
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
                      'Day',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(35, 4, 4, 4),
                    child: Text(
                      'Duration',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
