import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const TaiXiuApp());
}

class TaiXiuApp extends StatelessWidget {
  const TaiXiuApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tài Xỉu Stats',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TaiXiuScreen(),
    );
  }
}

class TaiXiuScreen extends StatefulWidget {
  const TaiXiuScreen({super.key});
  @override
  State<TaiXiuScreen> createState() => _TaiXiuScreenState();
}

class _TaiXiuScreenState extends State<TaiXiuScreen> {
  int taiCount = 0;
  int xiuCount = 0;

  void _generateRandomData() {
    final random = Random();
    setState(() {
      taiCount = random.nextInt(100);
      xiuCount = 100 - taiCount;
    });
  }

  @override
  void initState() {
    super.initState();
    _generateRandomData();
  }

  @override
  Widget build(BuildContext context) {
    double total = (taiCount + xiuCount).toDouble();
    double taiPercent = total > 0 ? (taiCount / total) * 100 : 0;
    double xiuPercent = total > 0 ? (xiuCount / total) * 100 : 0;

    return Scaffold(
      appBar: AppBar(title: const Text("Tỷ lệ Tài / Xỉu")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Tài: ${taiPercent.toStringAsFixed(1)}%",
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text("Xỉu: ${xiuPercent.toStringAsFixed(1)}%",
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _generateRandomData,
              child: const Text("Làm mới dữ liệu"),
            ),
          ],
        ),
      ),
    );
  }
}
