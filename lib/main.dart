import 'package:flutter/material.dart';
import 'package:test_app_solid/presentation/pages/home_page.dart';

void main() {
  runApp(const Main());
}

/// Main application class that initializes and starts the application
class Main extends StatelessWidget {
  /// Constructor of MyApp class
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test App Solid',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Nunito',
      ),
      home: const HomePage(title: 'Home Page'),
    );
  }
}
