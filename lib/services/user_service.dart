part of 'services.dart';

class UserService {
  CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUser(UserModel user) async {
    try {
      await _collectionReference.doc(user.id).set({
        'uid': user.id,
        'email': user.email,
        'name': user.name,
        'imageUrl': '',
      });
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _collectionReference.doc(id).get();
      return UserModel(
        id: id,
        name: snapshot['name'],
        email: snapshot['email'],
        imageUrl: snapshot['imageUrl'],
      );
    } catch (e) {
      throw e;
    }
  }
}
