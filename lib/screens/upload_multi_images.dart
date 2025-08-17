import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadMultiImages extends StatefulWidget {
  const UploadMultiImages({super.key});

  @override
  State<UploadMultiImages> createState() => _UploadMultiImagesState();
}

class _UploadMultiImagesState extends State<UploadMultiImages> {
  List<XFile?> selectedImages = [null, null, null];

  Future<void> _pickImages() async {
    final List<XFile> pickedImages = await ImagePicker().pickMultiImage(maxWidth: 600);

    if(pickedImages.length > 3) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You can only select up to 3 images.')),
      );
      return;
    }

    final limitedImages = pickedImages.take(3).toList();

    for (int i = 0; i < 3; i++) {
      selectedImages[i] = i < limitedImages.length ? limitedImages[i] : null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            SizedBox(height: 200),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(3, (index) {
                  return Container(
                    height: 150,
                    width: 150,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: selectedImages[index] == null
                        ? Center(
                            child: Text(
                              'No Image Selected',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        : Image.file(
                            File(selectedImages[index]!.path),
                            fit: BoxFit.cover,
                          ),
                  );
                }),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: _pickImages,
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 3, 36, 53),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    'Select Image',
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
