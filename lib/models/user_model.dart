class UserModel {
  final String id;
  final String name;
  final String email;
  final String passwod;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      this.passwod = ''});
}
