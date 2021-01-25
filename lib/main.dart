import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ai_vision_template/screens/home_screen.dart';
import 'package:ai_vision_template/screens/take_picture/take_picture_screen.dart';

import 'utils/camera_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CameraService.initialize();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => HomeScreen(),
        "/take_picture": (context) => TakePictureScreen(camera: CameraService.getCamera(index: 1))
      },
    );
  }
}