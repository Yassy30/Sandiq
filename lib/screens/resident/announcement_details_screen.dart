import 'package:flutter/material.dart';
import 'package:sandiq/screens/resident/payments_screen.dart';

class AnnouncementDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> announcement;

  const AnnouncementDetailsScreen({required this.announcement, super.key});

  @override
  State<AnnouncementDetailsScreen> createState() => _AnnouncementDetailsScreenState();
}

class _AnnouncementDetailsScreenState extends State<AnnouncementDetailsScreen> {
  String? _selectedPaymentMethod;
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Announcement Details',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        _getIconForType(widget.announcement['type']),
                        color: const Color.fromRGBO(195, 169, 145, 1),
                        size: 28,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          widget.announcement['title'],
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.announcement['date'],
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.announcement['description'],
                    style: const TextStyle(fontSize: 16, height: 1.6),
                  ),
                  if (widget.announcement['type'] == 'Maintenance' || 
                      widget.announcement['type'] == 'Payment') ...[  
                    const SizedBox(height: 32),
                    const Text(
                      'Payment Method',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    _buildPaymentMethodSelection(),
                    if (_selectedPaymentMethod != null) ...[  
                      const SizedBox(height: 24),
                      _selectedPaymentMethod == 'Face to Face'
                          ? _buildFaceToFaceSection()
                          : _buildCardPaymentSection(),
                    ],
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodSelection() {
    return Column(
      children: [
        _buildMethodCard(
          'Face to Face',
          Icons.person,
          'Schedule a face-to-face payment',
        ),
        const SizedBox(height: 12),
        _buildMethodCard(
          'Card',
          Icons.credit_card,
          'Pay using bank transfer',
        ),
      ],
    );
  }

  Widget _buildMethodCard(String method, IconData icon, String description) {
    final isSelected = _selectedPaymentMethod == method;
    return InkWell(
      onTap: () => setState(() => _selectedPaymentMethod = method),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: isSelected 
                ? const Color.fromRGBO(195, 169, 145, 1)
                : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected 
                  ? const Color.fromRGBO(195, 169, 145, 1)
                  : Colors.grey[600],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    method,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isSelected 
                          ? const Color.fromRGBO(195, 169, 145, 1)
                          : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: Color.fromRGBO(195, 169, 145, 1),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildFaceToFaceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Payment Date',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: CalendarDatePicker(
            initialDate: _selectedDate ?? DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 30)),
            onDateChanged: (date) => setState(() => _selectedDate = date),
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: _selectedDate != null ? () => _submitPayment('Face to Face') : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(195, 169, 145, 1),
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text(
            'Confirm Payment Date',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildCardPaymentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Account Details',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Name: Sandiq Account'),
              SizedBox(height: 8),
              Text('Account Number: 1234567890'),
              SizedBox(height: 8),
              Text('RIB: 123456789012345678901234'),
            ],
          ),
        ),
        const SizedBox(height: 24),
        OutlinedButton(
          onPressed: () {
            // Add image picker functionality here
          },
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            side: const BorderSide(color: Color.fromRGBO(195, 169, 145, 1)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text(
            'Upload Payment Receipt',
            style: TextStyle(color: Color.fromRGBO(195, 169, 145, 1)),
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () => _submitPayment('Card'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(195, 169, 145, 1),
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text(
            'Submit Payment',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }

  void _submitPayment(String method) {
    final payment = {
      'title': widget.announcement['title'],
      'amount': '150.00', // Replace with actual amount
      'date': DateTime.now().toString(),
      'status': 'Pending',
      'dueDate': _selectedDate?.toString() ?? 
                DateTime.now().add(const Duration(days: 7)).toString(),
      'method': method,
    };

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ResidentPaymentsScreen(newPayment: payment),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 300),
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