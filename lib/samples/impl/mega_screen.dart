import '../interface/sample_interface.dart';

/// [Sample] file from Module_View file creation.
class MegaScreenSample extends Sample {
  final String screenName;
  final String routName;

  MegaScreenSample({
    String? path,
    required this.screenName,
    required this.routName,
  }) : super(path = '');

  @override
  String get content => '''import 'package:flutter/material.dart';
import 'package:mega_flutter_base/mega_base_screen.dart';

class $screenName extends MegaBaseScreen {
  static const String routeName = '/$routName';

  const $screenName({Key key}) : super(key: key);

  @override
  _${screenName}State createState() => _${screenName}State();
}

class _${screenName}State extends MegaBaseScreenState<$screenName>
    with MegaBaseScreenMixin {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}''';
}
