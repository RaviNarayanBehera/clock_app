import 'package:flutter/material.dart';
import 'dart:async';
import '../Global.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({super.key});

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        setState(
          () {
            dateTime = DateTime.now();

            if (dateTime.hour > 11) {
              amPm = 'PM';
            } else {
              amPm = 'AM';
            }
            switch (dateTime.weekday) {
              case 1:
                day = 'Mon';
                break;
              case 2:
                day = 'Tues';
                break;
              case 3:
                day = 'Wed';
                break;
              case 4:
                day = 'Thu';
                break;
              case 5:
                day = 'Fri';
                break;
              case 6:
                day = 'Sat';
                break;
              case 7:
                day = 'Sun';
                break;
            }
            ;
            switch (dateTime.month) {
              case 1:
                month = 'Jan';
                break;
              case 2:
                month = 'Feb';
                break;
              case 3:
                month = 'Mar';
                break;
              case 4:
                month = 'Apr';
                break;
              case 5:
                month = 'May';
                break;
              case 6:
                month = 'June';
                break;
              case 7:
                month = 'July';
                break;
              case 8:
                month = 'Aug';
                break;
              case 9:
                month = 'Sep';
                break;
              case 10:
                month = 'Oct';
                break;
              case 11:
                month = 'Nov';
                break;
              case 12:
                month = 'Dec';
                break;
            }
            ;
          },
        );
      },
    );
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/1.jpg'),fit: BoxFit.fill),
          ),
          child: Transform.translate(
            offset: Offset(20,290),
            child: Column(
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${dateTime.hour % 12}:${dateTime.minute}:${dateTime.second}',
                        style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 45,
                            fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                        text: '  $amPm',
                        style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Text(
                  '$day, $month ${dateTime.day}',
                  style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
