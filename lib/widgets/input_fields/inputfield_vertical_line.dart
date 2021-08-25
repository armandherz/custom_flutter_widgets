import 'package:flutter/material.dart';

class InputfieldVerticalLine extends StatelessWidget {
  final String? hintText;
  final Widget? prefix;
  final bool obscureText;
  const InputfieldVerticalLine({
    Key? key,
    this.hintText,
    this.prefix,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.0,
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          hintText: hintText,
          prefixIcon: prefix != null
              ? SizedBox(
                  width: 100.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(),
                      prefix!,
                      Container(width: 1.0, height: 40.0, color: Colors.grey),
                    ],
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
