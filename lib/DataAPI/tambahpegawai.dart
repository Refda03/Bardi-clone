import 'dart:convert';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditProduct extends StatelessWidget {
final Map product;
final snackbarKey = GlobalKey<ScaffoldState>();

EditProduct({required this.product});
GlobalKey<FormState> _formKey = GlobalKey<FormState>();
TextEditingController _nameController = TextEditingController();
TextEditingController _descriptionController = TextEditingController();
TextEditingController _priceController = TextEditingController();

Future updateProduct() async {
  final response = await http.put(
      Uri.parse("http://127.0.0.1:8000/api/products/" + product['id'])
          body: {
          "name": _nameController.text,
          "description": _descriptionController.text,
          "price": _priceController.text,
        });
        print(response.body);
        return json.decode (response.body);
      }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
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
      ),
    ),
      body: Form(
        key: _formKey,
        child: Column(
          children :[
            TextFormField(
              controller: _nameController..text = product['name'],
              decoration: InputDecoration (labelText: "Name"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter product name";
                }
                return null;
              }
            ),
            TextFormField(
                controller: _priceController..text = product['price'],
                decoration: InputDecoration (labelText: "Price"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter product price";
                  }
                  return null;
                }
            ),
            TextFormField(
                controller: _descriptionController..text = product['description'],
                decoration: InputDecoration (labelText: "Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter product name";
                  }
                  return null;
                }
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                    if (_formkey.currentState.validate()) {
                    updateProduct().then((value) {
                      Navigator.push(context,
                        MaterialPageRoute (builder: (context) => HomePage())
                    });
                  }
                }
                child: Text('Update'))
          ],
        )
      )
    );
  }
}
