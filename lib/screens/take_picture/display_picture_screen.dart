import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';

class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;

  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

  @override
  _DisplayPictureScreenState createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  FaceDetector faceDetector;
  FirebaseVisionImage visionImage;
  List<FaceContour> facesContours = [];
  Future<void> processing;

  @override
  void initState() {
    super.initState();
    faceDetector = FirebaseVision.instance.faceDetector();
    processing = processFaceLandmarks();
  }

  processFaceLandmarks() async {
    visionImage = FirebaseVisionImage.fromFilePath(widget.imagePath);
    final faces = await faceDetector.processImage(visionImage);
    facesContours =
        faces.map((e) => e.getContour(FaceContourType.allPoints)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display the Picture')),
      body: FutureBuilder(
        future: processing,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Image.file(File(widget.imagePath));
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
