import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class UploadVideo extends StatefulWidget {
  const UploadVideo({super.key});

  @override
  State<UploadVideo> createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {
  XFile? selectedVideo;
  VideoPlayerController? _controller;

  Future<void> _pickVideo() async {
    final XFile? pickedVideo = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );

    if (pickedVideo != null) {
      _controller = VideoPlayerController.file(File(pickedVideo.path));
      await _controller?.initialize();
    }

    setState(() {
      selectedVideo = pickedVideo;
    });

    _controller!.play();
    _controller!.setLooping(true);
  }
  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade900.withRed(9),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 150),
            Container(
              height: 400,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(6),
              ),
              child: selectedVideo == null
                  ? Center(
                      child: Text(
                        'No Video Selected',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: AspectRatio(
                        aspectRatio: _controller!.value.aspectRatio,
                        child: VideoPlayer(_controller!),
                      ),
                    ),
            ),
            SizedBox(height: 100),
            GestureDetector(
              onTap: _pickVideo,
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 3, 36, 53),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    'Upload Video',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
