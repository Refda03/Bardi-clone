import 'package:flutter/material.dart';
import 'accountpage.dart';

class Login extends StatelessWidget{
  const Login({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AccountSwitcher());
  }

}