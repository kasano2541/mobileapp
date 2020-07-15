import 'package:flutter/material.dart';
import 'package:mobileapp/connect/SizeConfig.dart';
import 'package:mobileapp/connect/login.dart';
import 'package:mobileapp/home/profile.dart';
import 'package:mobileapp/test/MyHomePage.dart';
import 'package:mobileapp/test/profile.dart';

  void main() {
    runApp(MyApp());
  }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return LayoutBuilder(
        builder: (context, constraints){
          return OrientationBuilder(
              builder: (context, orientation){
                SizeConfig().init(constraints, orientation);
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: Login(),

                );
              }
          );
        }
    );
  }
}