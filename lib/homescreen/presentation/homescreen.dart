import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../app_colore/app_colore.dart';
import '../../../app_text/app_text.dart';
import '../../../approut.dart';
import '../controller/homescreen_controller.dart';

class Homescreen extends GetView<HomescreenController> {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Putting controller here for demonstration, usually put in Binding
    Get.put(HomescreenController());
    
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: AppColor.white,
      drawer: _buildDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildBanner(),
              _buildHowItWorks(),
              _buildApplyFinanceHelp(),
              _buildStatsSection(),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      child: Row(
        children: [
          // Menu Button to the LEFT (3 dashed lines/menu icon)
          InkWell(
            onTap: controller.openDrawer,
            child: Icon(Icons.menu, size: 28.sp, color: AppColor.primaryDark),
          ),
          SizedBox(width: 16.w),
          // Profile Pic
          ClipRRect(
            borderRadius: BorderRadius.circular(22.r),
            child: Image.asset(
              'assets/image/zara.png',
              height: 44.h,
              width: 44.w,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => CircleAvatar(
                radius: 22.r,
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.person, size: 24.sp, color: AppColor.primaryDark),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello Zara",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColor.primaryDark,
                ),
              ),
              Text(
                "Welcome to App",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColor.textGray,
                ),
              ),
            ],
          ),
          const Spacer(),
          // Notification Icon
          InkWell(
            onTap: controller.goToNotifications,
            borderRadius: BorderRadius.circular(25.r),
            child: Container(
              padding: EdgeInsets.all(10.r),
              decoration: const BoxDecoration(
                color: Color(0xFFF1F5F9),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.notifications_none, size: 24.sp, color: AppColor.primaryDark),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      height: 180.h,
      width: double.infinity,
      child: Stack(
        children: [
          // Background Image
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset(
              'assets/image/careroad.png',
              width: double.infinity,
              height: 180.h,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColor.primaryDark,
                ),
              ),
            ),
          ),
          // Content with Gradient Overlay
          Container(
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.4), Colors.transparent],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Choose Safety, Get Home Safe.",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Watch a short video about responsible choices and unlock your ride discount",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white.withOpacity(0.9),
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 16.h),
                InkWell(
                  onTap: controller.showEmailDialog,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: Colors.white.withOpacity(0.5)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.play_circle_fill, color: Colors.white, size: 20),
                        SizedBox(width: 8.w),
                        Text(
                          "Watch Video",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        const Icon(Icons.open_in_new, color: Colors.white, size: 14),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHowItWorks() {
    return Padding(
      padding: EdgeInsets.all(24.r),
      child: Column(
        children: [
          Text(
            "How It Works",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: AppColor.primaryDark,
            ),
          ),
          SizedBox(height: 24.h),
          _buildWorkItem(
            image: 'assets/icons/email.png',
            title: "Enter Email",
            desc: "Provide your email to get started with the safety program",
          ),
          SizedBox(height: 16.h),
          _buildWorkItem(
            image: 'assets/icons/video.png',
            title: "Watch Full Video",
            desc: "View the complete safety awareness video content",
          ),
          SizedBox(height: 16.h),
          _buildWorkItem(
            icon: Icons.directions_car_filled,
            title: "Get Ride Discount",
            desc: "Receive your Uber or Lyft discount code for a safe ride home",
          ),
        ],
      ),
    );
  }

  Widget _buildWorkItem({String? image, IconData? icon, required String title, required String desc}) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 54.h,
            width: 54.w,
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B), // Dark box from Figma
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: image != null 
              ? Padding(
                  padding: EdgeInsets.all(12.r),
                  child: Image.asset(
                    image, 
                    color: Colors.white, // Ensure icon is white
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Icon(Icons.image_not_supported, color: Colors.white54, size: 24.sp),
                  ),
                )
              : Icon(icon, color: Colors.white, size: 28.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColor.primaryDark,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  desc,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColor.textGray,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildApplyFinanceHelp() {
    return InkWell(
      onTap: controller.goToFinancialHelp,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        margin: EdgeInsets.all(24.r),
        width: double.infinity,
        height: 56.h,
        decoration: BoxDecoration(
          color: const Color(0xFF0F172A),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Apply for Financial Help",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 12.w),
            Icon(Icons.arrow_outward, color: Colors.white, size: 20.sp),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  "15,000+",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColor.primaryDark,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "Safe Rides Funded",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColor.textGray,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 40.h,
            width: 1,
            color: const Color(0xFFCBD5E1),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  "100%",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF22C55E),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "Nonprofit Initiative",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColor.textGray,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF0F172A),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25.r),
                  child: Image.asset(
                    'assets/image/zara.png',
                    height: 50.h,
                    width: 50.w,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => CircleAvatar(radius: 25.r, child: Text("Z")),
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  "Zara",
                  style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w700),
                ),
                Text(
                  "zara@gmail.com",
                  style: TextStyle(color: Colors.white70, fontSize: 12.sp),
                ),
              ],
            ),
          ),
          _buildDrawerItem(
            icon: Icons.person_outline,
            title: "User Information",
            onTap: () {
              Get.back();
              controller.goToProfile();
            },
          ),
          _buildDrawerItem(
            icon: Icons.logout,
            title: "Logout",
            onTap: () {
              Get.offAllNamed(AppRoute.login);
            },
          ),
          _buildDrawerItem(
            icon: Icons.delete_outline,
            title: "Delete Account",
            color: Colors.red,
            onTap: () {
              Get.back();
              // Show delete dialog
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({required IconData icon, required String title, required VoidCallback onTap, Color? color}) {
    return ListTile(
      leading: Icon(icon, color: color ?? AppColor.primaryDark),
      title: Text(
        title,
        style: TextStyle(
          color: color ?? AppColor.primaryDark,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }
}
