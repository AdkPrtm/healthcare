part of 'services.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<SignInSignUpResult> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      UserModel userModel = UserModel(
        id: userCredential.user!.uid,
        name: name,
        email: email,
        imageUrl: '',
      );
      await UserService().addUser(userModel);
      return SignInSignUpResult(userModel: userModel);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return SignInSignUpResult(
            message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return SignInSignUpResult(
            message: 'The account already exists for that email.');
      }
      throw e;
    }
  }

  Future<SignInSignUpResult> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      UserModel userModel =
          await UserService().getUserById(userCredential.user!.uid);
      return SignInSignUpResult(userModel: userModel);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user exists with this email.');
        return SignInSignUpResult(message: 'No user exists with this email.');
      } else if (e.code == 'wrong-password') {
        print('Incorrect Password.');
        return SignInSignUpResult(message: 'Incorrect Password.');
      }
      throw e;
    }
  }
}

class SignInSignUpResult {
  final UserModel? userModel;
  final String? message;

  SignInSignUpResult({this.userModel, this.message});
}
