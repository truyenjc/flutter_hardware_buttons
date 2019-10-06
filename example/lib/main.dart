import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hardware_buttons/hardware_buttons.dart' as HardwareButtons;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _latestHardwareButtonEvent;

  StreamSubscription<HardwareButtons.VolumeButtonEvent> _volumeButtonSubscription;
  StreamSubscription<HardwareButtons.HomeButtonEvent> _homeButtonSubscription;

  @override
  void initState() {
    super.initState();
//    _volumeButtonSubscription = HardwareButtons.volumeButtonEvents.listen((event) {
//      setState(() {
//        _latestHardwareButtonEvent = event.toString();
//      });
//    });

    _homeButtonSubscription = HardwareButtons.homeButtonEvents.listen((event) {
      setState(() {
        _latestHardwareButtonEvent = 'HOME_BUTTON';
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _volumeButtonSubscription?.cancel();
    _homeButtonSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Value: $_latestHardwareButtonEvent\n'),
              SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '안드 테스트 용도입니다 ㅠ.ㅠ',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}