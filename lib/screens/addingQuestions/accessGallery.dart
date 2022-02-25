// ignore_for_file: prefer_const_constructors, unnecessary_new


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class GalleryAccess extends StatefulWidget {
 const GalleryAccess({ Key? key, }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new GalleryAccessState();
  }
}
  
class GalleryAccessState extends State<GalleryAccess> {
  XFile? galleryFile;
 
  
  @override
  Widget build(BuildContext context) {
    
    // File file = File(galleryFile!.path);
    // if(file ==null){
    //   print("No File is there");
    // }
    // //display image selected from gallery
    // else{
      
    // }
    imageSelectorGallery() async {
      galleryFile = (await ImagePicker().pickImage(
        source: ImageSource.gallery,
        // maxHeight: 50.0,
        // maxWidth: 50.0,
      ))!;
      setState(() {
    
      });
    }
  
    return  new Builder(
        builder: (BuildContext context) {
          return Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new RaisedButton(
                  child: new Text('Select Image from Gallery'),
                  onPressed: imageSelectorGallery,
                ),
                SizedBox(
                  height: 200.0,
                  width: 300.0,
                  child: galleryFile == null
                      ? Center(child: new Text('Sorry nothing selected!!'))
                      : Center(child: new Image.file(File(galleryFile!.path)),
                )
                )],
            ),
          );
          },
      );
  }
}