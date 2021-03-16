import 'package:custom_flutter_widgets/widgets/DownButton.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Container(
      width: screen.width,
      height: screen.height,
      color: Color.lerp(Colors.black, Colors.white, 0.2),
      child: SafeArea(
          child: Column(
        children: [
          DownButton(
            width: 100.0,
            height: 100.0,
            elevation: 10.0,
            color: Colors.amber,
            borderRadius: BorderRadius.circular(10.0),
            onPressed: () {
              print("onPressed");
            },
            onLongPressed: () {
              print("onLongPressed");
            },
            child: Icon(Icons.add_circle),
          ),
          DownButton(
            width: 300.0,
            height: 100.0,
            elevation: 10.0,
            color: Colors.greenAccent,
            borderRadius: BorderRadius.circular(10.0),
            onPressed: () {
              print("onPressed");
            },
            onLongPressed: () {
              print("onLongPressed");
            },
            child: Center(
              child: Text(
                "Button",
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
          DownButton(
            width: 40.0,
            height: 40.0,
            elevation: 5.0,
            color: Colors.amber,
            borderRadius: BorderRadius.circular(10.0),
            onPressed: () {
              print("onPressed");
            },
            onLongPressed: () {
              print("onLongPressed");
            },
            child: Icon(Icons.add_circle),
          ),
          DownButton(
            elevation: 5.0,
            color: Colors.amber,
            borderRadius: BorderRadius.circular(10.0),
            onPressed: () {
              print("onPressed");
            },
            onLongPressed: () {
              print("onLongPressed");
            },
            disabled: true,
            child: Center(
              child: Text(
                "Example button",
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
