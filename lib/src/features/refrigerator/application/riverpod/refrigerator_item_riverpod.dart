import 'package:flutter_application_1/src/features/refrigerator/domain/refrigerator_item_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final firebaseFirestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final refrigeratorItemsProvider = StateNotifierProvider<
    RefrigeratorItemsNotifier, List<RefrigeratorItemModel>>((ref) {
  final firestore = ref.watch(firebaseFirestoreProvider);
  return RefrigeratorItemsNotifier(firestore);
});

class RefrigeratorItemsNotifier
    extends StateNotifier<List<RefrigeratorItemModel>> {
  final FirebaseFirestore firestore;

  RefrigeratorItemsNotifier(this.firestore) : super([]) {
    fetchItems();
  }

  Future<void> fetchItems() async {
    final snapshot = await firestore.collection('Add_New_Item').get();
    state = snapshot.docs
        .map((doc) => RefrigeratorItemModel.fromMap(doc.data()))
        .toList();
  }
}
