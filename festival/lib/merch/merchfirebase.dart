import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



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
        body: StreamBuilder(
          stream: Firestore.instance.collection('Merchandising').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading...');
            return ListView.builder(
              itemExtent: 100,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context,index) => _product(context,snapshot.data.documents[index]),
            );
          } 
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

  Widget _product(BuildContext context, DocumentSnapshot document) {
    return Card( 
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image.network(
                  document['imagenMerchandising'], 
                  height: 65,
                  width:65
                  ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      document['descripcion'],
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Available: ' + document['unidades'],
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      'Sizes: ' + document['tallasrestantes'],
                      style: TextStyle(fontSize: 12),
                    ),
                  ]
                 
                ),
                
                Text(
                  document['precio'].toString() + '€',
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


