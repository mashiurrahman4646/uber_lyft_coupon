import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeNameController extends GetxController {
  final TextEditingController nameController = TextEditingController();

  void saveName() {
    if (nameController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter a name",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
      return;
    }

    // Simulate update
    Get.snackbar(
      "Success",
      "Name updated successfully!",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.8),
      colorText: Colors.white,
    );

    // Navigate back
    Future.delayed(const Duration(seconds: 1), () {
      Get.back();
    });
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}
