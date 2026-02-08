import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../app_colore/app_colore.dart';
import '../../approut.dart';
import '../controller/watchvideoscreencontroller.dart';

class WatchVideoScreen extends GetView<WatchVideoController> {
  const WatchVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensuring controller is available
    Get.put(WatchVideoController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Video Player Section
            _buildVideoSection(),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    SizedBox(height: 16.h),
                    // Safety Journey Card
                    _buildSafetyCard(),
                    
                    SizedBox(height: 24.h),
                    // Progress Section
                    _buildProgressSection(),
                  ],
                ),
              ),
            ),
            
            // Continue Button (at the bottom)
            _buildContinueButton(),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoSection() {
    return Container(
      margin: EdgeInsets.all(20.r),
      height: 200.h,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: GetBuilder<WatchVideoController>(
        builder: (controller) {
          return controller.videoController.value.isInitialized
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    AspectRatio(
                      aspectRatio: controller.videoController.value.aspectRatio,
                      child: VideoPlayer(controller.videoController),
                    ),
                    // Play Overlay
                    if (!controller.videoController.value.isPlaying)
                      InkWell(
                        onTap: controller.playPause,
                        child: Container(
                          padding: EdgeInsets.all(12.r),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFF22C55E), width: 3),
                          ),
                          child: Icon(Icons.play_arrow, color: AppColor.primaryDark, size: 30.sp),
                        ),
                      ),
                  ],
                )
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildSafetyCard() {
    return Container(
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "Your Safety Journey Starts Here",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            "Please watch the full video to continue. This important safety information will help protect you and others.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.white.withOpacity(0.7),
              height: 1.5,
            ),
          ),
          SizedBox(height: 20.h),
          // Receive Code Button
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: Colors.white.withOpacity(0.3)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.play_circle_fill, color: Colors.white, size: 18),
                SizedBox(width: 8.w),
                Text(
                  "Receive Code",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 8.w),
                const Icon(Icons.open_in_new, color: Colors.white, size: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Progress",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.primaryDark,
              ),
            ),
            Obx(() => Text(
              "${(controller.progress.value * 100).toInt()}%",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: AppColor.primaryDark,
              ),
            )),
          ],
        ),
        SizedBox(height: 8.h),
        Obx(() => ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: LinearProgressIndicator(
            value: controller.progress.value,
            minHeight: 8.h,
            backgroundColor: const Color(0xFFE2E8F0),
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF0F172A)),
          ),
        )),
      ],
    );
  }

  Widget _buildContinueButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Obx(() {
        final isFinished = controller.isVideoFinished.value;
        return ElevatedButton(
          onPressed: isFinished ? () => Get.toNamed(AppRoute.promoCode) : null, // Navigate to Promo Code
          style: ElevatedButton.styleFrom(
            backgroundColor: isFinished ? const Color(0xFF94A3B8) : const Color(0xFF94A3B8).withOpacity(0.5),
            minimumSize: Size(double.infinity, 56.h),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
            elevation: 0,
          ),
          child: Text(
            "Continue",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
            ),
          ),
        );
      }),
    );
  }
}
