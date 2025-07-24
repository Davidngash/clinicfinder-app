import 'package:flutter/material.dart';

class Category {
  final String name;
  final IconData icon;
  final int clinicCount;

  Category({
    required this.name,
    required this.icon,
    this.clinicCount = 0,
  });
}

class ClinicCategoriesPage extends StatefulWidget {
  const ClinicCategoriesPage({super.key});

  @override
  State<ClinicCategoriesPage> createState() => _ClinicCategoriesPageState();
}

class _ClinicCategoriesPageState extends State<ClinicCategoriesPage> {
  // Sample data for clinic categories
  final List<Category> _allCategories = [
    Category(name: 'General Practice', icon: Icons.local_hospital, clinicCount: 25),
    Category(name: 'Pediatrics', icon: Icons.child_care, clinicCount: 18),
    Category(name: 'Dentistry', icon: Icons.telegram, clinicCount: 30),
    Category(name: 'Dermatology', icon: Icons.healing, clinicCount: 12),
    Category(name: 'Cardiology', icon: Icons.favorite, clinicCount: 8),
    Category(name: 'Ophthalmology', icon: Icons.remove_red_eye, clinicCount: 15),
    Category(name: 'Orthopedics', icon: Icons.accessibility_new, clinicCount: 10),
    Category(name: 'Neurology', icon: Icons.psychology, clinicCount: 7),
    Category(name: 'Physiotherapy', icon: Icons.fitness_center, clinicCount: 20),
    Category(name: 'Psychiatry', icon: Icons.self_improvement, clinicCount: 5),
  ];

  List<Category> _filteredCategories = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredCategories = _allCategories; // Initialize with all categories
    _searchController.addListener(_filterCategories);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterCategories);
    _searchController.dispose();
    super.dispose();
  }

  // Function to filter categories based on search input
  void _filterCategories() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredCategories = _allCategories.where((category) {
        return category.name.toLowerCase().contains(query);
      }).toList();
    });
  }

  // Function to handle category card tap
  void _onCategoryTap(Category category) {
    // In a real app, this would navigate to a clinics list page
    print('Tapped on ${category.name} category. (Simulated navigation)');
    // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => ClinicsListPage(category: category)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clinic Categories'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
            Navigator.pop(context); // Example: Pop current route
          },
        ),
        // Optional: Add a search/filter icon to the app bar
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.search),
        //     onPressed: () {
        //       // Handle search icon press
        //     },
        //   ),
        // ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search categories...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          // Category Display
          Expanded(
            child: _filteredCategories.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.category, size: 60, color: Colors.grey[400]),
                        const SizedBox(height: 16),
                        Text(
                          'No categories found.',
                          style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(16.0),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 2 columns on most screens
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio: 1.2, // Adjust card aspect ratio
                    ),
                    itemCount: _filteredCategories.length,
                    itemBuilder: (context, index) {
                      final category = _filteredCategories[index];
                      return _CategoryCard(
                        category: category,
                        onTap: () => _onCategoryTap(category),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// Widget for a single category card
class _CategoryCard extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                category.icon,
                size: 48,
                color: Theme.of(context).primaryColor, // Use primary color for icons
              ),
              const SizedBox(height: 12),
              Text(
                category.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (category.clinicCount > 0) ...[
                const SizedBox(height: 8),
                Text(
                  '${category.clinicCount} Clinics',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
