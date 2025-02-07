import 'package:app4/pages/auth/userdetails.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';  // Ensure this import is present


class Userdetailcontroller extends GetxController{
  RxString name = "".obs;
  RxString no = "".obs;
  RxString email = "".obs;

  var isNameValid = true.obs;
  var isEmailValid = true.obs;
  var isPhoneValid = true.obs;

  bool validateUser() {
    // Validate Name (Must not be empty)
    isNameValid.value = name.value.isNotEmpty;

    // Validate Email 
    isEmailValid.value = RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email.value);

    // Validate Phone 
    isPhoneValid.value = no.value.isNotEmpty && no.value.length == 10;

    return isNameValid.value && isEmailValid.value && isPhoneValid.value;
  }

  // Simplified function to show the confirmation dialog using GetX
  void showLogoutDialog() {
    Get.defaultDialog(
      title: 'Logout',
      content: const Text('Are you sure you want to logout?'),
      barrierDismissible: false, // Disable dismissing by tapping outside
      actions: [
        TextButton(
          onPressed: () {
            // If user selects 'No', close the dialog
            Get.back();
          },
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () {
            Get.offAll(UserDetail());
          },
          child: const Text('Yes'),
        ),
      ],
    );
  }
}


