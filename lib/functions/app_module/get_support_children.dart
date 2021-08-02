import '../find_file/find_file_by_name.dart';

Future<bool> get supportChildrenRoutes async {
  bool supportChildren = false;
  var routesFile = findFileByName('app_module.dart');
  if (routesFile.path.isNotEmpty) {
    supportChildren = await routesFile
            .readAsLinesSync()
            .contains('List<ModularRouter> get routers => [') ||
        await routesFile
            .readAsLinesSync()
            .contains('List<ModularRouter> get routers => [];');
  }
  return supportChildren;
}
