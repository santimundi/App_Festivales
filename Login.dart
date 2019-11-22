import 'package:flutter/material.dart';

void main() => runApp(AppFestival());

class AppFestival extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Festival',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Text(
              'Paskins Fest 2034',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Image(
              image: AssetImage('assets/festi.png'),
            )
          ],
        )
      ),
    );
  }
}
