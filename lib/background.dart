import 'package:flutter_web/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FutureBuilder<String>(
        future: getUnsplashImage(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  backgroundBlendMode: BlendMode.colorBurn,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1555920141-738465c260b3?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjcwNzQyfQ"),
                      fit: BoxFit.cover)));

//          switch (snapshot.connectionState) {
//            case ConnectionState.none:
//            case ConnectionState.active:
//            case ConnectionState.waiting:
//              return loader();
//            case ConnectionState.done:
//              if (snapshot.hasError) {
//                return Text('Error: ${snapshot.error}');
//              }
//
//          return null; // unreachable
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
