// home_page.dart

import 'package:flutter/material.dart';
import 'search_result.dart';
import 'account.dart';

class MyHomePage extends StatelessWidget {
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    // Create instances of the Account class
    Account account1 = Account(id: 1, name: 'John Doe');
    Account account2 = Account(id: 2, name: 'Jane Smith');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Partner Score Checker'),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurple, Colors.indigo],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _textFieldController,
                  decoration: const InputDecoration(
                    labelText: 'Enter Partner\'s Name',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  // Check if the user has entered a partner's name
                  if (_textFieldController.text.trim().isEmpty) {
                    // Show an error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter a partner\'s name.'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    return; // Exit the function if the input is empty
                  }

                  // Show a wait screen
                  showWaitScreen(context);

                  // Simulate fetching account details with a delay
                  Account? selectedAccount = await Future.delayed(const Duration(seconds: 2), () {
                    if (_textFieldController.text.toLowerCase() == 'john doe') {
                      return account1;
                    } else if (_textFieldController.text.toLowerCase() == 'jane smith') {
                      return account2;
                    } else {
                      // Handle the case when the entered name doesn't match any predefined account
                      // You might want to show an error message or handle it according to your logic
                      return null; // Returning null to indicate no matching account found
                    }
                  });

                  // Dismiss the wait screen
                  Navigator.pop(context);

                  // Check if an account was found
                  if (selectedAccount != null) {
                    // Navigate to the search result page with the selected account details
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchResult(
                          account: selectedAccount,
                        ),
                      ),
                    );
                  } else {
                    // Show an error message indicating that no matching account was found
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('No matching account found for ${_textFieldController.text}.'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                child: const Text('Check Score'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  onPrimary: Colors.white,
                ),
              ),
            ],
          ),
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
          title: const Text('Checking Partner\'s Score...'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Please wait while we calculate the score for ${_textFieldController.text}.'),
                const CircularProgressIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }
}
