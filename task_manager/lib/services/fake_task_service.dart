import '../models/task_model.dart';

class FakeTaskService {
  static List<TaskModel> tasks = [
    TaskModel(
      id: "1",
      title: "Design Login UI",
      description:
      "Create a modern Material 3 login screen with responsive layout.",
      category: "Design",
      priority: "High",
      dueDate: "Today",
      progress: .80,
    ),
    TaskModel(
      id: "2",
      title: "Flutter API Integration",
      description:
      "Integrate authentication API and handle error responses.",
      category: "Development",
      priority: "Medium",
      dueDate: "Tomorrow",
      progress: .45,
    ),
    TaskModel(
      id: "3",
      title: "Fix Payment Bug",
      description:
      "Resolve payment gateway timeout issue and verify transactions.",
      category: "Bug Fix",
      priority: "High",
      dueDate: "Today",
      progress: .70,
    ),
    TaskModel(
      id: "4",
      title: "Write Unit Tests",
      description:
      "Add unit tests for authentication and user profile modules.",
      category: "Testing",
      priority: "Low",
      dueDate: "Friday",
      progress: .25,
    ),
    TaskModel(
      id: "5",
      title: "Upload APK",
      description:
      "Generate release build and upload the APK for client review.",
      category: "Release",
      priority: "Medium",
      dueDate: "Monday",
      progress: .95,
    ),
  ];
}