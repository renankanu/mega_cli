import 'dart:io';

import 'package:cli_dialog/cli_dialog.dart';
import 'package:cli_menu/cli_menu.dart';
import 'package:mega_cli/commands/interface/command.dart';
import 'package:mega_cli/functions/app_module/mega_add_app_module.dart';
import 'package:mega_cli/samples/impl/mega_screen.dart';
import 'package:recase/recase.dart';

import '../../../../../common/utils/logger/log_utils.dart';
import '../../../../../core/generator.dart';
import '../../../../../core/internationalization.dart';
import '../../../../../core/locales.g.dart';
import '../../../../../core/structure.dart';
import '../../../../../functions/create/create_single_file.dart';
import '../../../../samples/impl/mega_repository.dart';
import '../../../../samples/impl/mega_bloc.dart';
import '../../../../samples/impl/mega_module.dart';

/// The command create a Repository and Module and Bloc and Screen
class CreateModuleCommand extends Command {
  @override
  String get commandName => 'module';

  @override
  List<String> get alias => ['module', '-m'];
  @override
  Future<void> execute() async {
    var isProject = false;
    if (MegaCli.arguments[0] == 'create' || MegaCli.arguments[0] == '-c') {
      isProject = MegaCli.arguments[1].split('.').first == 'project';
    }
    var name = this.name;
    if (name.isEmpty || isProject) {
      name = 'home';
    }
    checkForAlreadyExists(name);
  }

  @override
  String? get hint => LocaleKeys.hint_create_module.tr;

  @override
  bool validate() => super.validate();

  void checkForAlreadyExists(String? name) {
    var _fileModel =
        Structure.model(name, 'module', true, on: onCommand, folderName: name);
    var pathSplit = Structure.safeSplitPath(_fileModel.path!);

    pathSplit.removeLast();
    var path = pathSplit.join('/');
    path = Structure.replaceAsExpected(path: path);
    if (Directory(path).existsSync()) {
      LogService.info(Translation(LocaleKeys.ask_existing_module.trArgs([name]))
          .toString());
      final menu = Menu([
        LocaleKeys.options_yes.tr,
        LocaleKeys.options_no.tr,
        LocaleKeys.options_rename.tr,
      ]);
      final result = menu.choose();
      if (result.index == 0) {
        _writeFiles(path, name!, overwrite: true);
      } else if (result.index == 2) {
        final dialog = CLI_Dialog();
        dialog.addQuestion(LocaleKeys.ask_new_module_name.tr, 'name');
        name = dialog.ask()['name'] as String?;

        checkForAlreadyExists(name!.trim().snakeCase);
      }
    } else {
      Directory(path).createSync(recursive: true);
      _writeFiles(path, name!, overwrite: false);
    }
  }

  void _writeFiles(String path, String name, {bool overwrite = false}) {
    var extraFolder = false;
    var blocFile = handleFileCreate(
      name,
      'bloc',
      path,
      extraFolder,
      MegaBlocSample(
        '',
        name,
        overwrite: overwrite,
      ),
    );
    var blocPath = Structure.pathToDirImport(blocFile.path);
    var screenFile = handleFileCreate(
      name,
      'screen',
      path,
      extraFolder,
      MegaScreenSample(
        screenName: '${name.pascalCase}Screen',
        routName: name.pascalCase,
      ),
    );
    var screenPath = Structure.pathToDirImport(screenFile.path);
    var repositoryFile = handleFileCreate(
      name,
      'repository',
      path,
      extraFolder,
      MegaRepositorySample(repositoryName: '${name.pascalCase}Repository'),
    );
    var repositoryPath = Structure.pathToDirImport(repositoryFile.path);
    handleFileCreate(
      name,
      'module',
      path,
      extraFolder,
      MegaModuleSample(
        moduleName: '${name.pascalCase}Module',
        blocName: '${name.pascalCase}Bloc',
        repositoryName: '${name.pascalCase}Repository',
        screenName: '${name.pascalCase}Screen',
        blocImportDir: blocPath,
        repositoryImportDir: repositoryPath,
        screenImportDir: screenPath,
      ),
    );

    addRoute(
      name,
      Structure.pathToDirImport(repositoryFile.path),
      Structure.pathToDirImport(screenFile.path),
    );

    LogService.success(
        '${LocaleKeys.success_module_create.trArgs([name.pascalCase])} 🚀');
  }

  @override
  String get codeSample => 'mega create module.login';

  @override
  int get maxParameters => 0;
}
