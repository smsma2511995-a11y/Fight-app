import 'package:flutter/material.dart';
import '../helpers/database_helper.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _exerciseCount = 0;

  @override
  void initState() {
    super.initState();
    _loadStats();
  }

  void _loadStats() async {
    final count = await DatabaseHelper().getExerciseCount();
    setState(() {
      _exerciseCount = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الملف الشخصي')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(radius: 50, backgroundColor: Colors.blueAccent, child: Icon(Icons.person, size: 50, color: Colors.white)),
            SizedBox(height: 20),
            Text('اسم المستخدم', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('email@example.com'),
            SizedBox(height: 30),
            Card(child: ListTile(leading: Icon(Icons.fitness_center), title: Text('عدد التمارين: $_exerciseCount'))),
            Card(child: ListTile(leading: Icon(Icons.timer), title: Text('الوقت المجموع: ${_exerciseCount * 15} دقيقة'))),
            SizedBox(height: 20),
            ElevatedButton.icon(onPressed: () {}, icon: Icon(Icons.logout), label: Text('تسجيل خروج')),
          ],
        ),
      ),
    );
  }
}
