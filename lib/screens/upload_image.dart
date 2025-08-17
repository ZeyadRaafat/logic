import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  XFile? selectedImage;

  Future<void> _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );

    setState(() {
      selectedImage = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(6),
              ),
              child: selectedImage == null
                  ? Center(
                      child: Text(
                        'No Image Selected',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : Image.file(File(selectedImage!.path), fit: BoxFit.cover),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 3, 36, 53),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    selectedImage==null ? 'Select Image' : 'Change Image',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            if (selectedImage != null)
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedImage = null;
                });
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    'Remove Image',
                    style: TextStyle(color: Colors.red, fontSize: 16),
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
