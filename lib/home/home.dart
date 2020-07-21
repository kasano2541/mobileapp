import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/UploadFile/images.dart';
import 'package:mobileapp/home/add.dart';
import 'package:mobileapp/test/profile.dart';
import 'package:mobileapp/test/test2.dart';
import 'package:mobileapp/test/test3.dart';
import 'package:mobileapp/test/test4.1.1.dart';
import 'package:mobileapp/test/test4.1.dart';
import 'package:mobileapp/test/test4.dart';



class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Widget getItem(BuildContext context, int index){
    return Card(
      child: Column(
        children: <Widget>[Text('data')],
      ),
    );
  }

  ScrollController scrollController;
  bool dialVisible = true;

  int _currentTab = 0;
//--------------------------show on screen------------------------------------
  static const TextStyle optionsStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[

    ProfileFirst(),
    MyHomepage6(),




  ];
//--------------------------show on screen------------------------------------
  void onTabTapped(int index){
    setState(() {
      _currentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Center(
          child:
             _widgetOptions.elementAt(_currentTab),

        ),
      ),


      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blueGrey,

        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Upload())

        ) ,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),

//          BottomNavigationBarItem(
//            icon: Icon(Icons.add),
//            title: Text('Add'),
//          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
        currentIndex: _currentTab,
        onTap: onTabTapped,

      ),
    );

    //------------------------------------------ไม่รู้ว่าใช้งานตรงใหนเพราะลืมแล้ว นานเกิน---------------------------------------------
//    return Scaffold(
//      body: SafeArea(
//        child: Center(
//          child: Column(
//            mainAxisSize: MainAxisSize.min,
//            children: <Widget>[
//              SizedBox(
//                height: 40,
//              ),
//              SizedBox(
//                height: 50,
//                child: Text('Work', style: TextStyle(
//                    color: Colors.black, fontSize: 30.0
//                ),
//                ),
//              ),
//            ],
//
//          ),
//        ),
//      ),
//      bottomNavigationBar: BottomNavigationBar(
//        items: const <BottomNavigationBarItem>[
//          BottomNavigationBarItem(
//            icon: Icon(Icons.home),
//            title: Text('Home'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.add),
//            title: Text('Add'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.person),
//            title: Text('Profile'),
//          ),
//        ],
//
//        currentIndex: _currentTab,
//        onTap: onTabTapped,
//      ),
//
//
//    );
    //------------------------------------------ไม่รู้ว่าใช้งานตรงใหนเพราะลืมแล้ว นานเกิน---------------------------------------------




  }
}
