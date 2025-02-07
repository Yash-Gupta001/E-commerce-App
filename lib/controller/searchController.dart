import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SearchCont extends GetxController {
  var selectedImage = Rx<File?>(null); 
  final ImagePicker picker = ImagePicker();

  // To pick an image from the camera
  Future<void> pickImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      
    }
  }
}
