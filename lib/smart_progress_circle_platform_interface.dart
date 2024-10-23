import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'smart_progress_circle_method_channel.dart';

abstract class SmartProgressCirclePlatform extends PlatformInterface {
  /// Constructs a SmartProgressCirclePlatform.
  SmartProgressCirclePlatform() : super(token: _token);

  static final Object _token = Object();

  static SmartProgressCirclePlatform _instance = MethodChannelSmartProgressCircle();

  /// The default instance of [SmartProgressCirclePlatform] to use.
  ///
  /// Defaults to [MethodChannelSmartProgressCircle].
  static SmartProgressCirclePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SmartProgressCirclePlatform] when
  /// they register themselves.
  static set instance(SmartProgressCirclePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
