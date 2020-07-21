import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobileapp/home/home.dart';
import 'package:mobileapp/main.dart';
import 'package:mobileapp/test/test4.1.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart'as http;
import 'package:chewie/chewie.dart';
import '../config/config.dart';


class MyHomepage6 extends StatefulWidget {
  @override
  _MyHomepage6State createState() => _MyHomepage6State();
}

class _MyHomepage6State extends State<MyHomepage6> {

  File _video;
  String status = '';
  File tmpFile;
  String errMessage = 'Error Uploading Image';
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  static final String uploadEndPoint = '${Config.API_URL}/store/upload.php';


  VideoPlayerController _videoPlayerController;


  //This function will helps you pick video from camera
  _pickVideoFromCamera() async{
    File video = await ImagePicker.pickVideo(source: ImageSource.camera);
    _video = video;
    _videoPlayerController = VideoPlayerController.file(_video)..initialize().then((_){
      setState(() { });
        _videoPlayerController.play();
       });
  }

  //This function will helps you pick video from file
  _pickVideo() async{
    File video = await ImagePicker.pickVideo(source: ImageSource.gallery);
    _video = video;
    _videoPlayerController = VideoPlayerController.file(_video)..initialize().then((_){
      setState(() {
        _videoPlayerController.play();
      });

    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(),
        key: scaffoldKey,
//        appBar:AppBar(
//          title:Text('Upload image'),
//        ),
        body:SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height*(100/200),
                      width: MediaQuery.of(context).size.width*(90/100),
                      child: _video == null?Center(
                        child: Text('No Video Selected'),

                      ):FittedBox(
                        fit: BoxFit.contain,child: mounted?Chewie(
                          controller: ChewieController(
                            videoPlayerController: VideoPlayerController.file(_video),
                            aspectRatio: 3/2,
                            autoPlay: true,
                            looping: false,
                          ),
                      ):Container(),
                      ),

                    ),
                    SizedBox(
                      height: 5,
                    ),
                    _buildButtons()
                  ]
              ),

            ]
          )
        )
    );
  }

  Widget _buildButtons() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new IconButton(
            icon: Icon(Icons.camera),
            onPressed: _pickVideoFromCamera,
            tooltip: 'Take photo',
          ),
          new IconButton(
            icon: Icon(Icons.file_upload),
            onPressed: startUpload,
            tooltip: 'Upload image',
          ),
          new IconButton(
            icon: Icon(Icons.image),
            onPressed: _pickVideo,
            tooltip: 'Select from gallery',
          ),
        ],
      ),
    );
  }



  setStatus(String message){
    setState(() {
      status = message;
    });
  }

  _showSnackbar(String text) => scaffoldKey.currentState?.showSnackBar(
    new SnackBar(
      content: new Text(text),
    ),
  );

  startUpload(){
    setStatus('Upload Image...');
    if(null == _video){
      setStatus(errMessage);
      return _showSnackbar('Please select image');
    }
    String fileName = _video.path.split('/').last;
    upload(fileName);
  }

  upload(String fileName){
    http.post(uploadEndPoint, body: {
      "image": _video,
      "name": fileName,
    }).then((result){
      setStatus(result.statusCode == 200 ? result.body : errMessage);
      _showSnackbar('Image uploaded, imageUrl = $status');
    }).catchError((error){
      setStatus(error);
      _showSnackbar('Image failed: ${setStatus(status)}');
    });
  }

}


