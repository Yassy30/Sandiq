// import 'package:flutter/material.dart';

// class PaymentsScreen extends StatefulWidget {
//   const PaymentsScreen({super.key});

//   @override
//   State<PaymentsScreen> createState() => _PaymentsScreenState();
// }

// class _PaymentsScreenState extends State<PaymentsScreen> {
//   int _selectedIndex = 2; // Payments tab selected
//   final TextEditingController _searchController = TextEditingController();
//   String _selectedFilter = 'All';
  
//   // Sample data for payments
//   final List<Map<String, dynamic>> _payments = [
//     {
//       'resident': 'Fatima Zahra',
//       'apartment': 'Apt. 101',
//       'amount': '1,200 MAD',
//       'status': 'Paid',
//       'date': '2024-01-10',
//       'method': 'Card',
//       'dueDate': null,
//     },
//     {
//       'resident': 'Ahmed El Amrani',
//       'apartment': 'Apt. 102',
//       'amount': '1,200 MAD',
//       'status': 'Unpaid',
//       'date': null,
//       'method': 'Face to Face',
//       'dueDate': '2024-02-15',
//     },
//     {
//       'resident': 'Sara Benali',
//       'apartment': 'Apt. 103',
//       'amount': '1,200 MAD',
//       'status': 'Paid',
//       'date': '2024-01-05',
//       'method': 'Card',
//       'dueDate': null,
//     },
//     {
//       'resident': 'Youssef Alaoui',
//       'apartment': 'Apt. 104',
//       'amount': '1,200 MAD',
//       'status': 'Paid',
//       'date': '2024-01-08',
//       'method': 'Face to Face',
//       'dueDate': null,
//     },
//     {
//       'resident': 'Leila Haddad',
//       'apartment': 'Apt. 105',
//       'amount': '1,200 MAD',
//       'status': 'Unpaid',
//       'date': null,
//       'method': 'Face to Face',
//       'dueDate': '2024-02-20',
//     },
//   ];

//   List<Map<String, dynamic>> get filteredPayments {
//     List<Map<String, dynamic>> result = _payments;
    
//     // Apply search filter
//     if (_searchController.text.isNotEmpty) {
//       result = result.where((payment) {
//         return payment['resident'].toLowerCase().contains(_searchController.text.toLowerCase()) ||
//                payment['apartment'].toLowerCase().contains(_searchController.text.toLowerCase());
//       }).toList();
//     }
    
//     // Apply status filter
//     if (_selectedFilter != 'All') {
//       result = result.where((payment) => payment['status'] == _selectedFilter).toList();
//     }
    
//     return result;
//   }
  
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
    
//     // Navigate to the appropriate screen based on the selected index
//     if (index == 0) {
//       Navigator.pushReplacementNamed(context, '/dashboard');
//     } else if (index == 1) {
//       Navigator.pushReplacementNamed(context, '/residents');
//     } else if (index == 3) {
//       Navigator.pushReplacementNamed(context, '/requests');
//     } else if (index == 4) {
//       Navigator.pushReplacementNamed(context, '/settings');
//     }
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F7FA),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           'Payments',
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//           textAlign: TextAlign.center,
//         ),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Search and filter bar
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 children: [
//                   // Search field
//                   Expanded(
//                     child: TextField(
//                       controller: _searchController,
//                       decoration: InputDecoration(
//                         hintText: 'Search',
//                         prefixIcon: const Icon(Icons.search, color: Colors.grey),
//                         filled: true,
//                         fillColor: Colors.white,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide.none,
//                         ),
//                         contentPadding: const EdgeInsets.symmetric(vertical: 0),
//                       ),
//                       onChanged: (value) {
//                         setState(() {});
//                       },
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   // Filter dropdown
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: DropdownButton<String>(
//                       value: _selectedFilter,
//                       icon: const Icon(Icons.filter_list),
//                       underline: Container(),
//                       items: <String>['All', 'Paid', 'Unpaid']
//                           .map<DropdownMenuItem<String>>((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           _selectedFilter = newValue!;
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
            
//             // Payment summary
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Row(
//                 children: [
//                   _buildSummaryCard(
//                     'Total Collected',
//                     '3,600 MAD',
//                     Colors.green[100]!,
//                     Colors.green,
//                   ),
//                   const SizedBox(width: 16),
//                   _buildSummaryCard(
//                     'Pending',
//                     '2,400 MAD',
//                     Colors.red[100]!,
//                     Colors.red,
//                   ),
//                 ],
//               ),
//             ),
            
//             const SizedBox(height: 16),
            
//             // Payments list header
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text(
//                 'Payment Records',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
            
//             // Payments list
//             Expanded(
//               child: ListView.builder(
//                 itemCount: filteredPayments.length,
//                 padding: const EdgeInsets.all(16.0),
//                 itemBuilder: (context, index) {
//                   final payment = filteredPayments[index];
//                   return _buildPaymentItem(payment);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//          backgroundColor: Colors.white,
//         type: BottomNavigationBarType.fixed,
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         selectedItemColor: const Color.fromRGBO(195, 169, 145, 1),
//         unselectedItemColor: Colors.grey,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Residents'),
//           BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: 'Payments'),
//           BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Requests'),
//           BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'More'),
//         ],
//       ),
//     );
//   }

//   Widget _buildSummaryCard(String title, String amount, Color bgColor, Color textColor) {
//     return Expanded(
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: bgColor,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 color: textColor,
//                 fontSize: 14,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               amount,
//               style: TextStyle(
//                 color: textColor,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildPaymentItem(Map<String, dynamic> payment) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 16.0),
//       elevation: 0,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       payment['resident'],
//                       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       payment['apartment'],
//                       style: TextStyle(color: Colors.grey[600], fontSize: 14),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                   decoration: BoxDecoration(
//                     color: payment['status'] == 'Paid' ? Colors.green[100] : Colors.red[100],
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Text(
//                     payment['status'],
//                     style: TextStyle(
//                       color: payment['status'] == 'Paid' ? Colors.green : Colors.red,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Amount',
//                       style: TextStyle(color: Colors.grey, fontSize: 14),
//                     ),
//                     Text(
//                       payment['amount'],
//                       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     const Text(
//                       'Payment Method',
//                       style: TextStyle(color: Colors.grey, fontSize: 14),
//                     ),
//                     Text(
//                       payment['method'],
//                       style: const TextStyle(fontSize: 16),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 if (payment['date'] != null) ...[  
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Payment Date',
//                         style: TextStyle(color: Colors.grey, fontSize: 14),
//                       ),
//                       Text(
//                         payment['date'],
//                         style: const TextStyle(fontSize: 16),
//                       ),
//                     ],
//                   ),
//                 ] else if (payment['dueDate'] != null) ...[  
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Due Date',
//                         style: TextStyle(color: Colors.grey, fontSize: 14),
//                       ),
//                       Text(
//                         payment['dueDate'],
//                         style: const TextStyle(fontSize: 16, color: Colors.red),
//                       ),
//                     ],
//                   ),
//                 ],
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:sandiq/dashboard_screen.dart';
import 'package:sandiq/requests_screen.dart';
import 'package:sandiq/residents_screen.dart';
import 'package:sandiq/settings_screen.dart';

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({super.key});

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  int _selectedIndex = 2; // Payments tab selected
  final TextEditingController _searchController = TextEditingController();
  String _selectedFilter = 'All';
  
  // Sample data for payments
  final List<Map<String, dynamic>> _payments = [
    {
      'resident': 'Fatima Zahra',
      'apartment': 'Apt. 101',
      'amount': '1,200 MAD',
      'status': 'Paid',
      'date': '2024-01-10',
      'method': 'Card',
      'dueDate': null,
    },
    {
      'resident': 'Ahmed El Amrani',
      'apartment': 'Apt. 102',
      'amount': '1,200 MAD',
      'status': 'Unpaid',
      'date': null,
      'method': 'Face to Face',
      'dueDate': '2024-02-15',
    },
    {
      'resident': 'Sara Benali',
      'apartment': 'Apt. 103',
      'amount': '1,200 MAD',
      'status': 'Paid',
      'date': '2024-01-05',
      'method': 'Card',
      'dueDate': null,
    },
    {
      'resident': 'Youssef Alaoui',
      'apartment': 'Apt. 104',
      'amount': '1,200 MAD',
      'status': 'Paid',
      'date': '2024-01-08',
      'method': 'Face to Face',
      'dueDate': null,
    },
    {
      'resident': 'Leila Haddad',
      'apartment': 'Apt. 105',
      'amount': '1,200 MAD',
      'status': 'Unpaid',
      'date': null,
      'method': 'Face to Face',
      'dueDate': '2024-02-20',
    },
  ];

  List<Map<String, dynamic>> get filteredPayments {
    List<Map<String, dynamic>> result = _payments;
    
    // Apply search filter
    if (_searchController.text.isNotEmpty) {
      result = result.where((payment) {
        return payment['resident'].toLowerCase().contains(_searchController.text.toLowerCase()) ||
               payment['apartment'].toLowerCase().contains(_searchController.text.toLowerCase());
      }).toList();
    }
    
    // Apply status filter
    if (_selectedFilter != 'All') {
      result = result.where((payment) => payment['status'] == _selectedFilter).toList();
    }
    
    return result;
  }
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    
   // Navigate to the appropriate screen based on the selected index with smooth transition
    if (index == 0) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const DashboardScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 300),
        ),
      );
    } else if (index == 1) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const ResidentsScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 300),
        ),
      );
    } else if (index == 3) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const RequestsScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 300),
        ),
      );
    } else if (index == 4) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const SettingsScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 300),
        ),
      );
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Payments',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search and filter bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  // Search field
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: const Icon(Icons.search, color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Filter dropdown
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton<String>(
                      value: _selectedFilter,
                      icon: const Icon(Icons.filter_list),
                      underline: Container(),
                      items: <String>['All', 'Paid', 'Unpaid']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedFilter = newValue!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            
            // Payment summary
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  _buildSummaryCard(
                    'Total Collected',
                    '3,600 MAD',
                    Colors.green[100]!,
                    Colors.green,
                  ),
                  const SizedBox(width: 16),
                  _buildSummaryCard(
                    'Pending',
                    '2,400 MAD',
                    Colors.red[100]!,
                    Colors.red,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Payments list header
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Payment Records',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
            // Payments list
            Expanded(
              child: ListView.builder(
                itemCount: filteredPayments.length,
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (context, index) {
                  final payment = filteredPayments[index];
                  return _buildPaymentItem(payment);
                },
              ),
            ),
          ],
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
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Residents'),
          BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: 'Payments'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Requests'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'More'),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(String title, String amount, Color bgColor, Color textColor) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              amount,
              style: TextStyle(
                color: textColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentItem(Map<String, dynamic> payment) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 4, // Added elevation for shadow
      shadowColor: Colors.grey[400], // Grey shadow for border
      color: Colors.white, // Explicitly set background to white
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      payment['resident'],
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      payment['apartment'],
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: payment['status'] == 'Paid' ? Colors.green[100] : Colors.red[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    payment['status'],
                    style: TextStyle(
                      color: payment['status'] == 'Paid' ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Amount',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Text(
                      payment['amount'],
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Payment Method',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Text(
                      payment['method'],
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (payment['date'] != null) ...[  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Payment Date',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Text(
                        payment['date'],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ] else if (payment['dueDate'] != null) ...[  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Due Date',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Text(
                        payment['dueDate'],
                        style: const TextStyle(fontSize: 16, color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}