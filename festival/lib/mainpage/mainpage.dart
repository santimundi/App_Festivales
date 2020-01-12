import 'package:flutter/material.dart';

class Mainpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: Text('News'),
        actions: <Widget>[
          Icon(
            Icons.notifications,
            color: Colors.black,
            size: 35,
          ),
        ],
      ),
      //body: _NewsWidget(context),
      bottomNavigationBar: BottomNavigationBar(
       
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today), 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_video), 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart), 
          )
        ],
      ),
    );
  }
}
/*
  Widget _NewsWidget(BuildContext context) {
    return Column(
      children: <Widget>[
        
      ],
    );
  }
}
*/