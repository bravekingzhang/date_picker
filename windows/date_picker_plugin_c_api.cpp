#include "include/date_picker/date_picker_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "date_picker_plugin.h"

void DatePickerPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  date_picker::DatePickerPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
