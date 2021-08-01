import 'package:mega_cli/commands/implementation/help/help.dart';

import '../commands/commands_list.dart';
import '../commands/interface/command.dart';
import '../common/utils/logger/log_utils.dart';

class MegaCli {
  final List<String> _arguments;

  MegaCli(this._arguments) {
    _instance = this;
  }

  static MegaCli? _instance;
  static MegaCli? get to => _instance;

  static List<String> get arguments => to!._arguments;

  Command findCommand() => _findCommand(0, commands);

  Command _findCommand(int currentIndex, List<Command> commands) {
    try {
      final currentArgument = arguments[currentIndex].split(':').first;

      var command = commands.firstWhere(
          (command) =>
              command.commandName == currentArgument ||
              command.alias.contains(currentArgument),
          orElse: () => ErrorCommand('command not found'));
      if (command.childrens.isNotEmpty) {
        if (command is CommandParent) {
          command = _findCommand(++currentIndex, command.childrens);
        } else {
          var childrenCommand = _findCommand(++currentIndex, command.childrens);
          if (!(childrenCommand is ErrorCommand)) {
            command = childrenCommand;
          }
        }
      }
      return command;
      // ignore: avoid_catching_errors
    } on RangeError catch (_) {
      return HelpCommand();
    } on Exception catch (_) {
      rethrow;
    }
  }
}

class ErrorCommand extends Command {
  @override
  String get commandName => 'onerror';
  String error;
  ErrorCommand(this.error);
  @override
  Future<void> execute() async {
    LogService.error(error);
    LogService.info('run `mega help` to help', false, false);
  }

  @override
  String get hint => 'Print on erro ❌';

  @override
  String get codeSample => '';

  @override
  int get maxParameters => 0;

  @override
  bool validate() => true;
}

class NotFoundCommand extends Command {
  @override
  String get commandName => 'Not Found Command 🙁';

  @override
  Future<void> execute() async {
    //Command findCommand() => _findCommand(0, commands);
  }

  @override
  String get hint => 'Not Found Command 🙁';

  @override
  String get codeSample => '';

  @override
  int get maxParameters => 0;

  @override
  bool validate() => true;
}
