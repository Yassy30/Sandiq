import 'package:flutter/material.dart';
import 'profile_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _selectedIndex = 4; // More tab selected
  bool _pushNotifications = false;
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    
    // Navigate to the appropriate screen based on the selected index
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/residents');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/payments');
    } else if (index == 3) {
      Navigator.pushReplacementNamed(context, '/requests');
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
          'Settings',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Language Section
              _buildSectionHeader('Language'),
              _buildSettingItem('Arabic', onTap: () {}),
              _buildSettingItem('French', onTap: () {}),
              
              // Notifications Section
              _buildSectionHeader('Notifications'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Push Notifications',
                      style: TextStyle(fontSize: 16),
                    ),
                    Switch(
                      value: _pushNotifications,
                      onChanged: (value) {
                        setState(() {
                          _pushNotifications = value;
                        });
                      },
                      activeColor: const Color.fromRGBO(195, 169, 145, 1),
                    ),
                  ],
                ),
              ),
              
              // Account Section
              _buildSectionHeader('Account'),
              _buildSettingItem(
                'Edit Profile', 
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfileScreen()),
                  );
                },
                showArrow: true,
              ),
              _buildSettingItem(
                'Change Password', 
                onTap: () {},
                showArrow: true,
              ),
              _buildSettingItem(
                'Logout', 
                onTap: () {},
                showArrow: true,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color.fromRGBO(195, 169, 145, 1),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Residents'),
          BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: 'Payments'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Requests'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'More'),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0, bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSettingItem(String title, {required Function() onTap, bool showArrow = false}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
            if (showArrow)
              const Icon(Icons.arrow_forward, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}