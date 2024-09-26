class AccountModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String role;
  final String? accesToken;
  final String credit;
  final DateTime createdAt;
  final DateTime updatedAt;
  AccountModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.role,
      this.accesToken,
      required this.credit,
      required this.createdAt,
      required this.updatedAt});

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      role: json['role'],
      accesToken: json['access_token'],
      credit: json['credit'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
