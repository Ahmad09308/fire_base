import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ImagePicker _picker = ImagePicker();
  FirebaseStorage storage = FirebaseStorage.instance;
  String? _downloadURL;

  Future<void> _uploadImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File file = File(pickedFile.path);
      try {

        Reference ref = storage.ref().child('images/${pickedFile.name}');
        

        UploadTask uploadTask = ref.putFile(file);
        await uploadTask;

        String downloadURL = await ref.getDownloadURL();
        setState(() {
          _downloadURL = downloadURL;
        });

        print('File uploaded successfully: $downloadURL');
      } catch (e) {
        print('Failed to upload file: $e');
      }
    } else {
      print('No image selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _uploadImage,
              child: Text('Upload Image'),
            ),
            if (_downloadURL != null)
              Image.network(_downloadURL!),
          ],
        ),
      ),
    );
  }
}
