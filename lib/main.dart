import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pi2/views/splash_view.dart';
import 'package:pi2/views/login_view.dart';
import 'package:pi2/views/register_view.dart';
import 'package:pi2/views/dashboard_view.dart';
import 'package:provider/provider.dart';

import 'firebase.options.dart';

import 'viewmodels/dashboard_viewmodel.dart';
import 'viewmodels/client_viewmodel.dart';
import 'services/auth_service.dart';

import 'repositories/task_repository.dart';

import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthService>(create: (_) => AuthService()),
        ChangeNotifierProvider<ClientViewModel>(
          create: (_) => ClientViewModel(),
        ),
        ChangeNotifierProvider<DashboardViewModel>(
          create: (context) => DashboardViewModel(
            authService: context.read<AuthService>(),
            repository: TaskRepository(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Atlas Contábil',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: GoogleFonts.quicksand().fontFamily,
          primaryColor: const Color(0xFF6A1B9A),
          scaffoldBackgroundColor: const Color(0xFFF6F6F6),
        ),
        home: SplashView(),
        routes: {
          '/login': (context) => LoginView(),
          '/register': (context) => const RegisterView(),
          '/dashboard': (context) =>
              DashboardView(vm: context.read<DashboardViewModel>()),
        },
      ),
    );
  }
}
