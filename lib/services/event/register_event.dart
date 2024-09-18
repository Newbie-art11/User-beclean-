import 'dart:ffi';

import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterSubmitted extends RegisterEvent {
  final String name;
  final String email;
  final String phone;
  final String password;

  RegisterSubmitted({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });

  @override
  List<Object> get props => [name, email, phone, password];
}

class Profile {
  final int id;
  final String name;
  final String phone;
  final String email;
  final String role;
  final String credit;
  final String createdAt;
  final String updatedAt;

  Profile({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.role,
    required this.credit,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      role: json['role'],
      credit: json['credit'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
