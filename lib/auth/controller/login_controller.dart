import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../approut.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  var isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void login() {
    // Implement login logic
    print("Email: ${emailController.text}");
    print("Password: ${passwordController.text}");
    
    // Navigate to Home screen on success
    Get.offAllNamed(AppRoute.home);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
