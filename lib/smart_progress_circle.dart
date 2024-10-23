library smart_progress_circle;

import 'package:smart_progress_circle/smart_progress_circle_platform_interface.dart';
export 'circular_progress_bar.dart';


/// The main class for the Smart Progress Circle plugin.
class SmartProgressCircle {
  /// Gets the platform version of the plugin.
  Future<String?> getPlatformVersion() {
    return SmartProgressCirclePlatform.instance.getPlatformVersion();
  }
}
/// A convenient export for the CircularProgressBar widget.

/// The platform interface for the SmartProgressCircle plugin.
