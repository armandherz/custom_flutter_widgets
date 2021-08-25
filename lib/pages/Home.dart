// ignore: unused_import
import 'package:custom_flutter_widgets/widgets/count_down.dart';
// ignore: unused_import
import 'package:custom_flutter_widgets/widgets/input_fields/inputfield_vertical_line.dart';
import 'package:custom_flutter_widgets/widgets/my_calendar.dart';
import 'package:custom_flutter_widgets/widgets/my_switch_button.dart';
// ignore: unused_import
import 'package:custom_flutter_widgets/widgets/typing_letters_efect.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 200.0,
                ),
                MySwitchButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
