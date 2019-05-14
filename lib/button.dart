import 'package:flutter_web/material.dart';

class Button extends StatelessWidget {

  final Function onTap;

  Button({@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 150,
        height: 50,
        margin: EdgeInsets.all(8),
        child: FlatButton(
          onPressed: () {
            this.onTap();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                Icons.add_circle,
                size: 20,
                color: Colors.deepPurpleAccent,
              ),
              Text(
                'Add a task',
                style: TextStyle(fontSize: 18, color: Colors.white),
              )
            ],
          ),
          color: Colors.black,
          padding: EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24))),
        ),
      ),
    );
  }
}
