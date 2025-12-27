import 'package:flutter_test/flutter_test.dart';
import 'package:face_liveness_sdk_stephen/face_liveness_sdk_stephen.dart';
import 'package:face_liveness_sdk_stephen/face_liveness_sdk_stephen_platform_interface.dart';
import 'package:face_liveness_sdk_stephen/face_liveness_sdk_stephen_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFaceLivenessSdkStephenPlatform
    with MockPlatformInterfaceMixin
    implements FaceLivenessSdkStephenPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FaceLivenessSdkStephenPlatform initialPlatform = FaceLivenessSdkStephenPlatform.instance;

  test('$MethodChannelFaceLivenessSdkStephen is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFaceLivenessSdkStephen>());
  });

  test('getPlatformVersion', () async {
    FaceLivenessSdkStephen faceLivenessSdkStephenPlugin = FaceLivenessSdkStephen();
    MockFaceLivenessSdkStephenPlatform fakePlatform = MockFaceLivenessSdkStephenPlatform();
    FaceLivenessSdkStephenPlatform.instance = fakePlatform;

    expect(await faceLivenessSdkStephenPlugin.getPlatformVersion(), '42');
  });
}
