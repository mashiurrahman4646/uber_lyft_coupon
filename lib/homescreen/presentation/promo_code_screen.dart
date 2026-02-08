import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../app_colore/app_colore.dart';
import '../../approut.dart';
import '../controller/promo_code_controller.dart';

class PromoCodeScreen extends GetView<PromoCodeController> {
  const PromoCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PromoCodeController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              // Back Button
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Get.offAllNamed(AppRoute.home),
                  icon: Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(Icons.arrow_back_ios_new, color: AppColor.primaryDark, size: 20.sp),
                  ),
                ),
              ),
              
              SizedBox(height: 20.h),
              // Top Icon Section
              _buildSuccessIcon(),
              
              SizedBox(height: 24.h),
              // Title and Subtitle
              Text(
                "You're making a safe choice",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w800,
                  color: AppColor.primaryDark,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Your exclusive promo code is ready to use",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColor.textGray,
                ),
              ),
              
              SizedBox(height: 40.h),
              // Promo Code Card
              _buildPromoCard(),
              
              const Spacer(),
              // Info Box at the bottom
              _buildInfoBox(),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessIcon() {
    return Center(
      child: Stack(
        children: [
          Container(
            height: 120.r,
            width: 120.r,
            decoration: BoxDecoration(
              color: const Color(0xFFFFECCC), // Light orange outer circle
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Center(
              child: Container(
                height: 90.r,
                width: 90.r,
                decoration: const BoxDecoration(
                  color: Color(0xFF0F172A), // Dark middle circle
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.shield,
                    color: Colors.white,
                    size: 40.r,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 5,
            child: Container(
              padding: EdgeInsets.all(6.r),
              decoration: const BoxDecoration(
                color: Color(0xFF1E293B), // Dark circle for checkmark
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 16.r,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        children: [
          Text(
            "Your Promo Code",
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 24.h),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: Text(
                controller.promoCode,
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1E293B),
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          ElevatedButton(
            onPressed: controller.copyToClipboard,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0F172A),
              minimumSize: Size(double.infinity, 56.h),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
              elevation: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.copy_outlined, color: Colors.white, size: 20),
                SizedBox(width: 8.w),
                Text(
                  "Copy Code",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBox() {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF), // Soft blue background
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_rounded, color: const Color(0xFF2563EB), size: 24.sp),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Apply the code inside the ride app before booking",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1E3A8A),
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Active Days: Friday to Sunday\nActive Time: 10:00 PM – 3:00 AM (local time)",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xFF1E40AF),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
