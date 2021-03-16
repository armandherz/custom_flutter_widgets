import 'package:flutter/material.dart';

class DownButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final double? elevation;
  final Function? onPressed;
  final Function? onLongPressed;
  final BorderRadius? borderRadius;
  final Widget? child;
  final bool? disabled;

  const DownButton({
    Key? key,
    this.width,
    this.height,
    this.color = Colors.white,
    this.elevation = 0.0,
    this.onPressed,
    this.onLongPressed,
    this.borderRadius,
    this.child,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool touched = false;
    DateTime time = DateTime.now();
    return StatefulBuilder(builder: (_, state) {
      return GestureDetector(
        onTapDown: (d) {
          if (disabled!) return;
          state(() {
            touched = true;
            time = DateTime.now();
          });
          if (onLongPressed != null) {
            Future.delayed(Duration(milliseconds: 500), () {
              if (DateTime.now().difference(time).inMilliseconds >= 500 &&
                  touched) {
                state(() {
                  touched = false;
                });
                onLongPressed!();
              }
            });
          }
        },
        onTapCancel: () {
          if (disabled!) return;
          state(() {
            touched = false;
          });
        },
        onTap: () {
          if (disabled!) return;
          if (onPressed != null && touched) onPressed!();
          state(() {
            touched = false;
          });
        },
        child: Opacity(
          opacity: disabled! ? 0.50 : 1.0,
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: (touched || disabled!)
                  ? null
                  : Color.lerp(color, Colors.black, 0.15),
              borderRadius: borderRadius,
            ),
            child: Container(
              width: width,
              height: (height != null) ? height! - elevation! : null,
              margin: EdgeInsets.only(
                bottom: (touched || disabled!) ? 0 : elevation!,
                top: (touched || disabled!) ? elevation! : 0,
              ),
              decoration: BoxDecoration(
                color: color,
                borderRadius: borderRadius,
              ),
              child: child,
            ),
          ),
        ),
      );
    });
  }
}
