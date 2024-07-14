import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageRepository {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadImage(String filePath, String fileName) async {
    try {
      final reference = _storage.ref().child('products/$fileName');
      final uploadTask = reference.putFile(File(filePath));
      final snapshot = await uploadTask.whenComplete(() => null);
      final url = await snapshot.ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      // Handle upload exceptions
      throw Exception("Error uploading image: ${e.message}");
    }
  }
}
