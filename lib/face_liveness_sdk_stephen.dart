
import 'face_liveness_sdk_stephen_platform_interface.dart';

class FaceLivenessSdkStephen {
  Future<String?> getPlatformVersion() {
    return FaceLivenessSdkStephenPlatform.instance.getPlatformVersion();
  }
}
