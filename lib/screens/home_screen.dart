import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _tabNumber = 25;
  int totalSeconds = 1500;
  int totalPomodoros = 0;
  int totalGoal = 0;
  bool isRunning = false;
  bool isBreakTime = false;
  int totalBreakTime = 300;
  late Timer timer;

  void onTick(Timer timer) {
    if (isBreakTime == true) {
      setState(() {
        if (totalBreakTime == 0) {
          isBreakTime = false;
          totalBreakTime = 300;
          timer.cancel();
        } else {
          totalBreakTime = totalBreakTime - 1;
        }
      });
      return;
    }

    if (totalSeconds == 0) {
      setState(() {
        totalPomodoros = totalPomodoros + 1;
        isRunning = false;
        totalSeconds = _tabNumber * 60;
        if (totalPomodoros == 5) {
          totalPomodoros = 0;
          totalGoal = totalGoal + 1;
        }
        isBreakTime = true;
      });
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(const Duration(microseconds: 5000), onTick);
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split('.').first.substring(2, 7);
  }

  void onResetPressed() {
    setState(() {
      if (isRunning) {
        isRunning = !isRunning;
        timer.cancel();
      }
      _tabNumber = 25;
      totalSeconds = _tabNumber * 60;
      totalPomodoros = 0;
      totalGoal = 0;
    });
  }

  void changeTabNumber(int tabNumber) {
    setState(() {
      if (isRunning) {
        isRunning = !isRunning;
        timer.cancel();
      }
      _tabNumber = tabNumber;
      totalSeconds = _tabNumber * 60;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).dialogBackgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 70, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Text('MOPO TIMER',
                          style: TextStyle(
                            fontSize: 30,
                            color: Theme.of(context).cardColor,
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () => changeTabNumber(15),
                        child: Container(
                          decoration: BoxDecoration(
                            color: _tabNumber == 15
                                ? Colors.blue
                                : Colors.transparent,
                            border: Border.all(
                              color: Theme.of(context).cardColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('15',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Theme.of(context).cardColor,
                                )),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => changeTabNumber(20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: _tabNumber == 20
                                ? Colors.blue
                                : Colors.transparent,
                            border: Border.all(
                              color: Theme.of(context).cardColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('20',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Theme.of(context).cardColor,
                                )),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => changeTabNumber(25),
                        child: Container(
                          decoration: BoxDecoration(
                            color: _tabNumber == 25
                                ? Colors.blue
                                : Colors.transparent,
                            border: Border.all(
                              color: Theme.of(context).cardColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('25',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Theme.of(context).cardColor,
                                )),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => changeTabNumber(30),
                        child: Container(
                          decoration: BoxDecoration(
                            color: _tabNumber == 30
                                ? Colors.blue
                                : Colors.transparent,
                            border: Border.all(
                              color: Theme.of(context).cardColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('30',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Theme.of(context).cardColor,
                                )),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => changeTabNumber(35),
                        child: Container(
                          decoration: BoxDecoration(
                            color: _tabNumber == 35
                                ? Colors.blue
                                : Colors.transparent,
                            border: Border.all(
                              color: Theme.of(context).cardColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('35',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Theme.of(context).cardColor,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(isBreakTime ? '휴식시간' : '집중시간',
                          style: TextStyle(
                            color: Theme.of(context).cardColor,
                            fontSize: 30,
                          )),
                      Text(
                        format(isBreakTime ? totalBreakTime : totalSeconds),
                        style: TextStyle(
                            color: Theme.of(context).cardColor,
                            fontSize: 89,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
                child: Center(
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 120,
                  color: Theme.of(context).cardColor,
                  onPressed: isRunning ? onPausePressed : onStartPressed,
                  icon: Icon(
                    isRunning
                        ? Icons.pause_circle_outlined
                        : Icons.play_circle_outlined,
                  ),
                ),
                IconButton(
                  iconSize: 80,
                  color: Theme.of(context).cardColor,
                  onPressed: onResetPressed,
                  icon: const Icon(
                    Icons.refresh_outlined,
                  ),
                ),
              ],
            ))),
          ),
          Flexible(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Round',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Theme.of(context)
                                          .textTheme
                                          .headlineLarge!
                                          .color,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '$totalPomodoros / 4',
                                  style: TextStyle(
                                      fontSize: 38,
                                      color: Theme.of(context)
                                          .textTheme
                                          .headlineLarge!
                                          .color,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Goal',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Theme.of(context)
                                          .textTheme
                                          .headlineLarge!
                                          .color,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '$totalGoal / 12',
                                  style: TextStyle(
                                      fontSize: 38,
                                      color: Theme.of(context)
                                          .textTheme
                                          .headlineLarge!
                                          .color,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
