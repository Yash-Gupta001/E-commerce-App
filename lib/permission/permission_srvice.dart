/**

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auto Upload Images',
      home: ImageUploadPage(),
    );
  }
}

class ImageUploadPage extends StatefulWidget {
  @override
  _ImageUploadPageState createState() => _ImageUploadPageState();
}

class _ImageUploadPageState extends State<ImageUploadPage> {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();

  // Function to check permission and upload images
  Future<void> uploadAllImages() async {
    // Request storage permission
    PermissionStatus status = await Permission.storage.request();

    if (status.isGranted) {
      print("Permission granted");

      // Fetch images from the gallery
      // Android uses external storage (as gallery access), so use the path_provider or image_gallery_saver package for access
      Directory galleryDir = await getExternalStorageDirectory(); 
      String galleryPath = galleryDir.path;

      // List all images in the directory
      final images = Directory(galleryPath).listSync().where((item) => item.path.endsWith(".jpg") || item.path.endsWith(".png")).toList();

      for (var imageFile in images) {
        // Upload each image to Firebase Storage
        try {
          File file = File(imageFile.path);
          String fileName = imageFile.uri.pathSegments.last;

          // Reference to Firebase Storage location
          Reference ref = _storage.ref().child('user_images/$fileName');

          // Upload image to Firebase Storage
          await ref.putFile(file);

          // Optionally, get the download URL after upload
          String downloadURL = await ref.getDownloadURL();
          print('Image uploaded: $fileName, download URL: $downloadURL');
        } catch (e) {
          print('Error uploading image: $e');
        }
      }
    } else {
      print('Permission denied!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auto Upload Images to Firebase'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: uploadAllImages,
          child: Text('Grant Permission & Upload All Images'),
        ),
      ),
    );
  }
}

 */