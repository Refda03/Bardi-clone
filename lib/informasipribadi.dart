import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_bardi/loginsharedpreference.dart';

class informasipribadi extends StatefulWidget {
  const informasipribadi({Key? key}) : super(key: key);

  @override
  _MyDashboardState createState() => _MyDashboardState();
}
class _MyDashboardState extends State<informasipribadi> {
  late SharedPreferences logindata;
  late String username;

  @override
  void initState() {
    super.initState();
    initial();
  }
  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text("Informasi Pribadi"),

      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'Welcome $username', style: const TextStyle(fontSize: 20, fontFamily: "San Francisco", color: Color(
              0xB4000000),),),
              ),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.cyan,
              onPressed: () {
                logindata.setBool('login', true);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => loginpage()));
              },
              child: const Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}