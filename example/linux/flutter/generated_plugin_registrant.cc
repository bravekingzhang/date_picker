//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <date_picker_hz/date_picker_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) date_picker_hz_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "DatePickerPlugin");
  date_picker_plugin_register_with_registrar(date_picker_hz_registrar);
}
