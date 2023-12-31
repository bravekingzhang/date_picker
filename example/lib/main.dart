import 'package:flutter/material.dart';

import 'package:date_picker_hz/date_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Date-picker example app'),
        ),
        body: Center(
          child: DatePicker(onDateRangeSelected: (range) {}),
        ),
      ),
    );
  }
}
