import 'package:flutter_application_1/src/features/tips/data/firestore_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define the FirestoreService provider
final firestoreServiceProvider = Provider<FirestoreService>((ref) {
  return FirestoreService();
});

// Define a state class for tips
class TipsState {
  final String? category;
  final String name;
  final String details;

  TipsState({this.category, required this.name, required this.details});
}

// Define a state notifier for managing tips state
class TipsStateNotifier extends StateNotifier<TipsState> {
  TipsStateNotifier() : super(TipsState(category: null, name: '', details: ''));

  void setCategory(String category) {
    state = TipsState(category: category, name: state.name, details: state.details);
  }

  void setName(String name) {
    state = TipsState(category: state.category, name: name, details: state.details);
  }

  void setDetails(String details) {
    state = TipsState(category: state.category, name: state.name, details: details);
  }

  void clear() {
    state = TipsState(category: null, name: '', details: '');
  }
}

// Define the TipsState provider
final tipsProvider = StateNotifierProvider<TipsStateNotifier, TipsState>((ref) {
  return TipsStateNotifier();
});
