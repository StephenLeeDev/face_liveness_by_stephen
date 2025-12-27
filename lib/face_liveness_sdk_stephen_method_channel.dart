import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'face_liveness_sdk_stephen_platform_interface.dart';

/// An implementation of [FaceLivenessSdkStephenPlatform] that uses method channels.
class MethodChannelFaceLivenessSdkStephen extends FaceLivenessSdkStephenPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('face_liveness_sdk_stephen');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
