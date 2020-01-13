import 'package:flutter/material.dart';
import 'merchandising.dart';


class Merch extends StatefulWidget {
  const Merch({
    Key key,
  }) : super(key: key);

  @override
  _MerchState createState() => _MerchState();
}

class _MerchState extends State<Merch> {
  List<Merchandising> _merch;

  @override
  void initState() {
    _merch = [
      Merchandising(),
      Merchandising(),
      Merchandising(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Merchandising'),
        actions: <Widget>[
          IconButton(
            icon: Icon(        
              Icons.notifications,
              color: Colors.black,
              size: 35,
            ),
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
      body: _merchWidget(_merch),
    );
  }

  Widget _merchWidget(List<Merchandising> merch) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 1,
        childAspectRatio: 4 / 4,
        children: <Widget>[
          Product(
            precio: _merch[0].precio,
            descripcion: _merch[0].descripcion,
            imagenMerchandising: _merch[0].imagenMerchandising,
            unidades: _merch[0].unidades,
            tallasrestantes: _merch[0].tallasrestantes
          ),
          Product(
            precio: _merch[1].precio,
            descripcion: _merch[1].descripcion,
            imagenMerchandising: _merch[1].imagenMerchandising,
            unidades: _merch[1].unidades,
            tallasrestantes: _merch[1].tallasrestantes
          ),
          Product(
            precio: _merch[2].precio,
            descripcion: _merch[2].descripcion,
            imagenMerchandising: _merch[2].imagenMerchandising,
            unidades: _merch[2].unidades,
            tallasrestantes: _merch[2].tallasrestantes
          ),
          Product(
            precio: _merch[3].precio,
            descripcion: _merch[3].descripcion,
            imagenMerchandising: _merch[3].imagenMerchandising,
            unidades: _merch[3].unidades,
            tallasrestantes: _merch[3].tallasrestantes
          ),
        ],
      ),
    );
  }

  Widget Product({String text, int number}) {
    return Card(
    
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  '$number',
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
      ),
  }
}





class Foto extends StatefulWidget {
  final String imagenMerchandising;

  Foto(this.imagenMerchandising);

  @override
  _FotoState createState() => _FotoState();
}

class _FotoState extends State<Foto> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Image.network(
        imagenMerchandising,
        widget.imagenMerchandising,
        fit: BoxFit.cover,
      )   
    );
  }
}