import 'package:mega_cli/common/utils/logger/log_utils.dart';
import 'package:mega_cli/common/utils/pubspec/pubspec_utils.dart';

import '../interface/sample_interface.dart';

/// [Sample] file from Module_View file creation.
class MegaModuleSample extends Sample {
  final String moduleName;
  final String blocName;
  final String repositoryName;
  final String screenName;
  final String blocImportDir;
  final String repositoryImportDir;
  final String screenImportDir;

  MegaModuleSample({
    String? path,
    required this.moduleName,
    required this.blocName,
    required this.repositoryName,
    required this.screenName,
    required this.blocImportDir,
    required this.repositoryImportDir,
    required this.screenImportDir,
  }) : super(path = '');

  String get blocImport =>
      '''import 'package:${PubspecUtils.projectName}/$blocImportDir';''';
  String get repositoryImport =>
      '''import 'package:${PubspecUtils.projectName}/$repositoryImportDir';''';
  String get screenImport =>
      '''import 'package:${PubspecUtils.projectName}/$screenImportDir';''';

  @override
  String get content => '''import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:mega_flutter_network/mega_dio.dart';

import '../../app_module.dart';
$blocImport
$repositoryImport
$screenImport

class $moduleName extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc(
          (i) => $blocName(
            repository: $moduleName.to.getDependency<$repositoryName>(),
          ),
        ),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency(
          (i) => $repositoryName(
            httpClient: AppModule.to.get<MegaDio>(),
          ),
        ),
      ];

  @override
  Widget get view => const $screenName();

  static Inject get to => Inject<$moduleName>.of();
}
  ''';
}
