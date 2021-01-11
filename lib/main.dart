
import 'package:flutter/material.dart';

void main () {
  runApp(MaterialApp(
    title: 'Contador de Pessoas',
    home: Home() ));
}

class Home  extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> {

  int _people = 0;
  String _infoText = 'Pode entrar!';
  
  void _changepeople (int delta) {
    setState(() {
      _people += delta;

      if (_people < 0){
        _infoText = 'ERROR: 404';
      } else if (_people >= 10){
        _infoText = ('Ops, lotado! #covid19');
      } else {
        _infoText = 'Pode entrar!';
      }

    }); 
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:<Widget> [
        Image.asset(
          'images/restaurant.jpg',
           fit: BoxFit.cover,
           height: 1000.0,
        ),
        Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        
        Text(
          'Pessoas: $_people',
           style: TextStyle(color: Colors.white,
           fontWeight: FontWeight.bold),
        ),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                child: Text('+1',
                style: TextStyle(fontSize: 40.0, color: Colors.white)),
                onPressed: () {
                  _changepeople(1);
                },
            )),
        
        
            Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                child: Text('-1',
                style: TextStyle(fontSize: 40.0, color: Colors.white)),
                onPressed: () {
                 _changepeople(-1);
                },
            )),
          ],
        ),
        
        Text(
          _infoText,
           style: TextStyle(color: Colors.white,
           fontStyle: FontStyle.italic,
           fontSize: 25.0),
        )
      ],
  )
      ],
    );
  }
}