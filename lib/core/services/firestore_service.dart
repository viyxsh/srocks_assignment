import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:srocks_music_assignment/models/service_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ServiceModel>> getServices() async {
    try {
      final snapshot = await _firestore.collection('services').get();
      return snapshot.docs
          .map((doc) => ServiceModel.fromMap(doc.data()))
          .toList();
    } catch (e) {
      print('Error fetching services: $e');
      return [];
    }
  }

  Future<Map<String, dynamic>?> getBanner() async {
    try {
      final snapshot = await _firestore
          .collection('banners')
          .doc('free_demo')
          .get();
      return snapshot.data();
    } catch (e) {
      print('Error fetching banner: $e');
      return null;
    }
  }
}