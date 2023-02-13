class Sensor {
  String name;
  String serialNumber;
  String location;
  // ignore: non_constant_identifier_names
  String GGD;
  String installationDate;
  String lastCutting;

  Sensor({
    required this.name,
    required this.serialNumber,
    required this.location,
    // ignore: non_constant_identifier_names
    required this.GGD,
    required this.installationDate,
    required this.lastCutting,
    // required this.id,
  });

  factory Sensor.fromJson(Map<String, dynamic> json) {
    return Sensor(
      name: json['name'],
      serialNumber: json['serialNumber'],
      location: json['location'],
      GGD: json['GGD'],
      installationDate: json['installationDate'],
      lastCutting: json['lastCutting'],
    );
  }
}
