import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';






class images extends StatefulWidget {
  @override
  _imagesState createState() => _imagesState();
}

class _imagesState extends State<images> {



//--------------------------ฺBottomNavigationBar Setting------------------------------------
  int _currentTab = 0;
//--------------------------show on screen------------------------------------
  static const TextStyle optionsStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[

    Text(
      'Home', style: optionsStyle,
    ),



  ];
//--------------------------show on screen------------------------------------
  void onTabTapped(int index){
    setState(() {
      _currentTab = index;
    });
  }
  //--------------------------ฺBottomNavigationBar Setting-------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Upload"),
        ),
        body: SafeArea(
          child: Center(
            child:
            _widgetOptions.elementAt(_currentTab),

          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                title: Text("คลัง"), icon: Icon(Icons.photo)),
            BottomNavigationBarItem(
                title: Text("รูปภาพ"), icon: Icon(Icons.photo_camera)),
            BottomNavigationBarItem(
                title: Text("วิดีโอ"), icon: Icon(Icons.videocam)),

          ],
          currentIndex: _currentTab,
          onTap: onTabTapped,
        )

    );
  }
}


