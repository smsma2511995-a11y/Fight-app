import 'package:flutter/material.dart';
import 'package:integrated_martial_arts_trainer/data/exercises_seed.dart';

class ExerciseLibraryScreen extends StatefulWidget {
  const ExerciseLibraryScreen({super.key});

  @override
  State<ExerciseLibraryScreen> createState() => _ExerciseLibraryScreenState();
}

class _ExerciseLibraryScreenState extends State<ExerciseLibraryScreen> {
  String _selectedCategory = 'الكل';
  String _searchQuery = '';
  final List<String> _categories = ['الكل', ...allExercises.map((e) => e.category).toSet().toList()];

  @override
  Widget build(BuildContext context) {
    final filteredExercises = allExercises.where((exercise) {
      final categoryMatch = _selectedCategory == 'الكل' || exercise.category == _selectedCategory;
      final searchMatch = _searchQuery.isEmpty || exercise.name.toLowerCase().contains(_searchQuery.toLowerCase());
      return categoryMatch && searchMatch;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('مكتبة التمارين'),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) => setState(() => _searchQuery = value),
              decoration: const InputDecoration(
                labelText: 'ابحث عن تمرين...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
            ),
          ),
          // Category Filter Chips
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              children: _categories.map((category) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ChoiceChip(
                    label: Text(category),
                    selected: _selectedCategory == category,
                    onSelected: (selected) {
                      setState(() {
                        if (selected) _selectedCategory = category;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          // Exercise List
          Expanded(
            child: ListView.builder(
              itemCount: filteredExercises.length,
              itemBuilder: (context, index) {
                final exercise = filteredExercises[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Image.asset(
                      exercise.imagePath,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported),
                    ),
                    title: Text(exercise.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(exercise.category),
                    onTap: () {
                      // Optional: Show a detail dialog or navigate to a detail screen
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
