import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_bardi/beranda.dart';

import '../Logout_Screen.dart';
import '../tambahperangkat.dart';
import './item_add.dart';
import './item_edit.dart';
import './item_model.dart';
import './item_provider.dart';

class Employee extends StatelessWidget {

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
          actions: <Widget>[
            IconButton(icon: const Icon(
              Icons.add_circle_rounded, color: Colors.cyan, size: 35.0,),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => EmployeeAdd()));
              },
            ),
          ],
        ),
      ),

      body: RefreshIndicator(
        onRefresh: () =>
            Provider.of<EmployeeProvider>(context, listen: false).getEmployee(),
        color: Colors.red,
        child: Container(
          margin: EdgeInsets.all(10),
          child: FutureBuilder(
            future: Provider.of<EmployeeProvider>(context, listen: false)
                .getEmployee(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Consumer<EmployeeProvider>(
                builder: (context, data, _) {
                  return ListView.builder(
                    itemCount: data.dataEmployee.length,
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EmployeeEdit(
                                id: data.dataEmployee[i].id,
                              ),
                            ),
                          );
                        },
                        child: Dismissible(
                          key: UniqueKey(),
                          direction: DismissDirection.endToStart,
                          confirmDismiss: (DismissDirection direction) async {
                            final bool res = await showDialog(context: context, builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Konfirmasi'),
                                content: Text('Kamu Yakin?'),
                                actions: <Widget>[
                                  FlatButton(onPressed: () => Navigator.of(context).pop(true), child: Text('HAPUS'),),
                                  FlatButton(onPressed: () => Navigator.of(context).pop(false), child: Text('BATALKAN'),)
                                ],
                              );
                            });
                            return res;
                          },
                          onDismissed: (value) {
                            Provider.of<EmployeeProvider>(context, listen: false).deleteEmployee(data.dataEmployee[i].id);
                          },
                          child: Card(
                            elevation: 8,
                            child: ListTile(
                              title: Text(
                                data.dataEmployee[i].employeeName,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                  'Umur: ${data.dataEmployee[i].employeeAge}'),
                              trailing: Text(
                                  "\Rp.${data.dataEmployee[i].employeeSalary}"),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

//LIST EMPLOYEE > SEMUA DATA EMPLOYEE
//CREATE EMPLOYEE > FORM INPUT DATA
//EDIT EMPLOYEE > MENAMPILKAN DATA KE DALAM FORM INPUT
//UPDATE EMPLOYEE
//DELETE EMPLOYEE