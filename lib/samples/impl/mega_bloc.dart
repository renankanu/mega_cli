import 'package:recase/recase.dart';

import '../interface/sample_interface.dart';

/// [Sample] file from Module_Controller file creation.
class MegaBlocSample extends Sample {
  final String _fileName;
  MegaBlocSample(String path, this._fileName, {bool overwrite = false})
      : super(path, overwrite: overwrite);

  @override
  String get content => flutterController;

  String get flutterController =>
      '''import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/foundation.dart';

import '${_fileName}_repository.dart';

class ${_fileName.pascalCase}Bloc extends BlocBase {
  final ${_fileName.pascalCase}Repository _repository;

  ${_fileName.pascalCase}Bloc({@required ${_fileName.pascalCase}Repository repository,
  })  : assert(repository != null),
  _repository = repository {}
  
  @override
  void dispose() {
  super.dispose();
  }
}
''';
}
