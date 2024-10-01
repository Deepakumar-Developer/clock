import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_play/functions.dart';

class MyTimerPage extends StatefulWidget {
  const MyTimerPage({super.key});

  @override
  State<MyTimerPage> createState() => _MyTimerPageState();
}

class _MyTimerPageState extends State<MyTimerPage> {
  Stopwatch _stopwatch = Stopwatch();
  Duration _elapsedTime = Duration.zero;

  void _onStartStop() {
    setState(() {
      if (_stopwatch.isRunning) {
        _stopwatch.stop();
      } else {
        _stopwatch.start();
        _elapsedTime = Duration.zero;
        _startTimer();
      }
    });
  }

  void _onReset() {
    setState(() {
      _stopwatch.stop();
      _stopwatch.reset();
      _elapsedTime = Duration.zero;
    });
  }

  void _startTimer() {
    Timer(Duration(milliseconds: 100), _onTick);
  }

  void _onTick() {
    setState(() {
      _elapsedTime = _stopwatch.elapsed;
    });
    Timer(Duration(milliseconds: 100), _onTick);
  }

  String different(int index) {
    int i = (int.parse(lap[index].substring(0, 2)) * 60) +
        int.parse(lap[index].substring(3, 5));

    int ip = (int.parse(lap[index - 1].substring(0, 2)) * 60) +
        int.parse(lap[index - 1].substring(3, 5));
    int ms = int.parse(lap[index].substring(6)) -
        int.parse(lap[index - 1].substring(6));

    int differentSecond = i - ip;

    return '${(differentSecond ~/ 60).toString().padLeft(2, '0')}:${(differentSecond % 60).toInt().toString().padLeft(2, '0')}.${ms.abs().toString().padLeft(3, '0')}';
  }

  List<String> lap = [];

  @override
  Widget build(BuildContext context) {
    String elapsedTimeString =
        '${_elapsedTime.inMinutes.toString().padLeft(2, '0')}:${(_elapsedTime.inSeconds % 60).toString().padLeft(2, '0')}.${(_elapsedTime.inMilliseconds % 1000).toString().padLeft(3, '0')}';
    String min = _elapsedTime.inMinutes.toString().padLeft(2, '0');
    String sec = (_elapsedTime.inSeconds % 60).toString().padLeft(2, '0');
    String milliSec =
        (_elapsedTime.inMilliseconds % 10000).toString().padLeft(4, '0');
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(7.50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 10.0,
                              offset: Offset(4.0, 4.0),
                            ),
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 10.0,
                              offset: Offset(-4.0, -4.0),
                            ),
                          ],
                        ),
                        child: Text(
                          'Minutes',
                          style: GoogleFonts.josefinSans(
                              textStyle:
                                  TextStyle(fontSize: 10, letterSpacing: 1)),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      // Text(
                      //   ':',
                      //   style: GoogleFonts.josefinSans(
                      //       textStyle:
                      //           TextStyle(fontSize: 25, letterSpacing: 2)),
                      // ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(7.50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 10.0,
                              offset: Offset(4.0, 4.0),
                            ),
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 10.0,
                              offset: Offset(-4.0, -4.0),
                            ),
                          ],
                        ),
                        child: Text(
                          'Seconds',
                          style: GoogleFonts.josefinSans(
                              textStyle:
                                  TextStyle(fontSize: 10, letterSpacing: 1)),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      // Text(
                      //   ':',
                      //   style: GoogleFonts.josefinSans(
                      //       textStyle:
                      //           TextStyle(fontSize: 25, letterSpacing: 2)),
                      // ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(7.50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 10.0,
                              offset: Offset(4.0, 4.0),
                            ),
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 10.0,
                              offset: Offset(-4.0, -4.0),
                            ),
                          ],
                        ),
                        child: Text(
                          'Millisec',
                          style: GoogleFonts.josefinSans(
                              textStyle:
                                  TextStyle(fontSize: 10, letterSpacing: 1)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: width(context) * 0.2,
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade500,
                              blurRadius: 15.0,
                              offset: Offset(4.0, 4.0),
                            ),
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 15.0,
                              offset: Offset(-4.0, -4.0),
                            ),
                          ],
                        ),
                        child: Text(
                          // '$leftMin$rightMin',
                          min,
                          style: GoogleFonts.acme(
                              textStyle:
                                  TextStyle(fontSize: 30, letterSpacing: 2)),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        ':',
                        style: GoogleFonts.josefinSans(
                            textStyle:
                                TextStyle(fontSize: 50, letterSpacing: 2)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: width(context) * 0.2,
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade500,
                              blurRadius: 15.0,
                              offset: Offset(4.0, 4.0),
                            ),
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 15.0,
                              offset: Offset(-4.0, -4.0),
                            ),
                          ],
                        ),
                        child: Text(
                          // '$leftSec$rightSec',
                          sec,
                          style: GoogleFonts.acme(
                              textStyle:
                                  TextStyle(fontSize: 30, letterSpacing: 2)),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        ':',
                        style: GoogleFonts.josefinSans(
                            textStyle:
                                TextStyle(fontSize: 50, letterSpacing: 2)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: width(context) * 0.2,
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade500,
                              blurRadius: 15.0,
                              offset: Offset(4.0, 4.0),
                            ),
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 15.0,
                              offset: Offset(-4.0, -4.0),
                            ),
                          ],
                        ),
                        child: Text(
                          // '$leftMilliSec$rightMilliSec',
                          milliSec[1] + milliSec[3],
                          style: GoogleFonts.acme(
                              textStyle:
                                  TextStyle(fontSize: 30, letterSpacing: 2)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              AnimatedOpacity(
                opacity: lap.isNotEmpty ? 1 : 0,
                duration: Duration(milliseconds: 500),
                child: Visibility(
                  visible: lap.isNotEmpty,
                  child: Container(
                      width: width(context) * 0.75,
                      height: width(context) * 0.75,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(7.50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 10.0,
                            offset: Offset(4.0, 4.0),
                          ),
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 10.0,
                            offset: Offset(-4.0, -4.0),
                          ),
                        ],
                      ),
                      child: Scrollbar(
                        thumbVisibility: true,
                        radius: Radius.circular(10),
                        child: ListView.builder(
                            itemCount: lap.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: width(context),
                                height: 35,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Icon(Icons.pin_drop_rounded),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/pin.png',
                                          width: 20,
                                          height: 20,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          lap[index],
                                          style: GoogleFonts.josefinSans(),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 100,
                                      child: Text(
                                        (index == 0)
                                            ? lap[index]
                                            : different(index),
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.josefinSans(),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      )),
                ),
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 1000),
                opacity: (_elapsedTime != Duration.zero) ? 1 : 0,
                child: Visibility(
                  visible: (_elapsedTime != Duration.zero),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            lap = [];
                            _onReset();
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade500,
                                blurRadius: 15.0,
                                offset: Offset(4.0, 4.0),
                              ),
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 15.0,
                                offset: Offset(-4.0, -4.0),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.restart_alt_outlined,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_stopwatch.isRunning) {
                              lap.add(elapsedTimeString);
                            }
                          });
                        },
                        child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade500,
                                  blurRadius: 15.0,
                                  offset: Offset(4.0, 4.0),
                                ),
                                BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 15.0,
                                  offset: Offset(-4.0, -4.0),
                                ),
                              ],
                            ),
                            child: Image.asset(
                              'assets/pin.png',
                              width: 20,
                              height: 20,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _onStartStop();
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        blurRadius: 15.0,
                        offset: Offset(4.0, 4.0),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 15.0,
                        offset: Offset(-4.0, -4.0),
                      ),
                    ],
                  ),
                  child: Icon(
                    _stopwatch.isRunning
                        ? Icons.pause_rounded
                        : Icons.play_arrow_rounded,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
