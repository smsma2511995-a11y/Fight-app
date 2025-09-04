import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("📊 التقدم")),
      body: Center(
        child: Text("هنا هيظهر تقدمك (عدد أيام التدريب / نسبة الإنجاز)",
            style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
