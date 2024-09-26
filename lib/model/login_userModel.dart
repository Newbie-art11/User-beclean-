class LoginUsermodel {
  final String id;
  final String name;
  final String email;
  final String role;
  final String image;
  LoginUsermodel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.image,
  });

  // Factory method to create UserModel from JSON
  factory LoginUsermodel.fromJson(Map<String, dynamic> json) {
    return LoginUsermodel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      role: json['role']['name'],
      image: json['image'],
    );
  }
}
