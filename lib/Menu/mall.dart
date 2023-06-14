import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class mall extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Coming Soon',
            style: TextStyle(
                fontSize: 26
            ),
          ),
        ),
      ),
    );
  }
}