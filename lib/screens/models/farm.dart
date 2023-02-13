import 'dart:core';

class Farm {
  String id;
  String name;
  String location;
  // String firstname;
  // String lastname;
  // String role;

  Farm({
    required this.name,
    required this.location,
    required this.id,
  });

  factory Farm.fromJson(Map<String, dynamic> json) {
    return Farm(
      name: json['name'],
      location: json['location'],
      id: json['id'],
      // firstname: json['firstname'],
      // lastname: json['lastname'],
      // role: json['role'],
    );
  }
}
