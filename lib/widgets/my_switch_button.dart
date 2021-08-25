import 'package:flutter/material.dart';

class MySwitchButton extends StatelessWidget {
  const MySwitchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollCtrl = ScrollController();
    double width = 80.0;
    double height = 50.0;
    bool switchOn = false;
    return StatefulBuilder(builder: (context, state) {
      return GestureDetector(
        onTap: () async {
          switchOn = !switchOn;
          await scrollCtrl.animateTo(
            switchOn ? 0.0 : scrollCtrl.position.maxScrollExtent,
            duration: Duration(milliseconds: 200),
            curve: Curves.bounceInOut,
          );
          state(() {});
        },
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            color: Colors.grey,
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.4),
                Colors.white.withOpacity(0.5),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Container(
            width: width,
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(100.0),
              boxShadow: [
                BoxShadow(color: Colors.black54),
                BoxShadow(
                    color: Colors.grey, blurRadius: 2.0, spreadRadius: -1.0)
              ],
            ),
            child: ListView(
              controller: scrollCtrl,
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(width: 6.0),
                Center(
                    child: Text(
                  "OFF",
                  style: switchOn ? onStyle(color: Colors.red) : offStyle(),
                )),
                SizedBox(width: 4.0),
                Center(
                  child: Container(
                    width: height - 20.0,
                    height: height - 20.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100.0),
                      border: Border.all(color: Colors.white, width: 1.5),
                      gradient: LinearGradient(
                        colors: [Colors.grey, Colors.white],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 4.0),
                Center(
                    child: Text(
                  "ON",
                  style:
                      switchOn ? offStyle() : onStyle(color: Colors.cyanAccent),
                )),
                SizedBox(width: 11.0),
              ],
            ),
          ),
        ),
      );
    });
  }

  TextStyle offStyle() {
    return TextStyle(fontWeight: FontWeight.bold);
  }

  TextStyle onStyle({Color color = Colors.cyanAccent}) {
    return TextStyle(fontWeight: FontWeight.bold, color: color, shadows: [
      BoxShadow(color: color, blurRadius: 15.0, spreadRadius: 10.0),
      BoxShadow(color: color, blurRadius: 15.0, spreadRadius: 10.0),
      BoxShadow(color: color, blurRadius: 15.0, spreadRadius: 10.0),
    ]);
  }
}
