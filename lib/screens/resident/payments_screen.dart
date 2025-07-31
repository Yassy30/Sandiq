import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sandiq/screens/resident/home_screen.dart';
import 'package:sandiq/screens/resident/requests_screen.dart';
import 'package:sandiq/screens/resident/settings_screen.dart';

class ResidentPaymentsScreen extends StatefulWidget {
  final Map<String, dynamic>? newPayment;

  const ResidentPaymentsScreen({this.newPayment, super.key});

  @override
  State<ResidentPaymentsScreen> createState() => _ResidentPaymentsScreenState();
}

class PaymentDetailsDialog extends StatelessWidget {
  final Map<String, dynamic> payment;

  const PaymentDetailsDialog({required this.payment, super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              payment['title'],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildDetailRow('Amount', '${payment['amount']} DH'),
            _buildDetailRow('Status', payment['status']),
            _buildDetailRow('Date', payment['date']),
            _buildDetailRow('Due Date', payment['dueDate']),
            if (payment['method'] != null)
              _buildDetailRow('Payment Method', payment['method']),
            if (payment['receiptPath'] != null) ...[
              const SizedBox(height: 16),
              const Text(
                'Receipt',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: FileImage(File(payment['receiptPath'])),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(195, 169, 145, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Close'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class _ResidentPaymentsScreenState extends State<ResidentPaymentsScreen> {
  late List<Map<String, dynamic>> _payments;

  @override
  void initState() {
    super.initState();
    _payments = [
      {
        'title': 'Monthly Maintenance Fee',
        'amount': '250.00',
        'date': '2024-01-15',
        'status': 'Paid',
        'dueDate': '2024-01-10',
      },
      {
        'title': 'Water Bill',
        'amount': '75.50',
        'date': 'Pending',
        'status': 'Pending',
        'dueDate': '2024-02-05',
      },
      {
        'title': 'Special Assessment',
        'amount': '150.00',
        'date': '2023-12-20',
        'status': 'Paid',
        'dueDate': '2023-12-15',
      },
    ];

    if (widget.newPayment != null) {
      _payments.insert(0, widget.newPayment!);
    }
  }

  int _selectedIndex = 1; // Payments tab selected

  // Sample data for payments
  final List<Map<String, dynamic>> _samplePayments = [
    {
      'title': 'Monthly Maintenance Fee',
      'amount': '250.00',
      'date': '2024-01-15',
      'status': 'Paid',
      'dueDate': '2024-01-10',
    },
    {
      'title': 'Water Bill',
      'amount': '75.50',
      'date': 'Pending',
      'status': 'Pending',
      'dueDate': '2024-02-05',
    },
    {
      'title': 'Special Assessment',
      'amount': '150.00',
      'date': '2023-12-20',
      'status': 'Paid',
      'dueDate': '2023-12-15',
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
          pageBuilder: (context, animation, secondaryAnimation) =>
              const ResidentHomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 300),
        ),
      );
    } else if (index == 2) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const ResidentRequestsScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 300),
        ),
      );
    } else if (index == 3) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const ResidentSettingsScreen(),
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
          'My Payments',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: _payments.length,
          itemBuilder: (context, index) {
            final payment = _payments[index];
            return _buildPaymentCard(payment);
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
          BottomNavigationBarItem(
              icon: Icon(Icons.attach_money), label: 'Payments'),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment), label: 'Requests'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }

  Widget _buildPaymentCard(Map<String, dynamic> payment) {
    return InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => PaymentDetailsDialog(payment: payment),
          );
        },
        child: Card(
          elevation: 4,
          shadowColor: Colors.black.withOpacity(0.1),
          color: Colors.white,
          margin: const EdgeInsets.only(bottom: 16.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      payment['title'],
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: payment['status'] == 'Paid'
                            ? Colors.green.withOpacity(0.1)
                            : Colors.orange.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        payment['status'],
                        style: TextStyle(
                          color: payment['status'] == 'Paid'
                              ? Colors.green
                              : Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Amount',
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                        Text('\$${payment['amount']}',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('Due Date',
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                        Text(payment['dueDate'],
                            style: const TextStyle(fontSize: 14)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
