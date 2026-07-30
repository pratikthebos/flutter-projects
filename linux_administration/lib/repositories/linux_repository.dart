import '../models/module_model.dart';
import '../services/dummy_linux_service.dart';

class LinuxRepository {
  final DummyLinuxService _service = DummyLinuxService();

  List<ModuleModel> getModules() {
    return _service.getModules();
  }

  getResult(ModuleModel module) {
    return _service.getResult(module);
  }
}