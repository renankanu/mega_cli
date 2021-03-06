import 'package:mega_cli/commands/implementation/update/update.dart';

import 'implementation/commands_export.dart';
import 'interface/command.dart';

final List<Command> commands = [
  CommandParent(
    'create',
    [CreateModuleCommand()],
    ['-c'],
  ),
  HelpCommand(),
  VersionCommand(),
  UpdateCommand()
];

class CommandParent extends Command {
  final String _name;
  final List<String> _alias;
  final List<Command> _childrens;
  CommandParent(this._name, this._childrens, [this._alias = const []]);

  @override
  String get commandName => _name;
  @override
  List<Command> get childrens => _childrens;
  @override
  List<String> get alias => _alias;

  @override
  Future<void> execute() async {}

  @override
  String get hint => '';

  @override
  bool validate() => true;

  @override
  String get codeSample => '';

  @override
  int get maxParameters => 0;
}
