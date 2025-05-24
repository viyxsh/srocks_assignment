import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:srocks_music_assignment/core/di/app_provider.dart';
import 'package:srocks_music_assignment/core/constants/theme.dart';
import 'package:srocks_music_assignment/view/screens/home_screen.dart';
import 'package:srocks_music_assignment/view/screens/details_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Srocks Music',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/details': (context) => const DetailsScreen(),
      },
    );
  }
}