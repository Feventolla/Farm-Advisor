import 'dart:convert';

class Field {
  String fieldName;
  String altitude;
  // String firstname;
  // String lastname;
  // String role;

  Field({
    required this.fieldName,
    required this.altitude,
  });

  factory Field.fromJson(Map<String, dynamic> json) {
    return Field(
      fieldName: json['fieldName'],
      altitude: json['altitude'],
      // firstname: json['firstname'],
      // lastname: json['lastname'],
      // role: json['role'],
    );
  }
}
