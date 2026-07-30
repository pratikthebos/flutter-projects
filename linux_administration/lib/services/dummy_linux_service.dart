import '../core/constants/linux_commands.dart';
import '../models/module_model.dart';
import '../models/result_model.dart';

class DummyLinuxService {
  List<ModuleModel> getModules() {
    return LinuxCommands.modules
        .map(
          (e) => ModuleModel.fromJson(e),
    )
        .toList();
  }

  ResultModel getResult(ModuleModel module) {
    switch (module.title) {
      case "System Health":
        return ResultModel(
          title: module.title,
          status: "Healthy",
          health: "98%",
          details:
          "CPU Usage : 18%\nMemory : 6.2 GB\nDisk : 39%\nLoad Average : 0.42",
          command: module.command,
          output: module.output,
        );

      case "Service Management":
        return ResultModel(
          title: module.title,
          status: "Running",
          health: "Excellent",
          details:
          "Service : nginx\nPID : 1256\nMemory : 35 MB\nCPU : 0.6%",
          command: module.command,
          output: module.output,
        );

      case "System Logs":
        return ResultModel(
          title: module.title,
          status: "Healthy",
          health: "99%",
          details:
          "Critical Errors : 0\nWarnings : 1\nFailed Login : 1",
          command: module.command,
          output: module.output,
        );

      case "User Management":
        return ResultModel(
          title: module.title,
          status: "4 Users",
          health: "Secure",
          details:
          "Root : Enabled\nAdmin : Active\nDeveloper : Active",
          command: module.command,
          output: module.output,
        );

      case "Password Policy":
        return ResultModel(
          title: module.title,
          status: "Secure",
          health: "100%",
          details:
          "Maximum Age : 90 Days\nMinimum Age : 0\nWarning : 7 Days",
          command: module.command,
          output: module.output,
        );

      case "Firewall":
        return ResultModel(
          title: module.title,
          status: "Enabled",
          health: "Protected",
          details:
          "SSH : Allowed\nHTTP : Allowed\nHTTPS : Allowed\nThreats : 0",
          command: module.command,
          output: module.output,
        );

      case "Network Diagnostics":
        return ResultModel(
          title: module.title,
          status: "Connected",
          health: "Excellent",
          details:
          "Latency : 12 ms\nGateway : 192.168.1.1\nDNS : 8.8.8.8",
          command: module.command,
          output: module.output,
        );

      case "Backup Verification":
        return ResultModel(
          title: module.title,
          status: "Verified",
          health: "100%",
          details:
          "Backup Size : 24 GB\nCreated : Today\nIntegrity : Passed",
          command: module.command,
          output: module.output,
        );

      case "VM Health":
        return ResultModel(
          title: module.title,
          status: "3 Running",
          health: "Healthy",
          details:
          "Web VM : Running\nDB VM : Running\nJenkins VM : Running",
          command: module.command,
          output: module.output,
        );

      case "Security Audit":
        return ResultModel(
          title: module.title,
          status: "Excellent",
          health: "99%",
          details:
          "Blocked IPs : 0\nFailed Login : 1\nAudit Rules : Active",
          command: module.command,
          output: module.output,
        );

      case "Docker":
        return ResultModel(
          title: module.title,
          status: "4 Containers",
          health: "Healthy",
          details:
          "Running : nginx\nmysql\nredis\njenkins",
          command: module.command,
          output: module.output,
        );

      case "Kubernetes":
        return ResultModel(
          title: module.title,
          status: "Cluster Healthy",
          health: "100%",
          details:
          "Nodes : 3\nPods : 18\nRunning : 18",
          command: module.command,
          output: module.output,
        );

      default:
        return ResultModel(
          title: module.title,
          status: "Completed",
          health: "100%",
          details: "No issues detected.",
          command: module.command,
          output: module.output,
        );
    }
  }
}