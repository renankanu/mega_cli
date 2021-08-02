class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'en': Locales.en,
  };
}

class LocaleKeys {
  LocaleKeys._();
  static const ask_existing_module = 'ask_existing_page';
  static const error_unnecessary_parameter = 'error_unnecessary_parameter';
  static const ask_new_module_name = 'ask_new_page_name';
  static const error_unnecessary_parameter_plural =
      'error_unnecessary_parameter_plural';
  static const error_invalid_dart = 'error_invalid_dart';
  static const error_package_not_found = 'error_package_not_found';
  static const error_cli_version_not_found = 'error_cli_version_not_found';
  static const error_update_cli = 'error_update_cli';
  static const error_folder_not_found = 'error_folder_not_found';
  static const error_file_not_found = 'error_file_not_found';
  static const error_access_denied = 'error_access_denied';
  static const error_unexpected = 'error_unexpected';
  static const example = 'example';
  static const hint_create_module = 'hint_create_mega';
  static const hint_create_screen = 'hint_create_screen';
  static const hint_create_view = 'hint_create_view';
  static const hint_generate_locales = 'hint_generate_locales';
  static const hint_generate_model = 'hint_generate_model';
  static const hint_help = 'hint_help';
  static const hint_init = 'hint_init';
  static const hint_remove = 'hint_remove';
  static const hint_sort = 'hint_sort';
  static const hint_update = 'hint_update';
  static const hint_version = 'hint_version';
  static const info_unnecessary_flag = 'info_unnecessary_flag';
  static const info_unnecessary_flag_plural = 'info_unnecessary_flag_prural';
  static const info_package_not_installed = 'info_package_not_installed';
  static const info_cli_last_version_already_installed =
      'info_cli_last_version_already_installed';
  static const info_no_file_overwritten = 'info_no_file_overwritten';
  static const info_update_available = 'info_update_available';
  static const info_update_available2 = 'info_update_available2';
  static const options_yes = 'options_yes';
  static const options_no = 'options_no';
  static const optional_parameters = 'optional_parameters';
  static const success_module_create = 'sucess_page_create';
  static const sucess_locale_generate = 'sucess_locale_generate';
  static const sucess_getx_pattern_generated = 'sucess_getx_pattern_generated';
  static const sucess_clean_Pattern_generated =
      'sucess_clean_Pattern_generated';
  static const sucess_file_formatted = 'sucess_file_formatted';
  static const success_package_removed = 'sucess_package_removed';
  static const success_package_installed = 'sucess_package_installed';
  static const success_update_cli = 'sucess_update_cli';
  static const sucess_add_controller_in_bindings =
      'sucess_add_controller_in_bindings';
  static const sucess_navigation_added = 'sucess_navigation_added';
  static const success_file_created = 'sucess_file_created';
  static const sucess_route_created = 'sucess_route_created';
  static const ask_android_lang = 'ask_android_lang';
  static const ask_use_null_safe = 'ask_use_null_safe';
  static const error_no_package_to_remove = 'error_no_package_to_remove';
  static const warning = 'warning';
  static const options_rename = 'options_rename';
}

class Locales {
  static const en = {
    'ask_existing_page':
        'The page [%s] already exists, do you want to overwrite it?',
    'ask_new_page_name': 'what new name for the page?',
    'error_unnecessary_parameter': 'the %s parameter is not necessary',
    'error_unnecessary_parameter_plural': 'the %s parameters are not necessary',
    'error_invalid_dart': 'The %s is not a valid dart file',
    'error_package_not_found': 'Package: %s not found in pub.dev',
    'error_cli_version_not_found':
        'failed to find the version you have installed.',
    'error_update_cli': 'There was an error upgrading mega_cli',
    'error_folder_not_found': 'Folder %s not found',
    'error_file_not_found': 'File not found in %s',
    'error_access_denied': 'Access denied to %s',
    'error_unexpected': 'Unexpected error occurred:',
    'error_no_package_to_remove':
        'Enter the name of the package you wanna remove',
    'example': 'Example:',
    'warning': 'Warning:',
    'hint_create_mega': 'Use to generate modules',
    'hint_create_screen': 'Generate new screen',
    'hint_create_view': 'Generate view',
    'hint_generate_locales': 'Generate translation file from json files',
    'hint_generate_model': 'generate Class model from json',
    'hint_help': 'Show this help',
    'hint_init': 'generate the chosen structure on an existing project:',
    'hint_remove': 'Use to remove a package in your project (dependencies):',
    'hint_sort': 'Sort imports and format dart files',
    'hint_update': 'To update mega_cli',
    'hint_version': 'Shows the current CLI version',
    'info_unnecessary_flag': 'The %s is not necessary',
    'info_unnecessary_flag_prural': 'The %s are not necessary',
    'info_package_not_installed':
        'Package: %s is not installed in this application',
    'info_cli_last_version_already_installed':
        'Latest version of mega_cli already installed',
    'info_no_file_overwritten': 'No files were overwritten',
    'info_update_available':
        'There\'s an update available! Current installed version: %s',
    'info_update_available2': 'New version available: %s Please, run:',
    'options_yes': 'Yes!',
    'options_no': 'No',
    'options_rename': 'I want to rename',
    'optional_parameters': 'Optional parameters: %s',
    'sucess_page_create': '%s page created successfully.',
    'sucess_locale_generate': 'locale files generated successfully.',
    'sucess_clean_Pattern_generated':
        'CLEAN Pattern structure successfully generated.',
    'sucess_file_formatted': ' \'%s\' was successfully formatted',
    'sucess_package_removed': 'Package: %s removed!',
    'sucess_package_installed': '\'Package: %s installed!',
    'sucess_update_cli': 'Upgrade complete',
    'sucess_add_controller_in_bindings':
        'The %s has been added to binding at path: %s\'',
    'sucess_navigation_added': '%s navigation added successfully.',
    'sucess_file_created': 'File: %s created successfully at path: %s',
    'sucess_route_created': '%s route created successfully.',
  };
}
