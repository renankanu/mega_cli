import 'package:recase/recase.dart';

import '../interface/sample_interface.dart';

/// [Sample] file from Module_Binding file creation.
class RepositorySample extends Sample {
  final String _fileName;
  final String _repositoryName;

  RepositorySample(String path, this._fileName, this._repositoryName,
      {bool overwrite = false})
      : super(path, overwrite: overwrite);

  @override
  String get content => '''import 'package:get/get.dart';

class $_repositoryName extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<${_fileName.pascalCase}Controller>(
      () => ${_fileName.pascalCase}Controller(),
    );
  }
}
''';
}
