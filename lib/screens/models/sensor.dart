import 'dart:convert';

class Sensor {
  String serialNumber;
  String sensorLocation;
  String ggd;
  String installationDate;
  String lastCutting;

  Sensor({
    required this.serialNumber,
    required this.sensorLocation,
    required this.ggd,
    required this.installationDate,
    required this.lastCutting,
  });

  factory Sensor.fromJson(Map<String, dynamic> json) {
    return Sensor(
      serialNumber: json['serialNumber'],
      sensorLocation: json['sensorLocation'],
      ggd: json['ggd'],
      installationDate: json['installationDate'],
      lastCutting: json['lastCutting'],
    );
  }
}
