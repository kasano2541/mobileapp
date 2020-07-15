import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mobileapp/connect/registor.dart';
import 'package:mobileapp/home/home.dart';
import 'package:mobileapp/main.dart';
import 'package:mobileapp/test/MyHomePage.dart';

import '../config/config.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
//------------------------Code setting------------------------------------------


//-------------------------Function Onclick
  TextEditingController _userName = TextEditingController();
  TextEditingController _passWord = TextEditingController();

  void onClickLogin() {
    Map<String, String> params = Map();
    params['userName'] = _userName.text;
    params['passWord'] = _passWord.text;
    http.post('${Config.API_URL}/user/login', body: params).then((res){
      Map retMap = jsonDecode(res.body);
      int status =retMap['status'];
      print(res.body);
      if(status == 0){
        Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => Home()),);
      }else{
        showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              content: Text('User or Password incorrect', style: TextStyle(
                  color: Colors.red
              ),
              ),
              actions: <Widget>[
                FlatButton(
                    onPressed: ()=> Navigator.of(context).pop(),
                    child: Text('Close')
                )
              ],
            )
        );
      }
    });
  }

//------------------------------------------------------------------------------
  Widget textFiledUsername(){
    return Container(
      width: 300,
      child: TextField(
        controller: _userName,
        decoration: InputDecoration(
            icon: Icon(Icons.person,
              color: Colors.black,
            ),
            border: InputBorder.none,
//            prefixIcon: Padding(
//              padding: EdgeInsets.only(
//                  left: 20, right: 20
//              ),
//            ),
            labelText: 'Username'
        ),
      ),

    );
  }

  Widget textFiledPassword(){
    return Container(
      width: 300,
      child: TextField(
        obscureText: true,
        controller: _passWord,
        decoration: InputDecoration(
            icon: Icon(Icons.lock,
              color: Colors.black,
            ),
            border: InputBorder.none,
//            prefixIcon: Padding(
//              padding: EdgeInsets.only(
//                  left: 20, right: 20
//              ),
//            ),
            labelText: 'Password'
        ),
      ),

    );
  }



//------------------------Show on Phone-----------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 50,
                  child: Text('Login',
                    style: TextStyle(
                        color: Colors.black, fontSize: 30.0
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Card(
                    elevation: 6.0,
                    child: textFiledUsername()
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                    elevation: 6.0,
                    child: textFiledPassword()
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: RaisedButton(onPressed: onClickLogin,
                    child: Text('Login'
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                FlatButton(

                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) => Register())),
                  child: Text('Registor',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
