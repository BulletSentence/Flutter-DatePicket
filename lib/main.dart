import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(body1: TextStyle(fontSize: 21))
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _dateTime == null ? "" : _dateTime.toString(),
            ),
            RaisedButton (
              child: Text ("Escolher Data"),
              onPressed: () {
                showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    // a data aceitável será a DATA ATUAL ou POSTERIOR
                    firstDate: (DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)),
                    // a ultima data aceitável será 6 meses da data atual
                    lastDate: DateTime(DateTime.now().year, DateTime.now().month+5),
                ).then((date){
                  setState(() {
                    _dateTime = date;
                  });
                },);
              },
            ),
          ],
        ),
      )
    );
  }
}