import 'package:bird_guide_app/screens/review_photo_screen.dart';
import 'package:flutter/material.dart';

import 'screens/take_photo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/camera_screen': (context) => const TakePhotoScreen(),
        '/review_photo_screen': (content) => const ReviewPhotoScreen()
      },
      theme: ThemeData(fontFamily: 'Work Sans'),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bird Guide'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('images/home_screen_image.png'),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                SizedBox(
                  width: screenSize.width,
                  height: screenSize.height * 0.05,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade400,
                      shape: const RoundedRectangleBorder(),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.upload, color: Colors.white),
                        SizedBox(width: screenSize.width * 0.02),
                        const Text('Upload Photo', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.02),
                SizedBox(
                  width: screenSize.width,
                  height: screenSize.height * 0.05,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade400,
                      shape: const RoundedRectangleBorder(),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/camera_screen');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.photo_camera, color: Colors.white),
                        SizedBox(width: screenSize.width * 0.02),
                        const Text('Take Photo', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.02),
                SizedBox(
                  width: screenSize.width,
                  height: screenSize.height * 0.05,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade400,
                      shape: const RoundedRectangleBorder(),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.music_note, color: Colors.white),
                        SizedBox(width: screenSize.width * 0.02),
                        const Text('Sound ID', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}