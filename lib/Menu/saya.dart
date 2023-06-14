import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_bardi/AddItem/item_main.dart';
import 'package:ui_bardi/DataAPI/Homepage.dart';
import 'package:ui_bardi/Todolist/feedback.dart';
import 'package:ui_bardi/informasipribadi.dart';
import 'package:ui_bardi/Logout_Screen.dart';
import 'package:ui_bardi/Todolist/feedback.dart';
import 'package:ui_bardi/signupsharedpreference.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ui_bardi/loginsharedpreference.dart';

class saya extends StatefulWidget {
  @override
  _FirstScreenState createState() {
    return _FirstScreenState();
  }
}

class _FirstScreenState extends  State<saya> {
  // late SharedPreferences sharedPreferences;
  // late String username;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   initial();
  // }
  // void initial() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     username = sharedPreferences.getString('username')!;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
          backgroundColor: const Color(0xffffffff),
          actions: <Widget>[
            IconButton(icon: const Icon(
              Icons.qr_code_scanner_rounded, color: Colors.black54, size: 25.0,),
              onPressed: () {
                Fluttertoast.showToast(msg: 'QR Code');
              },
            ),
            IconButton(icon: const Icon(
              Icons.settings_rounded, color: Colors.black54, size: 25.0,),
              onPressed: () {
                Fluttertoast.showToast(msg: 'Settings');
              },
            ),
          ],
        ),
      ),

      body: Container(
        color: const Color(0xfff8f8f8),
        child: Center(
          child: ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      width: 368.0,
                      height: 75.0,
                      decoration:  const BoxDecoration(
                        color:  Color(0xffffffff),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 0.5,
                              spreadRadius: 0,
                              offset: Offset(0, 0)
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text("BARDI SMART HOME", style: TextStyle(fontSize: 20, fontFamily: "San Francisco", color: Color(
                              0xB4000000),),),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20.0),

                    Container(
                      padding: const EdgeInsets.all(15.0),
                      width: 368.0,
                      height: 120.0,
                      decoration:  const BoxDecoration(
                        color:  Color(0xffffffff),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 0.5,
                              spreadRadius: 0,
                              offset: Offset(0, 0)
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Layanan akses Third-Party',style: TextStyle(fontSize: 20, fontFamily: "San Francisco", color: Color(
                              0xB4000000),),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              Image(
                                image:
                                AssetImage('assets/images/alexa.png'),
                                height: 50,
                                width: 50,
                              ),
                              Text('Alexa',style: TextStyle(fontSize: 20, fontFamily: "San Francisco", color: Color(
                                  0xB4000000),),),
                              Image(
                                image:
                                AssetImage('assets/images/assistant.png'),
                                height: 50,
                                width: 50,
                              ),
                              Text('Google',style: TextStyle(fontSize: 20, fontFamily: "San Francisco", color: Color(
                                  0xB4000000),),),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20.0),

                    Container(
                      padding: const EdgeInsets.all(15.0),
                      width: 368.0,
                      height: 75.0,
                      decoration:  const BoxDecoration(
                        color:  Color(0xffffffff),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 0.5,
                              spreadRadius: 0,
                              offset: Offset(0, 0)
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Icon(Icons.home, color: Colors.grey, size: 35.0),
                          const Text('Manajemen Pegawai',style: TextStyle(fontSize: 20, fontFamily: "San Francisco", color: Color(
                              0xB4000000),),),
                          IconButton(icon: const Icon(
                            Icons.arrow_forward_ios_rounded, color: Colors.grey, size: 15.0,),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => item()));
                            },
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20.0),

                    Container(
                      padding: const EdgeInsets.all(15.0),
                      width: 368.0,
                      height: 75.0,
                      decoration:  const BoxDecoration(
                        color:  Color(0xffffffff),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 0.5,
                              spreadRadius: 0,
                              offset: Offset(0, 0)
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Icon(Icons.message, color: Colors.grey, size: 35.0),
                          const Text('Data API',style: TextStyle(fontSize: 20, fontFamily: "San Francisco", color: Color(
                              0xB4000000),),),
                          IconButton(icon: const Icon(
                            Icons.arrow_forward_ios_rounded, color: Colors.grey, size: 15.0,),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => dataapi()));
                            },
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.all(15.0),
                      width: 368.0,
                      height: 75.0,
                      decoration:  const BoxDecoration(
                        color:  Color(0xffffffff),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 0.5,
                              spreadRadius: 0,
                              offset: Offset(0, 0)
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Icon(Icons.menu_book_rounded, color: Colors.grey, size: 35.0),
                          const Text('TodoList',style: TextStyle(fontSize: 20, fontFamily: "San Francisco", color: Color(
                              0xB4000000),),),
                          IconButton(icon: const Icon(
                            Icons.arrow_forward_ios_rounded, color: Colors.grey, size: 15.0,),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => TodosApp()));
                            },
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.all(15.0),
                      width: 368.0,
                      height: 75.0,
                      decoration:  const BoxDecoration(
                        color:  Color(0xffffffff),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 0.5,
                              spreadRadius: 0,
                              offset: Offset(0, 0)
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Icon(Icons.shopping_bag_outlined, color: Colors.grey, size: 35.0),
                          const Text('Layanan Mall',style: TextStyle(fontSize: 20, fontFamily: "San Francisco", color: Color(
                              0xB4000000),),),
                          IconButton(icon: const Icon(
                            Icons.arrow_forward_ios_rounded, color: Colors.grey, size: 15.0,),
                            onPressed: () {
                              Fluttertoast.showToast(msg: 'Layanan Mall');
                            },
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20.0),

                    Container(
                      padding: const EdgeInsets.all(15.0),
                      width: 368.0,
                      height: 75.0,
                      decoration:  const BoxDecoration(
                        color:  Color(0xffffffff),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 0.5,
                              spreadRadius: 0,
                              offset: Offset(0, 0)
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Icon(Icons.info, color: Colors.grey, size: 35.0),
                          const Text('Info Aplikasi',style: TextStyle(fontSize: 20, fontFamily: "San Francisco", color: Color(
                              0xB4000000),),),
                          IconButton(icon: const Icon(
                            Icons.arrow_forward_ios_rounded, color: Colors.grey, size: 15.0,),
                            onPressed: () {
                              Fluttertoast.showToast(msg: 'Info Aplikasi');
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
          ),
        ),
      );

  }
}