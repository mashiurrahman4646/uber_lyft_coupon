import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../app_colore/app_colore.dart';
import '../../approut.dart';

class HomescreenController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void showEmailDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        child: Container(
          padding: EdgeInsets.all(24.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter Email Address",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColor.primaryDark,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Provide your email to get started with the safety program",
                style: TextStyle(fontSize: 12.sp, color: AppColor.textGray),
              ),
              SizedBox(height: 24.h),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "jhon124@gmail.com",
                  filled: true,
                  fillColor: AppColor.fieldBg,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: AppColor.fieldBorder),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              ElevatedButton(
                onPressed: () {
                  Get.back(); // Close Email Dialog
                  showOtpDialog();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryDark,
                  minimumSize: Size(double.infinity, 56.h),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                ),
                child: Text(
                  "Verify",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showOtpDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        child: Container(
          padding: EdgeInsets.all(24.r),
          decoration: BoxDecoration(
            color: const Color(0xFFFFECCC), // Light orange bg for OTP
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter OTP",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColor.primaryDark,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "We have sent a verification code to your email.",
                style: TextStyle(fontSize: 12.sp, color: AppColor.textGray),
              ),
              SizedBox(height: 24.h),
              TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold, letterSpacing: 8),
                decoration: InputDecoration(
                  hintText: "0000",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: AppColor.fieldBorder),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              ElevatedButton(
                onPressed: () {
                  Get.back(); // Close OTP Dialog
                  Get.toNamed(AppRoute.watchVideo);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryDark,
                  minimumSize: Size(double.infinity, 56.h),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                ),
                child: Text(
                  "Verify",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void goToNotifications() {
    Get.toNamed(AppRoute.notifications);
  }

  void goToFinancialHelp() {
    Get.toNamed(AppRoute.financialHelp);
  }

  void goToProfile() {
    Get.toNamed(AppRoute.profile);
  }

  @override
  void onClose() {
    emailController.dispose();
    otpController.dispose();
    super.onClose();
  }
}
