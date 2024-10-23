#include "include/smart_progress_circle/smart_progress_circle_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "smart_progress_circle_plugin.h"

void SmartProgressCirclePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  smart_progress_circle::SmartProgressCirclePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
