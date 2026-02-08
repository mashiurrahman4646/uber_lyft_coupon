import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PromoCodeController extends GetxController {
  final String promoCode = "SAFE2024";

  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: promoCode));
    Get.snackbar(
      "Success",
      "Promo code copied to clipboard!",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
