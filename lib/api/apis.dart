import 'package:cloud_firestore/cloud_firestore.dart';

class APIs {
  static Stream<bool> shopStatusStream() {
    return FirebaseFirestore.instance
        .collection('shop')
        .doc('status')
        .snapshots()
        .map((snapshot) {
      if (snapshot.exists) {
        Map<String, dynamic>? data = snapshot.data();
        return data?['open'] ?? false;
      }
      return false;
    });
  }
}
