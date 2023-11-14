import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: InfidelityScorePage(),
    );
  }
}

class InfidelityScorePage extends StatefulWidget {
  const InfidelityScorePage({Key? key}) : super(key: key);

  @override
  _InfidelityScorePageState createState() => _InfidelityScorePageState();
}

class _InfidelityScorePageState extends State<InfidelityScorePage> {
  bool isLoading = false;
  bool isButtonPressed = false;
  int infidelityScore = 42; // hardcoded score

  void calculateInfidelityScore() { // calculation delay
    setState(() {
      isLoading = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
        isButtonPressed = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infidelity Score Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(2),
                },
                children: [
                  TableRow(
                    children: [
                      const TableCell(
                        child: Text('Partner:'),
                      ),
                      TableCell(
                        child: ElevatedButton(
                          onPressed: () {
                            print('Get New Partner'); // shows proof of press in console
                          },
                          child: const Text('Get New Partner'),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      const TableCell(
                        child: Text('Rival:'),
                      ),
                      TableCell(
                        child: ElevatedButton(
                          onPressed: () {
                            print('Get New Rival'); // shows proof of press in console
                          },
                          child: const Text('Get New Rival'), // button text
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    print('Calculation Button Pressed'); // go button press
                    calculateInfidelityScore();
                  },
                  child: Container(
                    width: 150,
                    height: 150,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: isLoading
                        ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                        : const Text(
                      'Calculate',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (isButtonPressed)
                Center(
                  child: Column(
                    children: [
                      const Text('Infidelity Score:'),
                      const SizedBox(height: 10),
                      isLoading
                          ? const CircularProgressIndicator()
                          : Text(
                        '$infidelityScore', // Display infidelity score
                        style: const TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
