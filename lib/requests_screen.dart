import 'package:flutter/material.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({super.key});

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  int _selectedIndex = 3; // Requests tab selected
  
  // Sample data for maintenance requests
  final List<Map<String, dynamic>> _requests = [
    {
      'title': 'Leaky faucet in apartment 3B',
      'date': '2024-01-15',
      'resident': 'Omar Hassan',
      'status': 'Pending'
    },
    {
      'title': 'Broken window in common area',
      'date': '2024-01-10',
      'resident': 'Fatima El-Amrani',
      'status': 'In Progress'
    },
    {
      'title': 'Elevator malfunction',
      'date': '2024-01-05',
      'resident': 'Youssef Benali',
      'status': 'Completed'
    },
  ];
  
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
    }
    else if (index == 4) {
      Navigator.pushReplacementNamed(context, '/settings');
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
          'Requests',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _requests.length,
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (context, index) {
            final request = _requests[index];
            return _buildRequestItem(request);
          },
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

  Widget _buildRequestItem(Map<String, dynamic> request) {
    // Format date to display as "Date: YYYY-MM-DD"
    String formattedDate = "Date: ${request['date']}";
    
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    request['title'],
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.build, color: Colors.blue),
                  onPressed: () {
                    // Handle edit request
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              formattedDate,
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Text('Resident: ', style: TextStyle(color: Colors.grey, fontSize: 14)),
                Text(
                  request['resident'],
                  style: const TextStyle(color: Colors.blue, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}