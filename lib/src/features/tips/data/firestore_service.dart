import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveTip(String category, String name, String details) async {
    try {
      await _firestore.collection('tips').add({
        'category': category,
        'name': name,
        'details': details,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error adding tip to Firestore: $e');
    }
  }
}
