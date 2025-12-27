import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'face_liveness_sdk_stephen_method_channel.dart';

abstract class FaceLivenessSdkStephenPlatform extends PlatformInterface {
  /// Constructs a FaceLivenessSdkStephenPlatform.
  FaceLivenessSdkStephenPlatform() : super(token: _token);

  static final Object _token = Object();

  static FaceLivenessSdkStephenPlatform _instance = MethodChannelFaceLivenessSdkStephen();

  /// The default instance of [FaceLivenessSdkStephenPlatform] to use.
  ///
  /// Defaults to [MethodChannelFaceLivenessSdkStephen].
  static FaceLivenessSdkStephenPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FaceLivenessSdkStephenPlatform] when
  /// they register themselves.
  static set instance(FaceLivenessSdkStephenPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
