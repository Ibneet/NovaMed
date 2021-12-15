import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:image_picker/image_picker.dart';

import './home/home_screen.dart';
import './lab_reports/lab_reports_screen.dart';
import './prescriptions/prescriptions_screen.dart';
import './predict_disease/predict_disease_screen.dart';
import './booking/HomePage.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  File _image;
  Future getImage() async {
    File image;
    image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(image.path);
    });
  }

  final List<Widget> _screens = [
    HomeScreen(),
    HomePage(),
    LabReportsScreen(),
    PrescriptionsScreen(),
    PredictDiseaseScreen()
  ];
  int _selectedScreenIndex = 0;

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedScreenIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).accentColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        onTap: _selectScreen,
        backgroundColor: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        fabLocation: BubbleBottomBarFabLocation.end, //new
        hasNotch: true,
        hasInk: true,
        inkColor: Colors.black12, //optional, uses
        // backgroundColor: Theme.of(context).primaryColor,
        // unselectedItemColor: Colors.white,
        // selectedItemColor: Theme.of(context).accentColor,
        // type: BottomNavigationBarType.fixed,
        currentIndex: _selectedScreenIndex,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Theme.of(context).primaryColor,
              ),
              title: Text("Home")),
          BubbleBottomBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(
                Icons.calendar_today,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.calendar_today,
                color: Theme.of(context).primaryColor,
              ),
              title: Text("Booking", overflow: TextOverflow.clip)),
          BubbleBottomBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(
                Icons.library_books,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.library_books,
                color: Theme.of(context).primaryColor,
              ),
              title: Text("Reports", overflow: TextOverflow.clip)),
          BubbleBottomBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(
                Icons.receipt,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.receipt,
                color: Theme.of(context).primaryColor,
              ),
              title: Text("Medicines", overflow: TextOverflow.clip)),
          BubbleBottomBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(
                Icons.coronavirus_outlined,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.coronavirus_outlined,
                color: Theme.of(context).primaryColor,
              ),
              title: Text("Predict"))
        ],
      ),
    );
  }
}
