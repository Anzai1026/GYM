import 'package:flutter/material.dart';
import 'package:gym/pages/workout_detail_page.dart';

import '../models/workout.dart';

class WorkoutListPage extends StatelessWidget {
  final List<BodyPart> bodyParts;

  const WorkoutListPage({super.key, required this.bodyParts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // 背景黒
      appBar: AppBar(
        title: const Text('部位を選択'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: bodyParts.length,
        itemBuilder: (context, index) {
          final part = bodyParts[index];
          return Card(
            color: Colors.grey[900], // ダークなカード
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(
                part.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white70),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => WorkoutDetailPage(bodyPart: part),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
