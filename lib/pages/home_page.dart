import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import '../models/workout.dart';
import 'workout_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _seconds = 0;
  Timer? _timer;
  List<String> _laps = [];

  void startTimer() {
    if (_timer != null && _timer!.isActive) return;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() => _seconds++);
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }

  void resetTimer() {
    stopTimer();
    setState(() {
      _seconds = 0;
      _laps.clear();
    });
  }

  void addLap() {
    if (_timer?.isActive ?? false) {
      setState(() {
        _laps.insert(0, formattedTime);
      });
    }
  }

  String get formattedTime {
    final minutes = (_seconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('筋トレホーム', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            const Text(
              '今日も頑張ろう！',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => WorkoutListPage(bodyParts: bodyParts)),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text('トレーニングする'),
            ),
            const SizedBox(height: 32),

            /// タイマー
            Text(
              formattedTime,
              style: const TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.bold,
                fontFeatures: [FontFeature.tabularFigures()],
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 24),

            /// ボタン2x2配置
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 2.5,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ElevatedButton(onPressed: startTimer, child: const Text('スタート')),
                ElevatedButton(onPressed: stopTimer, child: const Text('ストップ')),
                ElevatedButton(onPressed: resetTimer, child: const Text('リセット')),
                ElevatedButton(onPressed: addLap, child: const Text('ラップ')),
              ].map((btn) {
                return ElevatedButton(
                  onPressed: btn.onPressed,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  child: btn.child!,
                );
              }).toList(),
            ),

            const SizedBox(height: 24),

            /// ラップ記録
            if (_laps.isNotEmpty)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ラップ記録',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _laps.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Text('Lap ${_laps.length - index}'),
                            trailing: Text(_laps[index]),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
