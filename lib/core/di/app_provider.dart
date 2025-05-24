import 'package:get_it/get_it.dart';
import 'package:srocks_music_assignment/core/services/firestore_service.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<FirestoreService>(FirestoreService());
}