import 'dart:convert';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ui_bardi/DataAPI/provider.dart';
import '../beranda.dart';

class dataapi extends StatelessWidget{

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
              Icons.arrow_back_ios, color: Colors.grey, size: 30.0,),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  bardi()));
            },
          ),
        ),
      ),

      body: FutureBuilder<List<dynamic>>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.cyan,
                      // backgroundImage:
                      // NetworkImage(snapshot.data[index]['avatar']),
                    ),
                    title: Text(snapshot.data[index]['nama_depan'] + " " + snapshot.data[index]['nama_belakang']),
                    subtitle: Text(snapshot.data[index]['agama']),
                    trailing: Text(snapshot.data[index]['jenis_kelamin']),
                  );
                });
          } else {
            return const Center(child: Text('data error'));
          }
        },
      ),
    );
  }
}