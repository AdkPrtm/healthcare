part of 'services.dart';

class AuthService {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  Future<SignInSignUpResult> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      userCredential.user!.updateDisplayName(name);
      await userCredential.user!.sendEmailVerification();
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
        return SignInSignUpResult(
            message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
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
      if (userCredential.user!.emailVerified) {
        UserModel userModel =
            await UserService().getUserById(userCredential.user!.uid);
        return SignInSignUpResult(userModel: userModel);
      } else {
        return SignInSignUpResult(
            message: 'Please verify your email address first');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return SignInSignUpResult(message: 'No user exists with this email.');
      } else if (e.code == 'wrong-password') {
        return SignInSignUpResult(message: 'Incorrect Password.');
      }
      throw e;
    }
  }

  Future resendEmail({required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      await userCredential.user!.sendEmailVerification();
    } catch (e) {
      throw e;
    }
  }

  Future<bool> fogetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return false;
      }
      throw e;
    }
  }

  Future<bool> changePassword(
      {required String email,
      required String oldpassword,
      required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: oldpassword);
      await userCredential.user!.updatePassword(password);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static Stream<User?> get userStream => _auth.authStateChanges();
}

class SignInSignUpResult {
  final UserModel? userModel;
  final String? message;

  SignInSignUpResult({this.userModel, this.message});
}
