import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './item_provider.dart';
import './item_pages.dart';

class EmployeeAdd extends StatefulWidget {
  @override
  _EmployeeAddState createState() => _EmployeeAddState();
}

class _EmployeeAddState extends State<EmployeeAdd> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _salary = TextEditingController();
  final TextEditingController _age = TextEditingController();
  bool _isLoading = false;

  final snackbarKey = GlobalKey<ScaffoldState>();

  FocusNode salaryNode = FocusNode();
  FocusNode ageNode = FocusNode();

  void submit(BuildContext context) {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<EmployeeProvider>(context, listen: false)
          .storeEmployee(_name.text, _salary.text, _age.text)
          .then((res) {
        if (res) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Employee()), (route) => false);
        } else {
          var snackbar = const SnackBar(content: Text('Ops, Error. Hubungi Admin'),);
          snackbarKey.currentState?.showSnackBar(snackbar);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: snackbarKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppBar(
          title: Text('Tambah Data',style: TextStyle(fontSize: 17, fontFamily: "San Francisco", color: Color(
              0xB4000000),),),
          bottomOpacity: 0.0,
          elevation: 0.0,
          backgroundColor: const Color(0xffffffff),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.grey,size: 30,),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: <Widget>[FlatButton(
            child: _isLoading
                ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
            )
                : Icon(
              Icons.save,
              color: Colors.cyan,
            ),
            onPressed: () => submit(context),
          )
        ],
      ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: _name,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.redAccent,
                  ),
                ),
                hintText: 'Nama Lengkap',
              ),
              onSubmitted: (_) {
                FocusScope.of(context).requestFocus(salaryNode);
              },
            ),
            TextField(
              controller: _salary,
              focusNode: salaryNode,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.redAccent,
                  ),
                ),
                hintText: 'Gaji',
              ),
              onSubmitted: (_) {
                FocusScope.of(context).requestFocus(ageNode);
              },
            ),
            TextField(
              controller: _age,
              focusNode: ageNode,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.redAccent,
                  ),
                ),
                hintText: 'Umur',
              ),
            ),
          ],
        ),
      ),
    );
  }
}