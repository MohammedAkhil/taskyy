import 'package:flutter_web/material.dart';

import 'main_container.dart';
import 'background.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasky',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(
        title: "Taskyy",
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(

        child: withBackground(),
      ),
    ));
  }

  Widget withBackground() => Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Background(),
          Container(
            alignment: FractionalOffset(0.0, 0.0),
            width: 600,
            height: 700,
            child: MainContainer(),
          )
        ],
      );

  Widget loader() => Center(
        child: CircularProgressIndicator(),
      );

  Widget appBar() => Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 48),
          ),
        ),
      );
}
