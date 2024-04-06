import 'package:bird_guide_app/screens/take_photo_screen.dart';
import 'package:flutter/material.dart';

class ReviewPhotoScreen extends StatefulWidget {
  const ReviewPhotoScreen({super.key});

  @override
  State<ReviewPhotoScreen> createState() => _ReviewPhotoScreenState();
}

class _ReviewPhotoScreenState extends State<ReviewPhotoScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ImageArguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bird Guide'),
      ),
      body: Center(
        child: Text(args.getImage().path),
      ),
    );
  }
}