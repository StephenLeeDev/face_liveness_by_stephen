
import 'face_liveness_sdk_stephen_platform_interface.dart';

class FaceLivenessSdkStephen {

  Future<String?> getPlatformVersion() {
    return FaceLivenessSdkStephenPlatform.instance.getPlatformVersion();
  }

  /// Validates the SDK API Key.
  Future<bool> verifyApiKey(String apiKey) {
    // TODO : Connect to Firestore and implement verification logic
    return Future.value(apiKey.isNotEmpty);
  }

}
