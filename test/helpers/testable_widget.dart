import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pi2/services/auth_service.dart';

Widget makeTestableWidget({
  required Widget child,
  required AuthService authService,
}) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthService>.value(value: authService),
    ],
    child: MaterialApp(
      home: child,
    ),
  );
}