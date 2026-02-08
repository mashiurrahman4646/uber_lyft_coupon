import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class WatchVideoController extends GetxController {
  late VideoPlayerController videoController;
  final RxDouble progress = 0.0.obs;
  final RxBool isVideoFinished = false.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    videoController = VideoPlayerController.asset('assets/videos/carride.mp4');
    
    try {
      await videoController.initialize();
      videoController.addListener(_videoListener);
      videoController.play();
      update();
    } catch (e) {
      Get.snackbar("Error", "Could not load video: $e");
    }
  }

  void _videoListener() {
    if (videoController.value.isInitialized) {
      final double currentPosition = videoController.value.position.inMilliseconds.toDouble();
      final double totalDuration = videoController.value.duration.inMilliseconds.toDouble();
      
      if (totalDuration > 0) {
        progress.value = (currentPosition / totalDuration).clamp(0.0, 1.0);
      }

      // Check if finished
      if (videoController.value.position >= videoController.value.duration) {
        isVideoFinished.value = true;
      }
      update();
    }
  }

  void playPause() {
    if (videoController.value.isPlaying) {
      videoController.pause();
    } else {
      videoController.play();
    }
    update();
  }

  @override
  void onClose() {
    videoController.removeListener(_videoListener);
    videoController.dispose();
    super.onClose();
  }
}
