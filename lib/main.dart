import 'package:flutter_web/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

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
        body: Stack(
      children: <Widget>[backgroundImage(), appBar()],
    ));
  }

  Widget loader() => Center(
        child: CircularProgressIndicator(),
      );

  Widget appBar() => Container(
        margin: EdgeInsets.only(top: 16, left: 8),
        height: 54,
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 48),
          ),
        ),
      );

  Widget backgroundImage() => FutureBuilder<String>(
        future: getUnsplashImage(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return loader();
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              return Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.8),
                      backgroundBlendMode: BlendMode.colorBurn,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images.unsplash.com/photo-1555920141-738465c260b3?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjcwNzQyfQ"),
                          fit: BoxFit.cover)));
          }
          return null; // unreachable
        },
      );

  Future<String> getUnsplashImage() async {
    String url = "https://api.unsplash.com/photos/random";
    Map<String, String> headers = {
      "authorization":
          "Client-ID 1e2bb9373792637054b9c00073b59a615297e2c07c08fae1d22b0d47fbbc424d"
    };
    try {
      var response = await http.get(
        url,
        headers: headers,
      );
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        return jsonResponse["urls"]["regular"];
      } else {
        return Future.error("Failed");
      }
    } catch (err) {
      print(err);
      return Future.error(err);
    }
  }
}
