// import 'package:flutter/material.dart';
// import 'package:sandiq/screens/resident/home_screen.dart';
// import 'package:sandiq/screens/resident/payments_screen.dart';
// import 'package:sandiq/screens/resident/settings_screen.dart';

// class ResidentRequestsScreen extends StatefulWidget {
//   const ResidentRequestsScreen({super.key});

//   @override
//   State<ResidentRequestsScreen> createState() => _ResidentRequestsScreenState();
// }

// class _ResidentRequestsScreenState extends State<ResidentRequestsScreen> {
//   int _selectedIndex = 2; // Requests tab selected
  
//   // Sample data for maintenance requests
//   final List<Map<String, dynamic>> _requests = [
//     {
//       'title': 'Leaky faucet in bathroom',
//       'date': '2024-01-15',
//       'status': 'Pending',
//       'description': 'The bathroom sink faucet is leaking and causing water damage.',
//     },
//     {
//       'title': 'Air conditioning not working',
//       'date': '2024-01-10',
//       'status': 'In Progress',
//       'description': 'The AC unit in the living room is not cooling properly.',
//     },
//     {
//       'title': 'Light fixture replacement',
//       'date': '2024-01-05',
//       'status': 'Completed',
//       'description': 'The ceiling light in the kitchen needs to be replaced.',
//     },
//   ];
  
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
    
//     // Navigate to the appropriate screen based on the selected index with smooth transition
//     if (index == 0) {
//       Navigator.of(context).pushReplacement(
//         PageRouteBuilder(
//           pageBuilder: (context, animation, secondaryAnimation) => const ResidentHomeScreen(),
//           transitionsBuilder: (context, animation, secondaryAnimation, child) {
//             return FadeTransition(opacity: animation, child: child);
//           },
//           transitionDuration: const Duration(milliseconds: 300),
//         ),
//       );
//     } else if (index == 1) {
//       Navigator.of(context).pushReplacement(
//         PageRouteBuilder(
//           pageBuilder: (context, animation, secondaryAnimation) => const ResidentPaymentsScreen(),
//           transitionsBuilder: (context, animation, secondaryAnimation, child) {
//             return FadeTransition(opacity: animation, child: child);
//           },
//           transitionDuration: const Duration(milliseconds: 300),
//         ),
//       );
//     } else if (index == 3) {
//       Navigator.of(context).pushReplacement(
//         PageRouteBuilder(
//           pageBuilder: (context, animation, secondaryAnimation) => const ResidentSettingsScreen(),
//           transitionsBuilder: (context, animation, secondaryAnimation, child) {
//             return FadeTransition(opacity: animation, child: child);
//           },
//           transitionDuration: const Duration(milliseconds: 300),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F7FA),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           'My Requests',
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.add_circle_outline, color: Colors.black),
//             onPressed: () {
//               // Add new request functionality
//             },
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: ListView.builder(
//           padding: const EdgeInsets.all(16.0),
//           itemCount: _requests.length,
//           itemBuilder: (context, index) {
//             final request = _requests[index];
//             return _buildRequestCard(request);
//           },
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.white,
//         type: BottomNavigationBarType.fixed,
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         selectedItemColor: const Color.fromRGBO(195, 169, 145, 1),
//         unselectedItemColor: Colors.grey,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: 'Payments'),
//           BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Requests'),
//           BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
//         ],
//       ),
//     );
//   }

//   Widget _buildRequestCard(Map<String, dynamic> request) {
//     Color statusColor;
//     switch (request['status']) {
//       case 'Pending':
//         statusColor = Colors.orange;
//         break;
//       case 'In Progress':
//         statusColor = Colors.blue;
//         break;
//       case 'Completed':
//         statusColor = Colors.green;
//         break;
//       default:
//         statusColor = Colors.grey;
//     }

//     return Card(
//       elevation: 4,
//       shadowColor: Colors.black.withOpacity(0.1),
//       color: Colors.white,
//       margin: const EdgeInsets.only(bottom: 16.0),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: Text(
//                     request['title'],
//                     style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                   decoration: BoxDecoration(
//                     color: statusColor.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                   child: Text(
//                     request['status'],
//                     style: TextStyle(
//                       color: statusColor,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Date: ${request['date']}',
//               style: TextStyle(color: Colors.grey[600], fontSize: 14),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               request['description'],
//               style: const TextStyle(fontSize: 14),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:sandiq/screens/resident/home_screen.dart';
import 'package:sandiq/screens/resident/payments_screen.dart';
import 'package:sandiq/screens/resident/settings_screen.dart';
import 'new_request_screen.dart'; // Import the new screen

class ResidentRequestsScreen extends StatefulWidget {
  const ResidentRequestsScreen({super.key});

  @override
  State<ResidentRequestsScreen> createState() => _ResidentRequestsScreenState();
}

class _ResidentRequestsScreenState extends State<ResidentRequestsScreen> {
  int _selectedIndex = 2; // Requests tab selected
  
  // Sample data for maintenance requests
  final List<Map<String, dynamic>> _requests = [
    {
      'title': 'Leaky faucet in bathroom',
      'date': '2024-01-15',
      'status': 'Pending',
      'description': 'The bathroom sink faucet is leaking and causing water damage.',
    },
    {
      'title': 'Air conditioning not working',
      'date': '2024-01-10',
      'status': 'Viewed',
      'description': 'The AC unit in the living room is not cooling properly.',
    },
    {
      'title': 'Light fixture replacement',
      'date': '2024-01-05',
      'status': 'Completed',
      'description': 'The ceiling light in the kitchen needs to be replaced.',
    },
  ];
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    
    // Navigate to the appropriate screen based on the selected index with smooth transition
    if (index == 0) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const ResidentHomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 300),
        ),
      );
    } else if (index == 1) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const ResidentPaymentsScreen(),
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
          'My Requests',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NewRequestScreen()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: _requests.length,
          itemBuilder: (context, index) {
            final request = _requests[index];
            return _buildRequestCard(request);
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

  Widget _buildRequestCard(Map<String, dynamic> request) {
    Color statusColor;
    switch (request['status']) {
      case 'Pending':
        statusColor = Colors.orange;
        break;
      case 'Viewed':
        statusColor = Colors.blue;
        break;
      case 'Completed':
        statusColor = Colors.green;
        break;
      default:
        statusColor = Colors.grey;
    }

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    request['title'],
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    request['status'],
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Date: ${request['date']}',
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text(
              request['description'],
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}