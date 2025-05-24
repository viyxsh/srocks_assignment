import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:srocks_music_assignment/core/services/firestore_service.dart';
import 'package:srocks_music_assignment/models/service_model.dart';

class HomeViewModel extends ChangeNotifier {
  final FirestoreService _firestoreService = GetIt.instance<FirestoreService>();

  List<ServiceModel> _services = [];
  Map<String, dynamic>? _banner;
  bool _isLoading = false;

  List<ServiceModel> get services => _services;
  Map<String, dynamic>? get banner => _banner;
  bool get isLoading => _isLoading;

  HomeViewModel() {
    fetchData();
  }

  Future<void> fetchData() async {
    _isLoading = true;
    notifyListeners();

    _services = await _firestoreService.getServices();
    _banner = await _firestoreService.getBanner();

    _isLoading = false;
    notifyListeners();
  }

  void navigateToDetails(BuildContext context, String serviceTitle) {
    final service = _services.firstWhere((s) => s.title == serviceTitle);
    Navigator.pushNamed(context, '/details', arguments: service);
  }
}