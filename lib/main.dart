import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'dashboard_screen.dart';
import 'residents_screen.dart';
import 'requests_screen.dart';
import 'payments_screen.dart';
import 'settings_screen.dart';
import 'profile_screen.dart';
import 'announcement_form.dart'; // Import the new announcement screen

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
        '/dashboard': (context) => const DashboardScreen(),
        '/residents': (context) => const ResidentsScreen(),
        '/requests': (context) => const RequestsScreen(),
        '/payments': (context) => const PaymentsScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/new_announcement': (context) => const NewAnnouncementScreen(), // Added route for new announcement
      },
    );
  }
}