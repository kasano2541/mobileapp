import 'package:mobileapp/home/home.dart';
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

          buildPreviewImage(),
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
}
