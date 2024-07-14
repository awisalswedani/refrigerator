import 'package:flutter_application_1/src/features/tips/data/firestore_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firestoreServiceProvider = Provider<FirestoreService>((ref) {
  return FirestoreService();
});

final selectedCategoryProvider = StateProvider<String?>((ref) => null);
