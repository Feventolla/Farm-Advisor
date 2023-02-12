import 'dart:convert';

class User {
  String country;
  String phone;
  String token;
  // String lastname;
  // String role;

  User({
    required this.country,
    required this.phone,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      country: json['country'],
      phone: json['phone'],
      token: json['token'],
      // lastname: json['lastname'],
      // role: json['role'],
    );
  }
}
