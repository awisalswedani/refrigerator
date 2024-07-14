import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_application_1/src/features/refrigerator/application/riverpod/refrigerator_repository_provider.dart';
import 'package:flutter_application_1/src/features/refrigerator/domain/refrigerator_item.dart';

class FirebaseRefrigeratorRepository implements RefrigeratorRepository {
  final CollectionReference _refrigeratorCollection = FirebaseFirestore.instance.collection('refrigerator');
  final FirebaseStorage _storage = FirebaseStorage.instance;

  @override
  Future<void> addOrUpdateItem(RefrigeratorItem item, {File? imageFile}) async {
    try {
      // Update item data (excluding image)
      await _refrigeratorCollection.doc(item.id).set(item.toJson()..remove('imageUrl')); // Remove imageUrl before saving

      if (imageFile != null) {
        final imageUrl = await _uploadImage(imageFile);
        item = item.copyWith(imageUrl: imageUrl); // Update item with uploaded URL
      }

      // Save item with potentially updated imageUrl
      await _refrigeratorCollection.doc(item.id).update({'imageUrl': item.imageUrl});
    } catch (e) {
      print('Error adding or updating item: $e');
      rethrow; // Rethrow the exception for higher layers to handle
    }
  }

  Future<String> _uploadImage(File imageFile) async {
    try {
      final Reference storageRef = _storage.ref().child('images/${DateTime.now().toString()}');
      final UploadTask uploadTask = storageRef.putFile(imageFile);
      final TaskSnapshot downloadUrl = await uploadTask.whenComplete(() => null);
      final String url = await downloadUrl.ref.getDownloadURL();
      return url;
    } catch (e) {
      print('Error uploading image: $e');
      rethrow;
    }
  }

  @override
  Future<void> deleteItem(String itemId) async {
    try {
      await _refrigeratorCollection.doc(itemId).delete();
    } catch (e) {
      print('Error deleting item: $e');
      rethrow; 
    }
  }

  @override
  Stream<List<RefrigeratorItem>> getItems() {
    return _refrigeratorCollection.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => RefrigeratorItem.fromJson(doc.data() as Map<String, dynamic>)).toList());
  }
}
