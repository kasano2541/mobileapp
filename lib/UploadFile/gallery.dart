import 'package:flutter/material.dart';

import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart'; //DelegatingStream
import 'package:mobileapp/config/config.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UpfromGallery extends StatefulWidget {
  @override
  _UpfromGalleryState createState() => _UpfromGalleryState();
}

class _UpfromGalleryState extends State<UpfromGallery> {

  //--------------------------------------------ControlUpload Start---------------------------------------
  Future upload(File image) async {
    var stream = http.ByteStream(DelegatingStream.typed(image.openRead()));
    var length = await image.length();
    var uri = Uri.parse("${Config.API_URL}/uploadFile"); //ที่อยู่ภายในเครื่อง

//
    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile(
        "image", stream, length, filename: basename(image.path));
//
    request.files.add(multipartFile);
    var response = await request.send();
  }


//--------------------------------------------ControlUpload END---------------------------------------
  File _image;


  Future getCamera() async{
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  Future getGallery() async{
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: new Center(
//          constraints: new BoxConstraints.expand(),
          child: new Card(
            elevation: 3.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.all(
                  new Radius.circular(4.0),
                )
            ),
            child:  new Stack(
                children: <Widget>[
                  //Images--------------------------------------------------------
                  if(_image != null)
                    Image.file(_image)

                ]

            ),
          ),
        ),
      ),

    );
  }
}
