import 'package:flutter/material.dart';

class Timeline extends StatefulWidget {
  const Timeline({
    Key key,
  }) : super(key: key);

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Timeline',
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
            onPressed: () => Navigator.of(context).pushNamed('/notifications'),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          _selector(),
          _product(),
          _product(),
          _product(),
          _product(),
          _product(),
          _product(),
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
                onPressed: () =>
                    Navigator.of(context).pushNamed('/merchandising'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _product() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                '10:30 - 11:30',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(width: 50),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'GunsnRoses',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(243, 156, 18, 1),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Main Stage',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _selector() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.black,
                onPressed: () => Navigator.pop(context, false),
              ),
              Text(
                'Wednesday',
                style: TextStyle(fontSize: 30),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                color: Colors.black,
                onPressed: () => Navigator.pop(context, false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
