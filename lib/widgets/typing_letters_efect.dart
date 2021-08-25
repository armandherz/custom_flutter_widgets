import 'dart:async';

import 'package:flutter/material.dart';

class TypingLettersEffect extends StatefulWidget {
  @override
  _TypingLettersEffectState createState() => _TypingLettersEffectState();
}

class _TypingLettersEffectState extends State<TypingLettersEffect> {
  final List<String> text = [
    "React is a framework",
    "Flutter is a framework",
    "Dart is a programming languaje"
  ];
  String typingText = "";
  int textCounter = 0;
  int letterCounter = 0;

  @override
  void initState() {
    typingController();
    super.initState();
  }

  void typingController() {
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      typingText += text[textCounter][letterCounter];
      letterCounter++;
      if (letterCounter >= text[textCounter].length) {
        eraserController();
        letterCounter = 0;
        timer.cancel();
      }
      setState(() {});
    });
  }

  void eraserController() {
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      typingText =
          typingText.replaceRange(typingText.length - 1, typingText.length, "");
      if (typingText.isEmpty) {
        textCounter++;
        timer.cancel();
        typingController();
        textCounter = textCounter >= text.length ? 0 : textCounter;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.0,
      width: double.infinity,
      child: Material(
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: typingText,
                style: Theme.of(context).textTheme.headline5,
              ),
              TextSpan(
                text: "|",
                style: Theme.of(context).textTheme.headline5,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
