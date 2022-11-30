import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path/path.dart';

import 'foto_page.dart';


class CameraPage extends StatefulWidget {
  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController controller;

  late List<CameraDescription> cameras;
  late CameraDescription camera;
  Widget cameraPreview = Center(
    child: CircularProgressIndicator(),
  );
  late Image image;

  Future setCamera() async {
    cameras = await availableCameras();
    if (cameras.length != 0) {
      camera = cameras.first;
    }
  }

  @override
  void initState() {
    setCamera().then((_) {
      controller = CameraController(camera, ResolutionPreset.ultraHigh);
      controller.initialize().then((snapshot) {
        cameraPreview = Center(child: CameraPreview(controller));
        setState(() {
          cameraPreview = cameraPreview;
        });
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tire a foto'),
      ),
      body: Container(
        child: Column(
          children: [
            cameraPreview,
          //  TextButton(child: Text("Salvar"), onPressed: (){})
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20),
        child: FloatingActionButton(
          onPressed: () async {
            final image = await controller.takePicture();
            MaterialPageRoute route =
                MaterialPageRoute(builder: (context) => FotoPage(image.path));
            Navigator.push(context, route);
          },
          child: Icon(Icons.camera_alt),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}