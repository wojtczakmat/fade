import 'package:fade/fade.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fade Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => setState(() => visible = !visible),
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                color: Colors.blue,
              ),
              Fade(
                visible: visible,
                duration: Duration(milliseconds: 500),
                child: Container(
                  height: 200,
                  color: Colors.green,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 50,
                          width: 50,
                          margin: const EdgeInsets.all(16),
                          color: Colors.red,
                        ),
                        Fade(
                          duration: Duration(milliseconds: 200),
                          visible: visible,
                          child: Text(
                            'Bardzo fajny tytuł',
                            style: TextStyle(
                              fontSize: 40,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 200,
                color: Colors.red,
              ),
              Container(
                height: 200,
                color: Colors.orange,
              )
            ],
          ),
        ),
      ),
    );
  }
}
