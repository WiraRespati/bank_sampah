import 'package:bank_sampah/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> registerWithEmailAndPassword(
    String name,
    String email,
    String password,
    String nik,
  ) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User user = userCredential.user!;

      UserModel userModel = UserModel(
        uid: user.uid,
        name: name,
        email: email,
        nik: nik,
        gender: 'Pria',
        phone: '',
        points: 0,
        role: 'user',
      );
      await _firestore
          .collection('users')
          .doc(user.uid)
          .set(userModel.toJson());
      return 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'weak-password';
      } else if (e.code == 'email-already-in-use') {
        return 'email-already-in-use';
      } else {
        return 'error';
      }
    }
  }
}
