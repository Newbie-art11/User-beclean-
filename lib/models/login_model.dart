class LoginModel {
  final String email;
  final String password;
  final String? token;

  LoginModel(
      {required this.email, required this.password, required this.token});
  Map<String, dynamic> toJson() =>
      {'email': email, 'password': password, 'token': token};
}
