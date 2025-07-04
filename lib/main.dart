import 'package:flutter/material.dart';
import 'welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cuaca Lucu',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
