import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:image_picker/image_picker.dart';

class MyHomePage4 extends StatefulWidget {
  @override
  _MyHomePage4State createState() => _MyHomePage4State();
}

class _MyHomePage4State extends State<MyHomePage4> {


  static final String uploadEndPoint = 'http://192.168.1.115/store/upload.php';
  Future<File> fileImage;
  String status = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Image';
  final scaffoldKey = new GlobalKey<ScaffoldState>();


  Widget _buildPreviewImage() {

    return new FutureBuilder<File>(
      future: fileImage,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          tmpFile = snapshot.data;
          base64Image = base64Encode(snapshot.data.readAsBytesSync());
          return Flexible(
            child: Image.file(
              snapshot.data,
              fit: BoxFit.fill,
            ),
          );
        } else if (null != snapshot.error) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.center,

          );
        }
      },
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
            onPressed: _takePhoto,
            tooltip: 'Take photo',
          ),
          new IconButton(
            icon: Icon(Icons.file_upload),
            onPressed: startUpload,
            tooltip: 'Upload image',
          ),
          new IconButton(
            icon: Icon(Icons.image),
            onPressed: _selectGalleryImage,
            tooltip: 'Select from gallery',
          ),
        ],
      ),
    );
  }

  _takePhoto() async {
    setState(() {
      fileImage = ImagePicker.pickImage(source: ImageSource.camera);
    });
  }

  _selectGalleryImage() async {
    setState(() {
      fileImage = ImagePicker.pickImage(source: ImageSource.gallery);
    });
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
    if(null == tmpFile){
      setStatus(errMessage);
      return _showSnackbar('Please select image');
    }
    String fileName = tmpFile.path.split('/').last;
    upload(fileName);
  }

  upload(String fileName){
    http.post(uploadEndPoint, body: {
      "image": base64Image,
      "name": fileName,
    }).then((result){
      setStatus(result.statusCode == 200 ? result.body : errMessage);
      _showSnackbar('Image uploaded, imageUrl = $status');
    }).catchError((error){
      setStatus(error);
      _showSnackbar('Image failed: ${setStatus(status)}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text('Upload image'),
      ),
      body: new Column(
        children: <Widget>[
          _buildPreviewImage(),
          _buildButtons(),
        ],
      ),

    );
  }
}

