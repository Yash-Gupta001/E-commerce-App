import 'package:app4/controller/userdetailController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app4/pages/MainMenu.dart';

class UserDetail extends StatelessWidget {
  // Controller
  final Userdetailcontroller userController = Get.put(Userdetailcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: Colors.orangeAccent,
        title: Center(
          child: Text(
            'User Details',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 32,
              letterSpacing: 2.0,
            ),
          ),
        ),
        elevation: 10,
      ),

      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/shop.jpg',
              ),
              const SizedBox(height: 10),
              // Name Field
              const Text(
                'Name:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Obx(() => TextFormField(
                    initialValue: userController.name.value,
                    decoration: InputDecoration(
                      hintText: "name",
                      border: OutlineInputBorder(),
                      errorText: userController.isNameValid.value ? null : 'Name cannot be empty',
                    ),
                    onChanged: (value) {
                      userController.name.value = value;
                    },
                  )),
              const SizedBox(height: 16),

              // Email Field
              const Text(
                'Email:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Obx(() => TextFormField(
                    initialValue: userController.email.value,
                    decoration: InputDecoration(
                      hintText: "email",
                      border: OutlineInputBorder(),
                      errorText: userController.isEmailValid.value ? null : 'Enter a valid email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      userController.email.value = value;
                    },
                  )),
              const SizedBox(height: 16),

              // Phone Field
              const Text(
                'Phone Number:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Obx(() => TextFormField(
                    initialValue: userController.no.value,
                    decoration: InputDecoration(
                      hintText: "phone number",
                      border: OutlineInputBorder(),
                      errorText: userController.isPhoneValid.value ? null : 'enter correct number',
                    ),
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      userController.no.value = value;
                    },
                  )),
              const SizedBox(height: 32),

              // Submit Button
              Center(
                  child: SizedBox(
                width: MediaQuery.of(context).size.width *
                    0.9, // 90% of screen width
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                  ),
                  onPressed: () {
                    // Validate the form
                    if (userController.validateUser()) {
                      
                      Get.off(Home());
                    } else {
                      
                      Get.snackbar(
                        'Validation Error',
                        'Please fill out all fields correctly.',
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    }
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      wordSpacing: 2,
                    ),
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
