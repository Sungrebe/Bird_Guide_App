import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class TakePhotoScreen extends StatefulWidget {
  const TakePhotoScreen({super.key});

  @override
  State<TakePhotoScreen> createState() => _TakePhotoScreenState();
}

class _TakePhotoScreenState extends State<TakePhotoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: availableCameras(),
        builder: (context, snapshot) {
          Widget output;

          switch (snapshot.connectionState) {
            case ConnectionState.none:
              output = const Text('Could not get access to device camera.');
              break;
            case ConnectionState.waiting:
              output = const CircularProgressIndicator();
              break;
            case ConnectionState.active:
            case ConnectionState.done:
              output = DeviceCamera(camera: snapshot.data![0]);
              break;
          }

          return Center(child: output);
        },
      ),
    );
  }
}

class DeviceCamera extends StatefulWidget {
  final CameraDescription camera;
  const DeviceCamera({super.key, required this.camera});

  @override
  State<DeviceCamera> createState() => _DeviceCameraState();
}

class _DeviceCameraState extends State<DeviceCamera> {
  late CameraController _controller;

  @override
  void initState() {
    super.initState();
    
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.ultraHigh,
      imageFormatGroup: ImageFormatGroup.jpeg
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _controller.initialize(), 
      builder: (context, snapshot) {
        return CameraPreview(_controller);
      },
    );
  }
}