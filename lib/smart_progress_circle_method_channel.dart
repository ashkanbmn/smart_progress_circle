import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'smart_progress_circle_platform_interface.dart';

/// An implementation of [SmartProgressCirclePlatform] that uses method channels.
class MethodChannelSmartProgressCircle extends SmartProgressCirclePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('smart_progress_circle');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
