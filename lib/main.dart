import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Nurettin Selim'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _sonuc = 0;
  final ilkSayi = TextEditingController();
  final ikinciSayi = TextEditingController();

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Uyarı"),
          content: new Text("Eksik sayı girdiniz."),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Tamam"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _topla() {
    setState(() {
      if (ilkSayi.text == "" || ikinciSayi.text == "") {
        _showDialog();
      } else {
        _sonuc = double.parse(ilkSayi.text) + double.parse(ikinciSayi.text);
      }
    });
  }

  _cikar() {
    setState(() {
      if (ilkSayi.text == "" || ikinciSayi.text == "") {
        _showDialog();
      } else {
        _sonuc = double.parse(ilkSayi.text) - double.parse(ikinciSayi.text);
      }
    });
  }

  _carp() {
    setState(() {
      if (ilkSayi.text == "" || ikinciSayi.text == "") {
        _showDialog();
      } else {
        _sonuc = double.parse(ilkSayi.text) * double.parse(ikinciSayi.text);
      }
    });
  }

  _bol() {
    setState(() {
      if (ilkSayi.text == "" || ikinciSayi.text == "") {
        _showDialog();
      } else {
        _sonuc = double.parse(ilkSayi.text) / double.parse(ikinciSayi.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Sonuç',
              ),
              Text(
                '$_sonuc',
                style: Theme.of(context).textTheme.display1,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: ilkSayi,
                        decoration: const InputDecoration(
                          labelText: 'İlk Sayı',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: ikinciSayi,
                        decoration: const InputDecoration(
                          labelText: 'İkinci Sayı',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      ButtonTheme(
                        minWidth: 80.0,
                        height: 80.0,
                        child: RaisedButton(
                          onPressed: _topla,
                          child: Text("+"),
                        ),
                      ),
                      ButtonTheme(
                        minWidth: 80.0,
                        height: 80.0,
                        child: RaisedButton(
                          onPressed: _cikar,
                          child: Text("-"),
                        ),
                      ),
                      ButtonTheme(
                        minWidth: 80.0,
                        height: 80.0,
                        child: RaisedButton(
                          onPressed: _carp,
                          child: Text("*"),
                        ),
                      ),
                      ButtonTheme(
                        minWidth: 80.0,
                        height: 80.0,
                        child: RaisedButton(
                          onPressed: _bol,
                          child: Text("/"),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
