import 'dart:io';

import 'package:cli_menu/cli_menu.dart';
import 'package:pubspec/pubspec.dart';
import 'package:version/version.dart' as v;

import '../../../core/internationalization.dart';
import '../../../core/locales.g.dart';
import '../../../exception_handler/exceptions/cli_exception.dart';
import '../../../extensions.dart';
import '../logger/log_utils.dart';
import '../pub_dev/pub_dev_api.dart';
import '../shell/shell.utils.dart';
import 'yaml_to.string.dart';

// ignore: avoid_classes_with_only_static_members
class PubspecUtils {
  static final _pubspecFile = File('pubspec.yaml');

  static PubSpec get pubSpec =>
      PubSpec.fromYamlString(_pubspecFile.readAsStringSync());

  static final _mapSep = _PubValue<String>(() {
    var yaml = pubSpec.unParsedYaml!;
    if (yaml.containsKey('mega_cli')) {
      if ((yaml['mega_cli'] as Map).containsKey('separator')) {
        return (yaml['mega_cli']['separator'] as String?) ?? '';
      }
    }

    return '';
  });
  static String? get separatorFileType => _mapSep.value;

  static final _mapName = _PubValue<String>(() => pubSpec.name?.trim() ?? '');
  static String? get projectName => _mapName.value;
}

/// avoids multiple reads in one file
class _PubValue<T> {
  final T Function() _setValue;
  bool _isChecked = false;
  T? _value;

  /// takes the value of the file,
  /// if not already called it will call the first time
  T? get value {
    if (!_isChecked) {
      _isChecked = true;
      _value = _setValue.call();
    }
    return _value;
  }

  _PubValue(this._setValue);
}
