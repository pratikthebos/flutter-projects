import '../models/module_model.dart';

class TerminalService {
  Future<String> execute(ModuleModel module) async {
    await Future.delayed(const Duration(seconds: 3));

    return module.output;
  }
}