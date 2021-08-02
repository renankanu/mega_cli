import '../find_file/find_file_by_name.dart';

bool get supportChildrenRoutes {
  bool supportChildren = false;
  var routesFile = findFileByName('app_module.dart');
  if (routesFile.path.isNotEmpty) {
    supportChildren = routesFile
            .readAsLinesSync()
            .contains('List<ModularRouter> get routers => [') ||
        routesFile
            .readAsLinesSync()
            .contains('List<ModularRouter> get routers => [];');
  }
  return supportChildren;
}
