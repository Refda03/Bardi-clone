import 'package:flutter/material.dart';
import 'auth.dart';
import '../beranda.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

AuthenticationService service =AuthenticationService(FirebaseAuth.instance);
class AccountSwitcher extends StatelessWidget{
  const AccountSwitcher({Key? key, bool? AccountSwitcher}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return PasswordPrompt();
  }

}
TextEditingController mailTf=TextEditingController();
TextEditingController passTf=TextEditingController();

class PasswordPrompt extends StatelessWidget{






  const PasswordPrompt({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: Text('Enter Password'),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextField(
            controller: mailTf,
            decoration: InputDecoration(
              border:OutlineInputBorder(),
              hintText: 'Email',
            ),
          ),
          TextField(
            obscureText: true,
            controller: passTf,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Password',
            ),
          ),
          ElevatedButton(
            onPressed: () async{

              await service.signIn(email:mailTf.text, password : passTf.text);
              if(service.getUserData()!='null'){
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) =>bardi()),
                        (Route<dynamic>route) => false);
              }
            },
            child: Text('Login'),
          ),
          ElevatedButton(
            onPressed: (){


              service.signUp(email:mailTf.text , password: passTf.text);
            },
            child: Text('SignUp'),
          ),
          ElevatedButton(
            onPressed: (){

              service.signOut();
            },
            child: Text('SignOut'),
          )
        ],

      ),
    );
  }

}