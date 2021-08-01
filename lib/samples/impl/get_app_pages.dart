import '../../common/utils/pubspec/pubspec_utils.dart';
import '../interface/sample_interface.dart';

/// [Sample] file from [app_pages] file creation.
class AppModulesSample extends Sample {
  String initial;
  AppModulesSample(
      {String path = 'lib/app/routes/app_pages.dart', this.initial = 'HOME'})
      : super(path);
  final import = PubspecUtils.getPackageImport;
  String get _initialRoute =>
      initial.isNotEmpty ? '\nstatic const INITIAL = Routes.$initial;' : '';

  @override
  String get content => '''$import
part 'app_routes.dart';

class AppPages {
   AppPages._();
  $_initialRoute

  static final routes = [
  ];
}
''';
}
