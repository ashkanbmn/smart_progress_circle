import 'package:flutter_test/flutter_test.dart';
import 'package:smart_progress_circle/smart_progress_circle.dart';
import 'package:smart_progress_circle/smart_progress_circle_platform_interface.dart';
import 'package:smart_progress_circle/smart_progress_circle_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSmartProgressCirclePlatform
    with MockPlatformInterfaceMixin
    implements SmartProgressCirclePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SmartProgressCirclePlatform initialPlatform = SmartProgressCirclePlatform.instance;

  test('$MethodChannelSmartProgressCircle is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSmartProgressCircle>());
  });

  test('getPlatformVersion', () async {
    SmartProgressCircle smartProgressCirclePlugin = SmartProgressCircle();
    MockSmartProgressCirclePlatform fakePlatform = MockSmartProgressCirclePlatform();
    SmartProgressCirclePlatform.instance = fakePlatform;

    expect(await smartProgressCirclePlugin.getPlatformVersion(), '42');
  });
}
