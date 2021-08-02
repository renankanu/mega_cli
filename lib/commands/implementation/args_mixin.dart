import 'package:http/http.dart';
import 'package:recase/recase.dart';

import '../../core/generator.dart';

mixin ArgsMixin {
  final List<String> _args = MegaCli.arguments;

  /// all arguments
  ///
  /// example run
  /// `mega create module.product on home`
  ///
  /// ```
  /// print(args); // [module.product]
  /// ```
  List<String> args = _getArgs();

  /// all flags
  ///
  /// example run
  /// `mega sort . --skipRename --relative`
  ///
  /// ```
  /// print(flags); // [--skipRename, --relative]
  /// ```
  List<String> flags = _getFlags();

  /// return parameter `on`
  ///
  /// example run
  /// `mega create module:product on home`
  ///
  /// ```
  /// print(onCommand); // home
  /// ```
  String get onCommand {
    return _getArg('on');
  }

  /// return parameter `name`
  ///
  /// example run
  /// `mega create module:product on home`
  ///
  /// ```
  /// print(name); // product
  /// ```
  String get name {
    if (_args.length > 1) {
      var arg = _args[1];
      if (_args[0] == 'create' || _args[0] == '-c') {
        var split = arg.split('.');
        var type = split.first;
        var name = split.last;

        if (name == type) {
          if (_args.length > 2) {
            name = _args[2];
          } else {
            name = '';
          }
        }
        if (type == 'project') {
          return name.isEmpty ? '.' : name.snakeCase;
        }
        return name;
      }
    }
    return '';
  }

  /// return [true] if contains flags
  ///
  /// example run
  /// `mega sort . --skipRename`
  ///
  /// ```
  /// print(containsArg('--skipRename')); // true
  /// print(containsArg('--relative')); // false
  /// ```
  bool containsArg(String flag) {
    return _args.contains(flag);
  }
}
List<String> _getArgs() {
  var args = List.of(MegaCli.arguments);
  var defaultArgs = ['on', 'from', 'with'];

  for (var arg in defaultArgs) {
    var indexArg = args.indexWhere((element) => (element == arg));
    if (indexArg != -1 && indexArg < args.length) {
      args.removeAt(indexArg);
      if (indexArg < args.length) {
        args.removeAt(indexArg);
      }
    }
  }
  args.removeWhere((element) => element.startsWith('-'));
  return args;
}

List<String> _getFlags() {
  var args = List.of(MegaCli.arguments);
  var flags = args.where((element) {
    return element.startsWith('-') && element != '--debug';
  }).toList();

  return flags;
}

int _getIndexArg(String arg) {
  return MegaCli.arguments.indexWhere((element) => element == arg);
}

String _getArg(String arg) {
  var index = _getIndexArg(arg);
  if (index != -1) {
    if (index + 1 < MegaCli.arguments.length) {
      index++;
      return MegaCli.arguments[index];
    } else {
      throw ClientException("the '$arg' argument is empty");
    }
  }

  return '';
}
