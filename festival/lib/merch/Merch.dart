import 'package:flutter/material.dart';


class Merch extends StatefulWidget {
  const Merch({
    Key key,
  }) : super(key: key);

  @override
  _MerchState createState() => _MerchState();
}

class _MerchState extends State<Merch> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Merchandising',
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
        body: ListView(
          children: <Widget>[
            product(
              //precio: _merch[0].precio,
              //descripcion: _merch[0].descripcion,
              //imagenMerchandising: _merch[0].imagenMerchandising,
              //unidades: _merch[0].unidades,
              //tallasrestantes: _merch[0].tallasrestantes
            ),
            product(),
            product(),
            product(),
            product(),
            product(),
            product(),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Color.fromRGBO(243, 156, 18, 1),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
    );
  }

  Widget product() {
    return Card( 
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image.network(
                  'https://picsum.photos/250?image=9', 
                  height: 65,
                  width:65
                  ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'GunsnRoses T-shirt',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Available:10',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      'Sizes: M,L,XL',
                      style: TextStyle(fontSize: 15),
                    ),
                  ]
                 
                ),
                
                Text(
                  '19.95€',
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
    );
  }
}


