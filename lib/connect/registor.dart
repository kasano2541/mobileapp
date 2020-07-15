import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobileapp/config/config.dart';
import 'package:mobileapp/connect/login.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

//-----------------------alert----------------------------------------------------
  void alert () {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: Text('Some thing went wrong'),
          actions: <Widget>[
            FlatButton(
                onPressed: ()=> Navigator.of(context).pop(),
                child: Text('Close')
            )
          ],
        )
    );
  }

  //------------------------Code setting------------------------------------------

  TextEditingController _userName = TextEditingController();
  TextEditingController _nameTag = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _passWord = TextEditingController();
  TextEditingController _passWord2 = TextEditingController();


  //-------------------------onClick----------------------------------------------

  void onClickLogin() {
    Map<String, String> params = Map();
    params['userName'] = _userName.text;
    params['nameTag'] = _nameTag.text;
    params['email'] = _email.text;
    params['passWord'] = _passWord.text;
    params['password2'] = _passWord2.text;
    if (_email.text == null ) {
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              AlertDialog(
                content: Text('Plase insert Email', style: TextStyle(
                    color: Colors.red
                )
                ),
                actions: <Widget>[
                  FlatButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Close')
                  )
                ],
              )
      );
    } else {
      if (_passWord.text == _passWord2.text) {
        http.post('${Config.API_URL}/user/register', body: params).then((
            response) {
          print(params);
          Map retMap = jsonDecode(response.body);
          int status = retMap['status'];
          print(response.body);

          if (status == 0) {
            Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => Login()),);
          }
        });
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) =>
                AlertDialog(
                  content: Text('Password is Mismatch', style: TextStyle(
                      color: Colors.red
                  )
                  ),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('Close')
                    )
                  ],
                )
        );
      }
    }
  }
//--------------------------------------------------------------------------------
  Widget textFiledUsername(){
    return Container(
      width: 300,
      child: TextField(
        controller: _userName,
        decoration: InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.only(
                  left: 20, right: 20
              ),
            ),
            labelText: 'Username'
        ),
      ),

    );
  }

  Widget textFilednameText(){
    return Container(
      width: 300,
      child: TextField(
        controller: _nameTag,
        decoration: InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.only(
                  left: 20, right: 20
              ),
            ),
            labelText: 'NameText'
        ),
      ),

    );
  }

  Widget textFiledEmail(){
    return Container(
      width: 300,
      child: TextField(
        controller: _email,
        decoration: InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.only(
                  left: 20, right: 20
              ),
            ),
            labelText: 'Email'
        ),
      ),

    );
  }

  Widget textFiledPassword(){
    return Container(
      width: 300,
      child: TextField(
        controller: _passWord,
        decoration: InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.only(
                  left: 20, right: 20
              ),
            ),
            labelText: 'Password'
        ),
      ),

    );
  }

  Widget textFiledConfirm(){
    return Container(
      width: 300,
      child: TextField(
        controller: _passWord2,
        decoration: InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.only(
                  left: 20, right: 20
              ),
            ),
            labelText: 'ConfirmPassword'
        ),
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                SizedBox(
                  height: 55,
                  child: Text('Registor',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 6.0,
                  child: textFiledUsername(),
                ),

                SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 6.0,
                  child: textFilednameText(),
                ),

                SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 6.0,
                  child: textFiledEmail(),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 6.0,
                  child: textFiledPassword(),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 6.0,
                  child: textFiledConfirm(),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: RaisedButton(
                    onPressed: onClickLogin,
                    child: Text('Registor'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) => Login())),
                  child: Text('Login'
                  ),
                ),
              ],
            ),
          )
      ),
      ),
    );
  }
}
