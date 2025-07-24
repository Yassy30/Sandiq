import 'package:flutter/material.dart';
import 'package:sandiq/screens/resident/payments_screen.dart';
import 'package:sandiq/screens/resident/requests_screen.dart';
import 'package:sandiq/screens/resident/settings_screen.dart';

class ResidentHomeScreen extends StatefulWidget {
  const ResidentHomeScreen({super.key});

  @override
  State<ResidentHomeScreen> createState() => _ResidentHomeScreenState();
}

class _ResidentHomeScreenState extends State<ResidentHomeScreen> {
  int _selectedIndex = 0;
  
  // Sample data for announcements
  final List<Map<String, dynamic>> _announcements = [
    {
      'title': 'Building Maintenance Update',
      'type': 'Maintenance',
      'description': 'Dear Residents, please be advised that the annual building maintenance will commence on July 15th. This includes elevator servicing, common area painting, and garden upkeep. We appreciate your cooperation during this period.',
      'date': '2d ago',
    },
    {
      'title': 'Security Reminder',
      'type': 'Security',
      'description': 'A friendly reminder to all residents to ensure the main entrance door is securely closed at all times. Please also be vigilant about suspicious activities and report any concerns to the security team immediately.',
      'date': '1w ago',
    },
    {
      'title': 'Upcoming General Assembly',
      'type': 'Meeting',
      'description': 'The annual General Assembly meeting will be held on June 30th at 6 PM in the community hall. Important matters regarding the building\'s budget, upcoming projects, and community rules will be discussed. Your attendance is highly encouraged.',
      'date': '2w ago',
    },
  ];
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    
    // Navigate to the appropriate screen based on the selected index with smooth transition
    if (index == 1) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const ResidentPaymentsScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 300),
        ),
      );
    } else if (index == 2) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const ResidentRequestsScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 300),
        ),
      );
    } else if (index == 3) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const ResidentSettingsScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 300),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Announcements',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: _announcements.length,
          itemBuilder: (context, index) {
            final announcement = _announcements[index];
            return _buildAnnouncementCard(announcement);
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color.fromRGBO(195, 169, 145, 1),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: 'Payments'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Requests'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }

  Widget _buildAnnouncementCard(Map<String, dynamic> announcement) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.1),
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  _getIconForType(announcement['type']),
                  color: const Color.fromRGBO(195, 169, 145, 1),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    announcement['title'],
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  announcement['date'],
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              announcement['description'],
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForType(String type) {
    switch (type) {
      case 'Maintenance':
        return Icons.build;
      case 'Security':
        return Icons.security;
      case 'Meeting':
        return Icons.people;
      case 'Payment':
        return Icons.payment;
      default:
        return Icons.announcement;
    }
  }
}