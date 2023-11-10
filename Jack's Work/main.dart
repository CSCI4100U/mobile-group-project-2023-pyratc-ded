import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Partner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _textFieldController,
                decoration: const InputDecoration(
                  labelText: 'Enter Rival\'s name',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                // Show a wait screen
                showWaitScreen(context);

                // Wait for 2 seconds
                await Future.delayed(Duration(seconds: 2));

                // Dismiss the wait screen
                Navigator.pop(context);

                // Navigate to the second page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(
                      enteredText: _textFieldController.text,
                    ),
                  ),
                );
              },
              child: Text('Done'),
            ),
          ],
        ),
      ),
    );
  }

  void showWaitScreen(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Please wait...'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Performing some operation.'),
                CircularProgressIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }
}


class SecondPage extends StatelessWidget {
  final String enteredText;

  SecondPage({required this.enteredText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Text from First Page:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              enteredText,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
