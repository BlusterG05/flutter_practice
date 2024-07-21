import 'package:flutter/material.dart';
import 'login_form.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Formularios",
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 65, 67, 71)),
        useMaterial3: true,
      ),
      home: LoginForm(),
    );
  }
}
