import 'package:bank_sampah/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get user => _auth.currentUser;

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<UserModel> getUserData() async {
    DocumentSnapshot snapshot =
        await _firestore.collection('users').doc(user!.uid).get();
    return UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
  }

  Future<bool> checkAdmin() async {
    DocumentSnapshot snapshot =
        await _firestore.collection('users').doc(user!.uid).get();
    var data = snapshot.data() as Map<String, dynamic>;
    return data['role'] == 'admin';
  }
}
