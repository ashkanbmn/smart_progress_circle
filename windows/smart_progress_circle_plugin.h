#ifndef FLUTTER_PLUGIN_SMART_PROGRESS_CIRCLE_PLUGIN_H_
#define FLUTTER_PLUGIN_SMART_PROGRESS_CIRCLE_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace smart_progress_circle {

class SmartProgressCirclePlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  SmartProgressCirclePlugin();

  virtual ~SmartProgressCirclePlugin();

  // Disallow copy and assign.
  SmartProgressCirclePlugin(const SmartProgressCirclePlugin&) = delete;
  SmartProgressCirclePlugin& operator=(const SmartProgressCirclePlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace smart_progress_circle

#endif  // FLUTTER_PLUGIN_SMART_PROGRESS_CIRCLE_PLUGIN_H_
