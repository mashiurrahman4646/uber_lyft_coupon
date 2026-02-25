import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../app_colore/app_colore.dart';
import '../../approut.dart';
import '../controller/profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
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
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColor.primaryDark,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                _buildHeader(),
                SizedBox(height: 32.h),
                _buildEmailSection(),
                SizedBox(height: 20.h),
                _buildPromoSection(),
                SizedBox(height: 24.h),
                _buildSettingsSection(),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 100.r,
              width: 100.r,
              decoration: const BoxDecoration(
                color: Color(0xFF0F172A),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.person, color: Colors.white, size: 50.r),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Text(
          controller.userName,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w800,
            color: AppColor.primaryDark,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          controller.joinDate,
          style: TextStyle(fontSize: 14.sp, color: AppColor.textGray),
        ),
      ],
    );
  }

  Widget _buildEmailSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Registered Email",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: AppColor.primaryDark.withOpacity(0.7),
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: const Color(0xFFF1F5F9)),
            ),
            child: Text(
              controller.userEmail,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColor.primaryDark,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 4.w, bottom: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Promo Code Status",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColor.primaryDark.withOpacity(0.7),
                ),
              ),
              Icon(
                Icons.confirmation_num_outlined,
                size: 18.sp,
                color: AppColor.textGray,
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: const Color(0xFFF0FDF4), // Light green bg from Figma
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: const Color(0xFFDCFCE7)),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: const BoxDecoration(
                      color: Color(0xFFEA580C),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.check, color: Colors.white, size: 14.sp),
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Available",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF166534),
                        ),
                      ),
                      Text(
                        "Code: ${controller.promoCode}",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xFF15803D),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              const Divider(color: Color(0xFFDCFCE7), height: 1),
              SizedBox(height: 16.h),
              _buildPromoInfoRow("Expires", controller.promoExpiry),
              SizedBox(height: 12.h),
              _buildPromoInfoRow(
                "Discount",
                controller.promoDiscount,
                isGreen: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPromoInfoRow(
    String label,
    String value, {
    bool isGreen = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 13.sp, color: AppColor.textGray),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w700,
            color: isGreen ? const Color(0xFF166534) : AppColor.primaryDark,
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsSection() {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(12.r),
            child: Row(
              children: [
                Icon(
                  Icons.person_outline,
                  size: 18.sp,
                  color: AppColor.primaryDark,
                ),
                SizedBox(width: 8.w),
                Text(
                  "User Information",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColor.primaryDark,
                  ),
                ),
              ],
            ),
          ),
          _buildSettingsItem(
            icon: Icons.person_outline,
            title: "Change User Information",
            onTap: controller.changeUserInfo,
          ),
          SizedBox(height: 8.h),
          _buildSettingsItem(
            icon: Icons.lock_outline,
            title: "Change Password",
            onTap: controller.changePassword,
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        onTap: onTap,
        leading: Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(icon, size: 18.sp, color: const Color(0xFF3B82F6)),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF475569),
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 14.sp,
          color: const Color(0xFF94A3B8),
        ),
      ),
    );
  }
}
