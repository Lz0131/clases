import 'package:firebase_auth/firebase_auth.dart';

class EmailAuthFirebase {
  final auth = FirebaseAuth.instance;
  Future<bool> singUpUser(
      {required String name,
      required String password,
      required String email}) async {
    try {
      final UserCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (UserCredential.user != null) {
        UserCredential.user!.sendEmailVerification();
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
