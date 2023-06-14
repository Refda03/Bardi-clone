import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class automisasi extends StatelessWidget{
  var appBarHeight = AppBar().preferredSize.height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: AppBar(
            bottomOpacity: 0.0,
            elevation: 0.0,
            backgroundColor: const Color(0xffffffff),
          ),
        ),

        body: Container(
          color: const Color(0xfff8f8f8),
          child: Column(
            children: <Widget>[
              Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: const Color(0xffffffff),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          FlatButton(
                            padding: const EdgeInsets.all(15.0),
                            onPressed: () {
                              Fluttertoast.showToast(msg: 'Automasi');
                            },
                            child: const Text('Automasi',style: TextStyle(fontSize: 17, fontFamily: "San Francisco", color: Color(
                                0xB4000000),),),
                          ),
                          FlatButton(
                            padding: const EdgeInsets.all(15.0),
                            onPressed: () {
                              Fluttertoast.showToast(msg: 'Grup Perangkat');
                            },
                            child: const Text('Grup Perangkat',style: TextStyle(fontSize: 17, fontFamily: "San Francisco", color: Color(
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
                                        child: Icon(Icons.format_line_spacing_rounded),
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
                                        child: Icon(Icons.history_edu_rounded),
                                      ),
                                      Text('Log')
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}