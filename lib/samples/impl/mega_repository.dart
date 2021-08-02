import '../interface/sample_interface.dart';

/// [Sample] file from Module_Repository file creation.
class RepositorySample extends Sample {
  final String repositoryName;

  RepositorySample({String? path, required this.repositoryName})
      : super(path = '');

  @override
  String get content => '''import 'package:flutter/foundation.dart';
import 'package:mega_flutter_network/mega_dio.dart';

class $repositoryName {
  final MegaDio _httpClient;
  
    $repositoryName({
    @required MegaDio httpClient,
  })  : assert(httpClient != null),
        _httpClient = httpClient;
  }
''';
}
