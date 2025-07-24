// import 'package:flutter/material.dart';

// class NewRequestScreen extends StatefulWidget {
//   const NewRequestScreen({super.key});

//   @override
//   State<NewRequestScreen> createState() => _NewRequestScreenState();
// }

// class _NewRequestScreenState extends State<NewRequestScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _titleController = TextEditingController();
//   final _descriptionController = TextEditingController();
//   DateTime? _selectedDate;

//   @override
//   void dispose() {
//     _titleController.dispose();
//     _descriptionController.dispose();
//     super.dispose();
//   }

//   void _submitRequest() {
//     if (_formKey.currentState!.validate()) {
//       final newRequest = {
//         'title': _titleController.text,
//         'date': _selectedDate?.toIso8601String().split('T')[0] ?? DateTime.now().toIso8601String().split('T')[0],
//         'status': 'Pending',
//         'description': _descriptionController.text,
//       };

//       Navigator.pop(context); // Return to the previous screen
//       // Here you would typically save to a database or state management; for now, we'll simulate adding to the list
//       // This requires access to the parent screen's state, which isn't directly possible here without a state management solution
//       // For demonstration, assume this is handled via a callback or state management (e.g., Provider, Riverpod)
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Request submitted successfully!')),
//       );
//     }
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate ?? DateTime.now(),
//       firstDate: DateTime(2024),
//       lastDate: DateTime(2026),
//     );
//     if (picked != null && picked != _selectedDate) {
//       setState(() {
//         _selectedDate = picked;
//       });
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
//           'New Request',
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: ListView(
//               children: [
//                 TextFormField(
//                   controller: _titleController,
//                   decoration: const InputDecoration(
//                     labelText: 'Request Title',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a title';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 TextFormField(
//                   controller: _descriptionController,
//                   decoration: const InputDecoration(
//                     labelText: 'Description',
//                     border: OutlineInputBorder(),
//                   ),
//                   maxLines: 3,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a description';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Text(
//                         _selectedDate == null
//                             ? 'No date selected'
//                             : 'Selected Date: ${_selectedDate!.toIso8601String().split('T')[0]}',
//                         style: TextStyle(color: Colors.grey[600], fontSize: 14),
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: () => _selectDate(context),
//                       child: const Text('Pick Date'),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 24),
//                 ElevatedButton(
//                   onPressed: _submitRequest,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color.fromRGBO(188, 163, 140, 1),
//                     minimumSize: const Size(double.infinity, 50),
//                   ),
//                   child: const Text(
//                     'Submit Request',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewRequestScreen extends StatefulWidget {
  const NewRequestScreen({super.key});

  @override
  State<NewRequestScreen> createState() => _NewRequestScreenState();
}

class _NewRequestScreenState extends State<NewRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  String? _imagePath; // To store the selected image path

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imagePath = image.path;
      });
    }
  }

  void _submitRequest() {
    if (_formKey.currentState!.validate()) {
      final newRequest = {
        'title': _titleController.text,
        'status': 'Pending',
        'description': _descriptionController.text,
        'imagePath': _imagePath, // Store image path (for demo; in production, upload to server)
      };

      Navigator.pop(context); // Return to the previous screen
      // Simulate adding to the list (requires state management for actual update)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Request submitted successfully!')),
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
          'New Request',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Request Title',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                            color: _imagePath == null ? Colors.grey[200] : null,
                          ),
                          child: _imagePath == null
                              ? const Center(child: Text('Tap to add an image'))
                              : Image.file(
                                  File(_imagePath!),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _submitRequest,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(188, 163, 140, 1),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    'Submit Request',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}