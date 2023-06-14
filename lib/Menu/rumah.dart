import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ui_bardi/Logout_Screen.dart';
import 'package:ui_bardi/Menu/saya.dart';
import 'package:ui_bardi/tambahperangkat.dart';
import 'package:ui_bardi/informasipribadi.dart';

class rumah extends StatelessWidget{
  var appBarHeight = AppBar().preferredSize.height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
          backgroundColor: const Color(0xffffffff),
          leading: IconButton(
            icon: const Icon(
              Icons.account_circle_rounded, color: Colors.grey, size: 45.0,),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  logout()));
            },
          ),
          actions: <Widget>[
            IconButton(icon: const Icon(
              Icons.add_circle_rounded, color: Colors.cyan, size: 35.0,),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => tambahperangkat()));
              },
            ),
          ],
        ),
      ),

      body: Container(
        color: const Color(0xfff8f8f8),
        child: Column(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        padding: const EdgeInsets.all(15.0),
                        onPressed: () {
                          Fluttertoast.showToast(msg: 'Semua Perangkat');
                        },
                        child: const Text('Semua Perangkat',style: TextStyle(fontSize: 17, fontFamily: "San Francisco", color: Color(
                            0xB4000000),),),
                      ),
                      PopupMenuButton(
                        onSelected: (value) {
                        },
                        icon: const Icon(Icons.more_horiz),
                        offset: Offset(0.0, appBarHeight),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0),
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                        ),
                        itemBuilder:  (context) => [
                          PopupMenuItem(
                              value: 1,
                              child: Row(
                                children: const <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Icon(Icons.apps_rounded),
                                  ),
                                  Text('Tampilan 2 Baris')
                                ],
                              )),
                          PopupMenuItem(
                              value: 2,
                              child: Row(
                                children: const <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Icon(Icons.format_line_spacing_rounded),
                                  ),
                                  Text('Manajemen Perangkat')
                                ],
                              )),
                          PopupMenuItem(
                              value: 3,
                              child: Row(
                                children: const <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Icon(Icons.settings_rounded),
                                  ),
                                  Text('Pengaturan Ruangan')
                                ],
                              )),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 10.0),

                  Container(
                    padding: const EdgeInsets.all(15.0),
                    width: 368.0,
                    height: 75.0,
                    decoration:  const BoxDecoration(
                      color: const Color(0xffffffff),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const <Widget>[
                        Image(
                          image:
                          AssetImage('assets/images/Fishfeeder.png'),
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(width: 10,),
                        Text('Fish Feeder',style: TextStyle(fontSize: 20, fontFamily: "San Francisco", color: Color(
                            0xB4000000),),),
                        // RaisedButton(
                        //   onPressed: () {},
                        //   child: const Text('Offline',style: TextStyle(fontSize: 13, fontFamily: "San Francisco", color: Color(
                        //       0xff9e9e9e),),),
                        // ),
                      ],
                    ),
                  )

                ],
              ),
            ),
          ],
        ),
      ),
      );
  }
}