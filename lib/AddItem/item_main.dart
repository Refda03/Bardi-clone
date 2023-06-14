import 'package:ui_bardi/AddItem/item_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './item_pages.dart';

void main() => runApp(item());

class item extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => EmployeeProvider(),
        )
      ],
      child: MaterialApp(
        home: Employee(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}