class SuitModel {
  final String name;
  final String version;
  final String owner;

  final int health;
  final int power;
  final int energy;
  final int flight;

  SuitModel({
    required this.name,
    required this.version,
    required this.owner,
    required this.health,
    required this.power,
    required this.energy,
    required this.flight,
  });

  factory SuitModel.demo() {
    return SuitModel(
      name: "MARK XLII",
      version: "JARVIS v12.8",
      owner: "Tony Stark",
      health: 98,
      power: 97,
      energy: 94,
      flight: 96,
    );
  }
}