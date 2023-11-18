import 'package:flutter/material.dart';
import 'package:group_project/home.dart';
import 'package:group_project/sign_in/get_account.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CheckIfLoggedIn(),
    );
  }
}

//HomePage(title: "Home Page"),
class CheckIfLoggedIn extends StatefulWidget {
  @override
  _CheckIfLoggedInState createState() => _CheckIfLoggedInState();
}


class _CheckIfLoggedInState extends State<CheckIfLoggedIn> {

  bool isLoggedIn = false;

  void toggleLogin() {
    setState(() {
      isLoggedIn = !isLoggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              isLoggedIn ? 'Sign in' : 'Get Account',
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                await Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) {
                        if (isLoggedIn) {
                          return LoggedIn();
                        }
                        else {
                          return GetAccount();
                        }
                      }
                  ),
                );
                toggleLogin();
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0), // Adjust padding
                ),
              ),
              child: const Text(
                'Go!',
                style: TextStyle(fontSize: 20.0),
              ),
            )
          ]
        )
      )
    );
  }
}

class LoggedIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage(title: "Home Page");
  }
}

/*
class NotLoggedIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurple, // Adjust the primary color
        scaffoldBackgroundColor: Colors.transparent,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.transparent,
      ),
      home: GetAccount(),
    );
  }
}

 */