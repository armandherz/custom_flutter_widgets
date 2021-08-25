import 'package:flutter/material.dart';

class MyCalendar extends StatelessWidget {
  final year;
  final month;

  const MyCalendar({Key? key, required this.year, required this.month})
      : super(key: key);

  List<int> getMonthDays(int year, int month) {
    List<int> monthDays = [];
    final date = DateTime(year, month, 1);
    final maxDays = getMaxMonthDays(date);
    final currentDayIndex = date.weekday;
    final lastDayIndex = DateTime(year, month, maxDays).weekday;

    for (int i = 0; i < currentDayIndex - 1; i++) {
      monthDays.add(0);
    }
    for (int i = 1; i <= maxDays; i++) {
      monthDays.add(i);
    }
    for (int i = 0; i < 7 - lastDayIndex; i++) {
      monthDays.add(0);
    }

    return monthDays;
  }

  int getMaxMonthDays(DateTime dateTime) {
    List<int> maxDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    maxDays[1] = dateTime.year % 4 == 0 ? 29 : 28;
    return maxDays[dateTime.month - 1];
  }

  @override
  Widget build(BuildContext context) {
    final data = getMonthDays(year, month);
    return Container(
      color: Colors.blueGrey.shade900,
      child: Center(
        child: Column(
          children: [
            Container(
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(7, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                          text: ["L", "M", "M", "J", "V", "S", "D"][index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                    ),
                  );
                }),
              ),
            ),
            Container(
              width: 370,
              height: 320,
              color: Colors.red,
              padding: EdgeInsets.all(5),
              child: GridView.count(
                crossAxisCount: 7,
                children: List.generate(data.length, (index) {
                  return index >= 0
                      ? calendarItem(true, data[index])
                      : index < 0
                          ? calendarItem(false, 0)
                          : calendarItem(false, 0);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget calendarItem(bool currentMonth, int index) {
    return Visibility(
      visible: index != 0,
      child: Container(
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: currentMonth ? Colors.blue : Color(0xff626262),
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(64),
                blurRadius: 2,
                offset: Offset(0, 5),
              ),
            ]),
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0, 0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                    text: index.toString(), //data
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
