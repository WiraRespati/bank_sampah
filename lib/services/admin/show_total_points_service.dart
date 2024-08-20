import 'package:cloud_firestore/cloud_firestore.dart';

class ShowTotalPointsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> getTotalPoints() async {
    int totalPoints = 0;

    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firestore.collection('users').get();

      for (final QueryDocumentSnapshot<Map<String, dynamic>> document
          in querySnapshot.docs) {
        final Map<String, dynamic> data = document.data();
        final int points = data['points'] ?? 0;
        totalPoints += points;
      }

      return {
        'status': 'success',
        'totalPoints': totalPoints,
      };
    } catch (e) {
      return {
        'status': 'error',
        'message': e.toString(),
      };
    }
  }
}
