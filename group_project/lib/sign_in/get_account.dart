// get_account.dart

import 'package:flutter/material.dart';
import 'package:group_project/sign_in/search_result.dart';
import 'package:group_project/sign_in/account.dart';

class GetAccount extends StatefulWidget {
  const GetAccount({Key? key}) : super(key: key);

  @override
  State<GetAccount> createState() => _GetAccountState();
}

class _GetAccountState extends State<GetAccount> {
  final TextEditingController _textFieldController = TextEditingController();

  // Create instances of the Account class
  final Account account1 = Account(id: 1, name: 'John Doe');
  final Account account2 = Account(id: 2, name: 'Jane Smith');

  bool _isLoading = false;

  void _checkAccount() async {
    if (_textFieldController.text.trim().isEmpty) {
      _showSnackBar('Please enter a partner\'s name.');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    Account? selectedAccount = await Future.delayed(const Duration(seconds: 2), () {
      if (_textFieldController.text.toLowerCase() == 'john doe') {
        return account1;
      } else if (_textFieldController.text.toLowerCase() == 'jane smith') {
        return account2;
      } else {
        return null;
      }
    });

    setState(() {
      _isLoading = false;
    });

    if (selectedAccount != null) {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchResult(
            account: selectedAccount,
          ),
        ),
      );

      Navigator.pop(context);

    } else {
      _showSnackBar('No matching account found for ${_textFieldController.text}.');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                onPressed: _isLoading ? null : _checkAccount,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.transparent,
                ),
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Check Score'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}