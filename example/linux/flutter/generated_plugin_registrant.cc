//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <smart_progress_circle/smart_progress_circle_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) smart_progress_circle_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "SmartProgressCirclePlugin");
  smart_progress_circle_plugin_register_with_registrar(smart_progress_circle_registrar);
}
