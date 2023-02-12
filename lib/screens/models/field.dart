import 'dart:convert';

class Field {
  String fieldName;
  String altitude;
  String id;
  // String firstname;
  // String lastname;
  // String role;

  Field({
    required this.fieldName,
    required this.altitude,
    required this.id,
  });

  factory Field.fromJson(Map<String, dynamic> json) {
    return Field(
      fieldName: json['name'],
      altitude: json['altitude'],
      id: json['_id'],
      // firstname: json['firstname'],
      // lastname: json['lastname'],
      // role: json['role'],
    );
  }
}
