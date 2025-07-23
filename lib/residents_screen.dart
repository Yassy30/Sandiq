import 'package:flutter/material.dart';

class ResidentsScreen extends StatefulWidget {
  const ResidentsScreen({super.key});

  @override
  State<ResidentsScreen> createState() => _ResidentsScreenState();
}

class _ResidentsScreenState extends State<ResidentsScreen> {
  int _selectedIndex = 1; // Residents tab selected
  final TextEditingController _searchController = TextEditingController();
  
  // Sample data for residents
  final List<Map<String, dynamic>> _residents = [
    {
      'name': 'Fatima Zahra',
      'apartment': 'Apt. 101',
      'status': 'Paid',
      'building': 'Building A'
    },
    {
      'name': 'Ahmed El Amrani',
      'apartment': 'Apt. 102',
      'status': 'Unpaid',
      'building': 'Building A'
    },
    {
      'name': 'Sara Benali',
      'apartment': 'Apt. 103',
      'status': 'Paid',
      'building': 'Building A'
    },
    {
      'name': 'Youssef Alaoui',
      'apartment': 'Apt. 104',
      'status': 'Paid',
      'building': 'Building A'
    },
    {
      'name': 'Leila Haddad',
      'apartment': 'Apt. 105',
      'status': 'Unpaid',
      'building': 'Building A'
    },
    {
      'name': 'Leila Haddad',
      'apartment': 'Apt. 105',
      'status': 'Unpaid',
      'building': 'Building A'
    },
  ];

  List<Map<String, dynamic>> get filteredResidents {
    if (_searchController.text.isEmpty) {
      return _residents;
    }
    
    return _residents.where((resident) {
      return resident['name'].toLowerCase().contains(_searchController.text.toLowerCase()) ||
             resident['apartment'].toLowerCase().contains(_searchController.text.toLowerCase());
    }).toList();
  }
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    
    // Navigate to the appropriate screen based on the selected index
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else if (index == 3) {
      Navigator.pushReplacementNamed(context, '/requests');
    }
    else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/payments');
    }
    else if (index == 4) {
      Navigator.pushReplacementNamed(context, '/settings');
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Group residents by building
    Map<String, List<Map<String, dynamic>>> groupedResidents = {};
    
    for (var resident in filteredResidents) {
      String building = resident['building'];
      if (!groupedResidents.containsKey(building)) {
        groupedResidents[building] = [];
      }
      groupedResidents[building]!.add(resident);
    }
    
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Residents',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.all(16.0),
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
            
            // Residents list
            Expanded(
              child: ListView.builder(
                itemCount: groupedResidents.length,
                itemBuilder: (context, index) {
                  String building = groupedResidents.keys.elementAt(index);
                  List<Map<String, dynamic>> buildingResidents = groupedResidents[building]!;
                  
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Building header
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 8.0),
                        child: Text(
                          building,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      
                      // Residents in this building
                      ...buildingResidents.map((resident) => _buildResidentItem(resident)).toList(),
                    ],
                  );
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

  Widget _buildResidentItem(Map<String, dynamic> resident) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Resident',
                style: TextStyle(fontSize: 12, color: Colors.blue),
              ),
              Text(
                resident['name'],
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          subtitle: Row(
            children: [
              Text(resident['apartment']),
              // const Text(' · '),
              // Text(
              //   resident['status'],
              //   style: TextStyle(
              //     color: resident['status'] == 'Paid' ? Colors.green : Colors.red,
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
            ],
          ),
          onTap: () {
            // Handle resident tap
          },
        ),
        const Divider(height: 1, indent: 16, endIndent: 16),
      ],
    );
  }
}