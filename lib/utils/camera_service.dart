import 'package:camera/camera.dart';

class CameraService {
  static var cameras = [];

  static initialize() async {
    cameras = await availableCameras();
  }

  static getCamera({index = 0}) {
    return cameras.length > index ? cameras[index] : throw CameraException("404", "Camera not found");
  }
}