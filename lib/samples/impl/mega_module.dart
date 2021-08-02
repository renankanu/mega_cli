import '../../common/utils/pubspec/pubspec_utils.dart';
import '../interface/sample_interface.dart';

/// [Sample] file from Module_View file creation.
class MegaModuleSample extends Sample {
  final String? _controllerDir;
  final String _viewName;
  final String? _controller;

  MegaModuleSample(
    String path,
    this._viewName,
    this._controller,
    this._controllerDir,
  ) : super(path);

  String get import => _controllerDir != null
      ? '''import 'package:${PubspecUtils.projectName}/$_controllerDir';'''
      : '';

  String get _controllerName =>
      _controller != null ? 'GetView<$_controller>' : 'GetView';

  String get _flutterView => '''import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
$import

class $_viewName extends $_controllerName {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$_viewName'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          '$_viewName is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  ''';

  @override
  String get content => _flutterView;
}
