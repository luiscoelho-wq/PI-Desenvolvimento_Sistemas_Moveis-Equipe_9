// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ui/splash_page.dart';
import 'ui/login_page.dart';
import 'ui/register_page.dart';
import 'ui/dashboard_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));

  runApp(const AtlasApp());
}

class AtlasApp extends StatelessWidget {
  const AtlasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atlas Contábil',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      initialRoute: '/splash',
      onGenerateRoute: _generateRoute,
    );
  }
}

// Tema global
ThemeData buildTheme() {
  const primary = Color(0xFF8236FB);
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      primary: primary,
      background: const Color(0xFFF9FAFB),
      surface: Colors.white,
    ),
    scaffoldBackgroundColor: const Color(0xFFF9FAFB),
    textTheme: GoogleFonts.quicksandTextTheme(),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: _SlidePageTransitionBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );
}

// Roteador
Route<dynamic> _generateRoute(RouteSettings settings) {
  Widget page;
  switch (settings.name) {
    case '/splash':
      page = const SplashPage();
      break;
    case '/login':
      page = const LoginPage();
      break;
    case '/register':
      page = const RegisterPage();
      break;
    case '/dashboard':
      final args = settings.arguments as Map<String, dynamic>?;
      page = DashboardPage(
        userName: args?['userName'] as String? ?? 'Usuário',
      );
      break;
    default:
      page = const NotFoundPage();
  }
  return MaterialPageRoute(builder: (_) => page, settings: settings);
}

// Transição de slide
class _SlidePageTransitionBuilder extends PageTransitionsBuilder {
  const _SlidePageTransitionBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
      )),
      child: child,
    );
  }
}

// Página 404
class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.map_outlined, size: 64, color: Color(0xFF8236FB)),
            const SizedBox(height: 16),
            Text(
              'Página não encontrada',
              style: GoogleFonts.quicksand(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, '/login'),
              child: const Text('Voltar ao login'),
            ),
          ],
        ),
      ),
    );
  }
}
