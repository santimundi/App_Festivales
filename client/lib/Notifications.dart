import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NewCounterState createState() => _NewCounterState();
}

class _NewCounterState extends State<Notifications> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              onSubmitted: (what) {
                Navigator.of(context).pop(what);
              },
            ),
            RaisedButton(
              child: Text('Save'),
              onPressed: () {
                Navigator.of(context).pop(_controller.text);
              },
            )
          ],
        ),
      ),
    );
  }
}
