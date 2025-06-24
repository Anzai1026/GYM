import 'package:flutter/material.dart';
import '../models/workout.dart';

class WorkoutDetailPage extends StatelessWidget {
  final BodyPart bodyPart;

  const WorkoutDetailPage({super.key, required this.bodyPart});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('${bodyPart.name} ${bodyPart.emoji}',
          style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: bodyPart.workouts.length,
        itemBuilder: (context, index) {
          final workout = bodyPart.workouts[index];
          return Card(
            color: Colors.grey,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(
                workout.name,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              subtitle: Text(
                workout.description,
                style: const TextStyle(color: Colors.white70),
              ),
              leading: const Icon(Icons.fitness_center, color: Colors.white),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WorkoutDetailPage(bodyPart: bodyPart),
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
