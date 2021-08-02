import 'dart:convert';

import 'package:mega_cli/functions/formatter_dart_file/formatter_dart_file.dart';

import '../../common/utils/logger/log_utils.dart';
import '../../common/utils/pubspec/pubspec_utils.dart';
import '../create/create_single_file.dart';
import '../find_file/find_file_by_name.dart';

void addAppPage(String name, String moduleDir) {
  var appPagesFile = findFileByName('app_module.dart');
  var lines = <String>[];

  var content = formatterDartFile(appPagesFile.readAsStringSync());
  lines = LineSplitter.split(content).toList();

  var indexRoutes = lines.indexWhere(
      (element) => element.trim().contains('List<ModularRouter> get routers'));
  var index =
      lines.indexWhere((element) => element.contains('];'), indexRoutes);

  var line = '''ModularRouter(
    'Routes.',
    child: (_, __) => $name(),
    ),''';

  var import = "import 'package:${PubspecUtils.projectName}/";

  lines.insert(index, line);

  lines.insert(0, "$import$moduleDir';");

  writeFile(appPagesFile.path, lines.join('\n'),
      overwrite: true, logger: false);
}
