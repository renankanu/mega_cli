import 'dart:convert';

import 'package:mega_cli/functions/formatter_dart_file/formatter_dart_file.dart';

import '../../common/utils/pubspec/pubspec_utils.dart';
import '../create/create_single_file.dart';
import '../find_file/find_file_by_name.dart';

void addAppPage(String screenVariable, String name, String moduleDir) {
  var appPagesFile = findFileByName('app_module.dart');
  var lines = <String>[];

  var content = formatterDartFile(appPagesFile.readAsStringSync());
  lines = LineSplitter.split(content).toList();

  var indexRoutes = lines.indexWhere(
      (element) => element.trim().contains('List<ModularRouter> get routers'));
  var index =
      lines.indexWhere((element) => element.contains('];'), indexRoutes);

  var line = '''ModularRouter(
    Routes.$screenVariable,
    child: (_, __) => $name(),
    ),''';

  var import = "import 'package:${PubspecUtils.projectName}/";

  lines.insert(index, line);

  lines.insert(0, "$import$moduleDir';");

  writeFile(appPagesFile.path, lines.join('\n'),
      overwrite: true, logger: false);
}

void addAppRoute(String screenVariable, String screenName, String moduleDir) {
  var appRoutes = findFileByName('routes.dart');
  var lines = <String>[];

  var content = formatterDartFile(appRoutes.readAsStringSync());
  lines = LineSplitter.split(content).toList();

  var indexRoutes =
      lines.indexWhere((element) => element.trim().contains('class Routes {'));
  var index = lines.indexWhere((element) => element.contains('}'), indexRoutes);

  var line =
      '''static const String $screenVariable = ${screenName}.routeName;''';

  var import = "import 'package:${PubspecUtils.projectName}/";

  lines.insert(index, line);

  lines.insert(0, "$import$moduleDir';");

  writeFile(appRoutes.path, lines.join('\n'), overwrite: true, logger: false);
}
