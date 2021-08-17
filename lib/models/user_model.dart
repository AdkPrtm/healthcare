part of 'models.dart';

class UserModel extends Equatable {
  final String id, name, email, imageUrl;
  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.imageUrl});
  UserModel copyWith({required String imageUrl}) => UserModel(
        id: this.id,
        name: this.name,
        email: this.email,
        imageUrl: imageUrl,
      );

  @override
  List<Object?> get props => [id, name, email, imageUrl];
}
