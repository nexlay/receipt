import 'package:equatable/equatable.dart';

class LocalUser extends Equatable {
  final String id;
  final String name;
  final String surname;
  final String imageUrl;
  final String email;
  final String password;
  LocalUser({
    required this.id,
    required this.name,
    required this.surname,
    required this.imageUrl,
    required this.email,
    required this.password,
  });

  factory LocalUser.initialData() {
    return LocalUser(
      id: '',
      name: '',
      surname: '',
      imageUrl: '',
      email: '',
      password: '',
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        surname,
        imageUrl,
      ];
}
