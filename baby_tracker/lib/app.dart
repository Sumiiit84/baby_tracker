import 'package:flutter/material.dart';
import 'screens//welcome_screen.dart';
import 'screens/home_screen.dart';
import 'screens/baby_setup_screen.dart';
import 'screens/splash_screen.dart';

class BabyMoodTracker extends StatelessWidget {
  const BabyMoodTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baby & Mood Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.pink),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/': (context) => const WelcomeScreen(),
        '/setup': (context) => const BabySetupScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
