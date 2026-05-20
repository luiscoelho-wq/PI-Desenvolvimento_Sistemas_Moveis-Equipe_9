class AppUser {
  final String id;
  final String name;
  final String email;
  final String? cpf;

  AppUser({
    required this.id,
    required this.name,
    required this.email,
    this.cpf,
  });
}
