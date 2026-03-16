import 'package:flutter/material.dart';
import 'package:projeto02/ui/splash_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Projeto 02 - Teste",
    theme: ThemeData(useMaterial3: true),
    home: SplashPage(),
  ));
}
