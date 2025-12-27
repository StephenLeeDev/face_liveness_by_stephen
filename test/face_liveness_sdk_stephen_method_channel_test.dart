import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:face_liveness_sdk_stephen/face_liveness_sdk_stephen_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelFaceLivenessSdkStephen platform = MethodChannelFaceLivenessSdkStephen();
  const MethodChannel channel = MethodChannel('face_liveness_sdk_stephen');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
