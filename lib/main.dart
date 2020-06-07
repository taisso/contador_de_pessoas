import 'package:flutter/material.dart';

void main() => runApp(CountInPeople());


class CountInPeople extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador de pessoas',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _infoText = 'Pode Entrar!';
  int _count = 0;


  _onCountAddition(){
    setState(() {
      if(_count <= 10)_count++;
      else _infoText = 'Lotado!';
    });
  }

  _onCountSubtraction(){
    setState(() {
      if(_count > 0)_count--;
      else _infoText = 'Mundo Invertido?!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
        children: <Widget>[
          FractionallySizedBox(
            heightFactor: 1,
            child: Image.asset(
              'images/original.jpg',
              fit: BoxFit.cover,
              height: 1000,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Pessoas: $_count',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: FlatButton(
                      child: Text(
                        '+1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                      onPressed: _onCountAddition,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: FlatButton(
                      child: Text(
                        '-1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                      onPressed: _onCountSubtraction,
                    ),
                  ),
                ],
              ),
              Text(
                _infoText,
                style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
