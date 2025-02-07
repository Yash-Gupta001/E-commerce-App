import 'dart:math';
import 'package:app4/controller/cartController.dart';
import 'package:flutter_upi_india/flutter_upi_india.dart';
import 'package:get/get.dart';

class paymentController extends GetxController {
  // Observables for Error Message related to UPI Address
  RxString upiAddrError = ''.obs; 

  // List of available UPI applications
  RxList<ApplicationMeta> apps = <ApplicationMeta>[].obs;


  // Get the cart total from CartController
  CartController cartController = Get.find();

  //(money goes here)
  final String receiverUpiAddress = 'gyash4963-4@oksbi';

  @override
  void onInit() {
    super.onInit();
    _fetchInstalledUpiApps();
  }

  // Fetch installed UPI apps
  Future<void> _fetchInstalledUpiApps() async {
    apps.value = await UpiPay.getInstalledUpiApplications(
        statusType: UpiApplicationDiscoveryAppStatusType.all);
  }

  // // Validate UPI Address (even though user won't input it)
  // String? validateUpiAddress(String value) {
  //   if (value.isEmpty) {
  //     return 'UPI VPA is required.'; 
  //   }
  //   if (value.split('@').length != 2) {
  //     return 'Invalid UPI VPA'; 
  //   }
  //   return null;
  // }

  // Initiate the UPI transaction with the total amount from the cart
  Future<void> initiateTransaction(ApplicationMeta app) async {
    final transactionRef = Random.secure().nextInt(1 << 32).toString();

    // Amount is taken from the CartController
    final amount = cartController.total.value.toString(); 

    try {
      // Initiate the transaction using the selected UPI app
      final result = await UpiPay.initiateTransaction(
        amount: amount,
        app: app.upiApplication,
        receiverName: 'my shop',
        receiverUpiAddress: receiverUpiAddress, 
        transactionRef: transactionRef,
        transactionNote: 'UPI Payment',
      );

      // Handle the result of the transaction here (success/failure)
      if (result.status == UpiTransactionStatus.success) {
        Get.snackbar('Payment Successful', 'Your payment was successful.',
            snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar('Payment Failed', 'Payment failed. Please try again.',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong. Please try again later.',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
