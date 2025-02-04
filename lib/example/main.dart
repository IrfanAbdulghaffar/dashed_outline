import 'package:flutter/material.dart';
import 'package:dashed_outline/dashed_outline.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Dashed Outline Example")),
        body: Center(
          child: DashedOutline(
            borderType: BorderType.RRect,
            radius: 12,
            dashPattern: [6, 3, 2, 3],
            child: Container(
              height: 150,
              width: 100,
              color: Colors.amber,
            ),
          ),
        ),
      ),
    );
  }
}
