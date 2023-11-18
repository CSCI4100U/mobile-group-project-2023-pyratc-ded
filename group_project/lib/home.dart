import 'package:flutter/material.dart';
import 'package:group_project/account_tracker/account_tracker.dart';
import 'package:group_project/notepad/notepad.dart';
import 'package:group_project/infidelity_score/infidelity_score.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.title}) : super(key: key);

  String? title;

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _selectedItem = 0;
  final _pages = [InfidelityScore(), AccountTracker(), Notepad()];
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            _selectedItem = index;
          });
        },
        controller: _pageController,
        children: _pages,
      ),
      /*
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              //title: Text('Home')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.photo),
              //title: Text('Photos')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              //title: Text('Profile')
          )
        ],
        currentIndex: _selectedItem,
        onTap: (index) {
          setState(() {
            _selectedItem = index;
            _pageController.animateToPage(
                _selectedItem,
                duration: Duration(milliseconds: 200),
                curve: Curves.linear);
          });
        },
      ),
      */
    );
  }
}



