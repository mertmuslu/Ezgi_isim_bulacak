import 'package:flutter/material.dart';

class AppsPage extends StatelessWidget {
  const AppsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      appBar: AppBar(
        title: const Text('Applications'),
        backgroundColor: Colors.amber.shade200,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButtonRow(['1', '2']),
            const SizedBox(height: 100),
            _buildButtonRow(['3', '4']),
            const SizedBox(height: 100),
            _buildButtonRow(['5', '6']),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonRow(List<String> labels) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: labels.map((label) {
        return GestureDetector(
          onTap: () {
            // buton tıklaması buraya
          },
          child: Container(
            width: 100,
            height: 100,
            color: Colors.amber.shade200,
            child: Center(
              child: Text(
                label,
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
