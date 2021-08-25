import 'package:flutter/material.dart';

class CountDown extends StatelessWidget {
  final double? size;
  final int? seconds;
  final Function? onEnd;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? progressColor;
  final double? elevation;
  final double? progressWidth;
  final bool? enable;

  const CountDown({
    Key? key,
    this.size,
    this.seconds = 1,
    this.onEnd,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.progressColor = Colors.black,
    this.elevation = 0.0,
    this.progressWidth = 5.0,
    this.enable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return enable!
        ? Align(
            child: SizedBox(
              width: size,
              height: size,
              child: Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(size!)),
                elevation: elevation!,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(size!),
                  child: TweenAnimationBuilder<double>(
                    duration: Duration(seconds: seconds!),
                    tween: Tween(begin: 0.0, end: seconds!.toDouble()),
                    builder: (_, val, child) {
                      double move = (val.ceil() - (val + 0.75)) * 200;
                      move = move > 0 ? move : 0;
                      move = val == 0 ? (0.75 * 200) : move;
                      return Stack(
                        children: [
                          Center(
                            child: Transform.translate(
                              offset: Offset(0.0, 0),
                              child: Transform.scale(
                                scale: 1 - (move / (50)),
                                child: Text(
                                  (seconds! - val.toInt()).toString(),
                                  style: TextStyle(
                                    fontSize: (size! / 2) /
                                        (seconds!.toString().length / 3),
                                    decoration: TextDecoration.none,
                                    color: textColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size,
                            height: size,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: CircularProgressIndicator(
                                value: val / seconds!,
                                strokeWidth: progressWidth!,
                                valueColor:
                                    AlwaysStoppedAnimation(progressColor),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    onEnd: () {
                      if (onEnd != null && enable!) onEnd!();
                    },
                  ),
                ),
              ),
            ),
          )
        : SizedBox();
  }
}
