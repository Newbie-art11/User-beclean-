class AuthenticationModel {
  final String name;
  final String nohp;
  final String email;
  final String passwod;

  AuthenticationModel(
      {required this.name,
      required this.nohp,
      required this.email,
      this.passwod = ''});

  Map<String, dynamic> toJson() =>
      {'name': name, 'email': email, 'nohp': nohp, 'password': passwod};
}
