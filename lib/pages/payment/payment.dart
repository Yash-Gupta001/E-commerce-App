import 'package:app4/ui/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app4/controller/cartController.dart';
import 'package:app4/controller/paymentController.dart';

class Payment extends StatelessWidget {
  Payment({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartCont = Get.find();
    final paymentCont = Get.put(paymentController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cart Total
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Obx(() {
                return Text(
                  'Total Amount: ₹${cartCont.total.value}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                );
              }),
            ),
            SizedBox(height: 32),

            // Payment Button
            Obx(() {
              return CustomButton(
                text: 'Pay Now (₹${cartCont.total.value})',
                onPressed: () {
                  if (paymentCont.apps.isNotEmpty) {
                    // Show bottom sheet with available UPI apps
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: EdgeInsets.all(16),
                          height: 300, // Height of the BottomSheet
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Select UPI App',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 16),
                              Expanded( 
                                child: ListView.builder(
                                  itemCount: paymentCont.apps.length,
                                  itemBuilder: (context, index) {
                                    final app = paymentCont.apps[index];
                                    return ListTile(
                                      leading: app.iconImage(30),
                                      title:
                                          Text(app.upiApplication.getAppName()),
                                      onTap: () {
                                        // Initiate the transaction with the selected app
                                        paymentCont.initiateTransaction(app);
                                        Navigator.pop(context);
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    Get.snackbar('Error', 'No UPI apps found on your device.',
                        snackPosition: SnackPosition.BOTTOM);
                  }
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
