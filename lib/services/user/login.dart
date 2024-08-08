import 'package:firebase_auth/firebase_auth.dart';

class LoginService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Login berhasil';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'Pengguna tidak ditemukan';
      } else if (e.code == 'wrong-password') {
        return 'Kata sandi salah';
      } else {
        print('Email atau kata sandi salah');
      }
    }
    return 'Email atau kata sandi salah';
  }
}
