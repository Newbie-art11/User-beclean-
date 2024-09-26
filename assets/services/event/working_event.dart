// import 'package:equatable/equatable.dart';

// abstract class WorkingEvent extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

// class GetAccount extends WorkingEvent {
//   final int id;
//   final String name;
//   final String phone;
//   final String email;
//   final String role;
//   final String credit;
//   final String createdAt;
//   final String updatedAt;

//   GetAccount({
//     required this.id,
//     required this.name,
//     required this.phone,
//     required this.email,
//     required this.role,
//     required this.credit,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory GetAccount.fromJson(Map<String, dynamic> json) {
//     return GetAccount(
//       id: json['id'],
//       name: json['name'],
//       phone: json['phone'],
//       email: json['email'],
//       role: json['role'],
//       credit: json['credit'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//     );
//   }
// }
