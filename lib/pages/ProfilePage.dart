import 'package:app4/controller/userdetailController.dart';
import 'package:app4/ui/ui_component/CustomAppbar.dart';
import 'package:app4/ui/ui_component/custom_navigation_bar.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the Userdetailcontroller instance
    final Userdetailcontroller userController = Get.put(Userdetailcontroller());

    return Scaffold(
            appBar: CustomAppbar(title: 'Profile'),

      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Name:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Obx(() => Text(userController.name.value)), // Display name here
        
                const SizedBox(height: 16),
                const Text(
                  'Email:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Obx(() => Text(userController.email.value)), // Display email here
        
                const SizedBox(height: 16),
                const Text(
                  'Phone Number:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Obx(() => Text(userController.no.value)), // Display phone number here
              ],
            ),
          ),
        ),
      ),

      // Floating Action Button with logout confirmation
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Show confirmation dialog using GetX
          userController.showLogoutDialog();  // Correctly calling the controller method
        },
        backgroundColor: Colors.orange,
        icon: const Icon(Icons.exit_to_app_outlined, color: Colors.white),
        label: const Text(
          'Logout',
          style: TextStyle(color: Colors.white),
        ),
      ),

      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 4, 
        onTap: (int index) {
          // Add navigation logic if needed
        },
      ),
    );
  }
}
