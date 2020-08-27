import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main()=> runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  File image;

  Future getImage(bool ifCamera) async {
    File _image;
    if(ifCamera)
    {image=await ImagePicker.pickImage(source: ImageSource.camera);

    }
    else
        {image=await ImagePicker.pickImage(source: ImageSource.gallery);

    }
    setState(() {
      image=image;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          title:Text("camera check"),
        ) ,
        body: Center(child: Column(
          children: <Widget>[ 
            IconButton(icon: Icon(Icons.insert_drive_file), onPressed: (){
              getImage(false);
            },),
            SizedBox(height: 10.0,),

            IconButton(icon: Icon(Icons.camera_alt), onPressed:(){ getImage(true);},),
            
          image==null ? Container() : Image.file(image,height: 300,width: 300,),
          ],
        )),
      ),
    );
  }
}