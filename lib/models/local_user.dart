class LocalUser {
  final String name;
  final String surname;
  final String imageUrl;
  LocalUser(
      {required this.name, required this.surname, required this.imageUrl});

  factory LocalUser.initialData() {
    return LocalUser(name: '', surname: '', imageUrl: '');
  }
}
