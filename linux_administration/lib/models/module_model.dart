class ModuleModel {

  final String title;

  final String icon;

  final String command;

  final String output;

  ModuleModel({

    required this.title,

    required this.icon,

    required this.command,

    required this.output,
  });

  factory ModuleModel.fromJson(Map<String,dynamic> json){

    return ModuleModel(

      title: json["title"],

      icon: json["icon"],

      command: json["command"],

      output: json["output"],

    );

  }

}