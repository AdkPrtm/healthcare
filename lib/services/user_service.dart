part of 'services.dart';

class UserService {
  CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('users');
  FirebaseStorage storage = FirebaseStorage.instance;

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

  Future<void> updateUser(
      {required String uid,
      required String name,
      String pickedImage = ''}) async {
    Reference storageRef = storage.ref('$uid.png');
    // _collectionReference.doc(userModel.id).update(data)
    try {
      if (pickedImage != '') {
        await storageRef.putFile(File(pickedImage));
        final imageUrl = await storageRef.getDownloadURL();
        _collectionReference.doc(uid).update({
          'name': name,
          'imageUrl': imageUrl,
        });
      } else {
        _collectionReference.doc(uid).update({
          'name': name,
        });
      }
    } catch (e) {
      throw e;
    }
  }
}
