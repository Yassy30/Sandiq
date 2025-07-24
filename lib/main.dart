import 'package:flutter/material.dart';
import 'authentification/splash_screen.dart';
import 'screens/sandiq/dashboard_screen.dart';
import 'screens/sandiq/residents_screen.dart';
import 'screens/sandiq/requests_screen.dart';
import 'screens/sandiq/payments_screen.dart';
import 'screens/sandiq/settings_screen.dart';
import 'screens/sandiq/profile_screen.dart';
import 'screens/sandiq/announcement_form.dart';
import 'screens/resident/home_screen.dart';
import 'screens/resident/payments_screen.dart';
import 'screens/resident/requests_screen.dart';
import 'screens/resident/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sandiq Building Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF000000)),
        useMaterial3: true,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        // Syndic routes
        '/dashboard': (context) => const DashboardScreen(),
        '/residents': (context) => const ResidentsScreen(),
        '/requests': (context) => const RequestsScreen(),
        '/payments': (context) => const PaymentsScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/new_announcement': (context) => const NewAnnouncementScreen(),
        
        // Resident routes
        '/resident/home': (context) => const ResidentHomeScreen(),
        '/resident/payments': (context) => const ResidentPaymentsScreen(),
        '/resident/requests': (context) => const ResidentRequestsScreen(),
        '/resident/settings': (context) => const ResidentSettingsScreen(),
      },
    );
  }
}