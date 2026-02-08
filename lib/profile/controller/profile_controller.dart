import 'package:get/get.dart';
import '../../approut.dart';

class ProfileController extends GetxController {
  final String userName = "Road Safety User";
  final String joinDate = "Member since Jan 2024";
  final String userEmail = "user@example.com";
  
  final String promoCode = "SAFETY2024";
  final String promoExpiry = "Dec 31, 2024";
  final String promoDiscount = "20% Off";
  final bool isPromoAvailable = true;

  void changeUserInfo() {
    Get.toNamed(AppRoute.changeName);
  }

  void changePassword() {
    Get.toNamed(AppRoute.changePassword);
  }
}
