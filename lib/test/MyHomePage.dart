//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
//
//import 'package:flutter_boom_menu/flutter_boom_menu.dart';
//import 'package:gradient_app_bar/gradient_app_bar.dart';
//
//void main() {
//  runApp(MaterialApp(home: MyApp1(), title: 'Boom Menu Example'));
//}
//
//class MyApp1 extends StatefulWidget {
//  @override
//  MyAppState createState() => MyAppState();
//}
//
//class MyAppState extends State<MyApp1> with TickerProviderStateMixin {
//  ScrollController scrollController;
//  bool scrollVisible = true;
//
//  @override
//  void initState() {
//    super.initState();
//
//    scrollController = ScrollController()
//      ..addListener(() {
//        setDialVisible(scrollController.position.userScrollDirection == ScrollDirection.forward);
//      });
//  }
//
//  void setDialVisible(bool value) {
//    setState(() {
//      scrollVisible = value;
//    });
//  }
////--------------------------------หน้าแสดงข้อมูล
//  Widget buildBody() {
//    return ListView.builder(
//      controller: scrollController,
//      itemCount: 30,
//      itemBuilder: (ctx, i) => ListTile(title: Text('Item $i')),
//    );
//  }
////----------------------------ปุ่มการเลือก (FAB)
//  BoomMenu buildBoomMenu() {
//    return BoomMenu(
//        animatedIcon: AnimatedIcons.menu_close,
//        animatedIconTheme: IconThemeData(size: 22.0),
//        //child: Icon(Icons.add),
//        onOpen: () => print('OPENING DIAL'),
//        onClose: () => print('DIAL CLOSED'),
//        scrollVisible: scrollVisible,
//        overlayColor: Colors.black,
//        overlayOpacity: 0.7,
//        children: [
//          MenuItem(
//          child: Icon(Icons.power_settings_new, color: Colors.black, size: 40,),
////            child: Image.asset('assets/logout_icon.png', color: Colors.grey[850]),
//            title: "Logout",
//            titleColor: Colors.grey[850],
//            subtitle: "Lorem ipsum dolor sit amet, consectetur",
//            subTitleColor: Colors.grey[850],
//            backgroundColor: Colors.grey[50],
//            onTap: () => print('THIRD CHILD'),
//          ),
//          MenuItem(
//            child: Icon(Icons.list, color: Colors.black, size: 40,),
////            child: Image.asset('assets/schemes_icon.png', color: Colors.white),
//            title: "List",
//            titleColor: Colors.white,
//            subtitle: "Lorem ipsum dolor sit amet, consectetur",
//            subTitleColor: Colors.white,
//            backgroundColor: Colors.pinkAccent,
//            onTap: () => print('FOURTH CHILD'),
//          ),
//          MenuItem(
//            child: Icon(Icons.group, color: Colors.black, size: 40,),
////            child: Image.asset('assets/customers_icon.png', color: Colors.grey[850]),
//            title: "Team",
//            titleColor: Colors.grey[850],
//            subtitle: "Lorem ipsum dolor sit amet, consectetur",
//            subTitleColor: Colors.grey[850],
//            backgroundColor: Colors.grey[50],
//            onTap: () => print('THIRD CHILD'),
//          ),
//          MenuItem(
//            child: Icon(Icons.person, color: Colors.black, size: 40,),
////            child: Image.asset('assets/profile_icon.png', color: Colors.white),
//            title: "Profile",
//            titleColor: Colors.white,
//            subtitle: "Lorem ipsum dolor sit amet, consectetur",
//            subTitleColor: Colors.white,
//            backgroundColor: Colors.blue,
//            onTap: () => print('FOURTH CHILD'),
//          )
//        ]
//    );
//  }
//
//  Widget ButtomNavigationbar (){
//    return Scaffold(
//        bottomNavigationBar: BottomNavigationBar(
////          child: Row(
////            mainAxisSize: MainAxisSize.max,
////            mainAxisAlignment: MainAxisAlignment.spaceBetween,
////            children: <Widget>[],
////          ),
////          notchedShape: CircularNotchedRectangle(),
////          color:Colors.blueGrey,
//        )
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: GradientAppBar(title: Text('Boom Menu Example')),
//      body: buildBody(),
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//      floatingActionButton: buildBoomMenu(),
//
//    );
//  }
//}