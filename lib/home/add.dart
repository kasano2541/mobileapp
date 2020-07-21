import 'package:mobileapp/connect/SizeConfig.dart';
import 'package:mobileapp/home/home.dart';
import 'package:mobileapp/test/test4.1.1.dart';
import 'package:mobileapp/test/test4.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobileapp/config/config.dart';
import 'package:mobileapp/main.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';




void main() => runApp(new MyApp());
class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

String res;

class _UploadState extends State<Upload> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.blue[600],
            height: 20 * SizeConfig.heightMultiplier,
            child: Center(
              child: RaisedButton(onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: 
                  (BuildContext context) => MyHomePage4())),
                child: Text('Take Photo'),
              ),
              ),
            ),
          Container(
            color: Colors.blue[600],
            height: 20 * SizeConfig.heightMultiplier,
            child: Center(
              child: RaisedButton(onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder:
                  (BuildContext context) => MyHomepage6())),
                child: Text('Take Video'),
              ),
            ),
          ),
          //รายการที่มีอยู่บนระบบของผู้ใช้งาน
          Padding (
            padding: EdgeInsets.only(
                left: 30, right: 10 * SizeConfig.heightMultiplier
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 3 * SizeConfig.heightMultiplier,
                ),
                Container(
                  height: 37 * SizeConfig.heightMultiplier,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      _myAlbumCard("assets/travelfive.png", "assets/traveltwo.png", "assets/travelsix.png", "assets/travelthree.png", "+178", "Best Trip"),
                      _myAlbumCard("assets/travelsix.png", "assets/travelthree.png", "assets/travelfour.png", "assets/travelfive.png", "+18", "Hill Lake Tourism"),
                      _myAlbumCard("assets/travelfive.png", "assets/travelsix.png", "assets/traveltwo.png", "assets/travelone.png", "+1288", "The Grand Canyon"),
                    ],
                  ),
                ),
              ],
            ),
          ),
//          buildPreviewImage(),
//          contorlvidio(),
        ],
      ),
    );
  }




//showImage---------------------------------------------------------------------
  Widget buildPreviewImage() {
    return new Expanded(
        child: new Center(
//          constraints: new BoxConstraints.expand(),
          child: new Card(
            elevation: 3.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.all(
                  new Radius.circular(4.0),
                )
            ),
          ),
        )
    );
  }
  


  //รายการแสดงข้อมูล
  _myAlbumCard(String asset1, String asset2, String asset3, String asset4, String more, String name) {
    return Padding(
        padding: const EdgeInsets.only(left: 40.0),
        child: Container(
            height: 37 * SizeConfig.heightMultiplier,
            width: 60 * SizeConfig.widthMultiplier,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.grey, width: 0.2)
            ),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(asset1,
                              height: 27 * SizeConfig.imageSizeMultiplier,
                              width: 27 * SizeConfig.imageSizeMultiplier,
                              fit: BoxFit.cover,),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(asset2,
                              height: 27 * SizeConfig.imageSizeMultiplier,
                              width: 27 * SizeConfig.imageSizeMultiplier,
                              fit: BoxFit.cover,),
                          ),
                        ],
                      ),
                      SizedBox(height: 1 * SizeConfig.heightMultiplier,),
                      Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(asset3,
                              height: 27 * SizeConfig.imageSizeMultiplier,
                              width: 27 * SizeConfig.imageSizeMultiplier,
                              fit: BoxFit.cover,),
                          ),
                          Spacer(),
                          Stack(
                            overflow: Overflow.visible,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(asset4,
                                  height: 27 * SizeConfig.imageSizeMultiplier,
                                  width: 27 * SizeConfig.imageSizeMultiplier,
                                  fit: BoxFit.cover,),
                              ),
                              Positioned(
                                child: Container(
                                  height: 27 * SizeConfig.imageSizeMultiplier,
                                  width: 27 * SizeConfig.imageSizeMultiplier,
                                  decoration: BoxDecoration(
                                      color: Colors.black38,
                                      borderRadius: BorderRadius.circular(10.0)
                                  ),
                                  child: Center(
                                    child: Text(more, style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 2.5 * SizeConfig.textMultiplier,
                                    ),),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ]
                )
            )
        )
    );
  }
}
