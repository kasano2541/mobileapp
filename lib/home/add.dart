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


  int _counter = 0;
  File _image;
  File _videoCamera;

//------------------------------------Control Upload Start--------------------------------------------------------
  Future upload(File image, File video) async {
    var stream = http.ByteStream(DelegatingStream.typed(image.openRead()));
    var stream2 = http.ByteStream(DelegatingStream.typed(_videoCamera.openRead()));
    var length = await image.length();
    var length2 = await _videoCamera.length();
    var uri = Uri.parse("${Config.API_URL}/uploadFile"); //ที่อยู่ภายในเครื่อง

//
    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile(
        "image", stream, length, filename: basename(image.path));
    var multipartFile2 = new http.MultipartFile(
        "image", stream2, length2, filename: basename(_videoCamera.path));
//
    request.files.add(multipartFile);
    var response = await request.send();
//    print(response.statusCode);

    //-------------แจ้งเตือน--------------
    if (response.statusCode == 200) {

    } else {

    }
  }
//-------------------------------------------------------------------------------------------------
  //------------------------------------Control Upload END--------------------------------------------------------

  VideoPlayerController _cameraVideoPlayerController;

  final GlobalKey<ScaffoldState>_scaffoldState  = new GlobalKey<ScaffoldState>();

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

  Future getVideoCamera() async{
    var video = await ImagePicker.pickVideo(source: ImageSource.camera);
    setState(() {
      _videoCamera = video;
    });
    _cameraVideoPlayerController = VideoPlayerController.file(_videoCamera)..initialize().then((_) {
      setState(() { });
      _cameraVideoPlayerController.play();

    });

  }

  Future getVideoGallery() async{
    var video = await ImagePicker.pickVideo(source: ImageSource.gallery);
    setState(() {
      _videoCamera = video;
    });
    _cameraVideoPlayerController = VideoPlayerController.file(_videoCamera)..initialize().then((_) {
      setState(() { });
      _cameraVideoPlayerController.play();
    });
  }





  void _incrementCounter(){
    // This call to setState tells the Flutter framework that something has
    // changed in this State, which causes it to rerun the build method below
    // so that the display can reflect the updated values. If we changed
    // _counter without calling setState(), then the build method would not be
    // called again, and so nothing would appear to happen.
    setState(() {
      _counter++;
    });
  }

  //Method for show snack bar Message
  void _showSnackBarMsg(String msg){
    _scaffoldState.currentState.showSnackBar(new SnackBar(content: new Text(msg)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          buildButton(),
          buildPreviewImage(),
//          contorlvidio(),
        ],
      ),
    );

  }
//showImage---------------------------------------------------------------------
  Widget buildPreviewImage(){
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
            child:  new Stack(
              children: <Widget>[
                //Images--------------------------------------------------------
                if(_image != null)
                  Image.file(_image)
                else
                //video---------------------------------------------------------

                  if(_videoCamera != null)
                    _cameraVideoPlayerController.value.initialized
                        ?AspectRatio(aspectRatio: _cameraVideoPlayerController.value.aspectRatio,
                      child: VideoPlayer(_cameraVideoPlayerController),
                    )
                        :Container(),
              ],
            ),
          ),
        )
    );
  }


  Widget buildButton(){

    return new Row(
      children: <Widget>[
        new IconButton(
          icon: Icon(Icons.add_a_photo, color: Colors.black,),
          onPressed: getCamera,
        ),
        new IconButton(icon: Icon(Icons.add_photo_alternate),
          onPressed: getGallery,
        ),
        new IconButton(icon: Icon(Icons.videocam),
            onPressed: getVideoCamera),
        new IconButton(icon: Icon(Icons.camera_roll),
            onPressed: getVideoGallery),
        Expanded(
          child: Container(),),
        new IconButton(icon: Icon(Icons.file_upload),
            onPressed: ()
            {
              upload(_image,_videoCamera);
            }
        ),
      ],
    );
  }
//___________________________________play+pause= video but you have video Otherwise code is error
//  Widget contorlvidio(){
//    return new Scaffold(
//        floatingActionButton: FloatingActionButton(
//          onPressed: () {
//            setState(() {
//              if(_cameraVideoPlayerController.value.isPlaying){
//                _cameraVideoPlayerController.pause();
//              }else{
//                _cameraVideoPlayerController.play();
//              }
//            });
//          },
//          child: Icon(
//            _cameraVideoPlayerController.value.isPlaying ? Icons.pause : Icons.play_arrow,
//          )
//      ),
//    );
//  }
//___________________________________play+pause= video but you have video Otherwise code is error
//  _takePhoto() async{
//
//  }
//  _uploadImage() async{
//
//  }
//  _selectGalleryImage() async{
//
//  }
}
