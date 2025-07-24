import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  void _onSearchTapped() {
    print('Search icon tapped!');
  }
  void _onProfileTapped() {
    print('Profile icon tapped!');
  }
  void _onViewFullMapTapped() {
    print('View Full Map button tapped!');
    
  }
  void _onAmbulanceTapped() {
    print('Ambulance service tapped!');
  }
  void _onFindDoctorTapped() {
    print('Find a Doctor tapped!');
  }
  void _onLocateByLocationTapped() {
    print('Locate by Location tapped!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD), 
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.local_hospital, color: Colors.white), 
            SizedBox(width: 8),
            Text('Clinic Finder'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: _onSearchTapped,
            tooltip: 'Search',
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: _onProfileTapped,
            tooltip: 'Profile',
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Find Clinics Near You',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
            const SizedBox(height: 16.0),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200], 
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.map, size: 60, color: Colors.grey[400]),
                          const SizedBox(height: 8),
                          Text(
                            'Interactive Map View',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: _onViewFullMapTapped,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text('View Full Map'),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      'Nearby Clinics',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    // Example nearby clinic item
                    _buildNearbyClinicItem(
                      'City General Hospital',
                      '2.5 km away',
                      '4.5 (120 reviews)',
                    ),
                    _buildNearbyClinicItem(
                      'Family Care Clinic',
                      '1.8 km away',
                      '4.8 (85 reviews)',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24.0),

            // Services Section Title
            Text(
              'Our Services',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
            const SizedBox(height: 16.0),
            _buildServiceCard( 
              title: 'Clinics offering health services',
              context,
              icon: Icons.local_shipping, // Ambulance icon
              iconColor: Colors.red[700]!,
              subtitle: 'Emergency assistance near you',
              onTap: _onAmbulanceTapped,
            ),
            // Ambulance Services Around You
            _buildServiceCard(
              context,
              icon: Icons.local_shipping, // Ambulance icon
              iconColor: Colors.red[700]!, // Red for emergency
              title: 'Ambulance Services',
              subtitle: 'Emergency assistance near you',
              onTap: _onAmbulanceTapped,
            ),
            const SizedBox(height: 16.0),

            // Private Doctors Around You
            _buildServiceCard(
              context,
              icon: Icons.person_pin, // Doctor icon
              iconColor: Colors.green[700]!, // Green for health/doctors
              title: 'Private Doctors',
              subtitle: 'Find specialists and general practitioners',
              onTap: _onFindDoctorTapped,
            ),
            const SizedBox(height: 16.0),
            _buildServiceCard(
              context,
              icon: Icons.location_on, // Location icon
              iconColor: Colors.orange[700]!, // Orange for location
              title: 'Clinics by Location',
              subtitle: 'Search clinics in a specific area',
              onTap: _onLocateByLocationTapped,
            ),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
        currentIndex: 0, // Highlight Home/Dashboard
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey[600],
        type: BottomNavigationBarType.fixed, // Ensures all labels are visible
        onTap: (index) {
          print('Bottom navigation tapped: $index');
        },
      ),
    );
  }


  Widget _buildServiceCard(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      child: InkWell( // Use InkWell for ripple effect on tap
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: iconColor.withOpacity(0.1),
                child: Icon(icon, size: 30, color: iconColor),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build a nearby clinic list item
  Widget _buildNearbyClinicItem(String name, String distance, String rating) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(Icons.local_hospital, size: 20, color: Colors.blue[400]),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800],
                  ),
                ),
                Text(
                  '$distance • $rating',
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}
