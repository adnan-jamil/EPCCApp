import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:epcc/Authentication/DBService.dart';
import 'package:epcc/Screens/Reports.dart';
import 'package:epcc/Screens/home_screen.dart';
import 'package:epcc/Screens/noInternet.dart';
import 'package:epcc/Screens/profile.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  static int selectedIndex = 1;
  static Widget currentScreen = HomeScreen();
  static Widget currentProfileScreen = HomeScreen();
  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();
  static Function backToHomePage = (Widget widget, int index, bool val) {};
  static Function changeProfileWidget = (Widget widget) {};
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  Color darkGreen = Color(0xff034f43);
  Color specialWhite = Color(0xffececf6);
  Color lightGreen = Color(0xff9be1c4);
  Color specialRed = Color(0xFFFF506B);
  bool _isConnected = true;
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    BottomNavigation.currentProfileScreen = HomeScreen();
    BottomNavigation.currentScreen = HomeScreen();

    // Initialize connectivity check
    _initConnectivity();
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      _updateConnectionStatus(results);
    });

    BottomNavigation.backToHomePage = (Widget widget, int index, bool val) {
      setState(() {
        BottomNavigation.currentScreen = widget;
        if (val) BottomNavigation.selectedIndex = 1;
      });
    };
    BottomNavigation.changeProfileWidget = (Widget widget) {
      setState(() {
        BottomNavigation.currentScreen = widget;
      });
    };
  }

  Future<void> _initConnectivity() async {
    final List<ConnectivityResult> result =
        await Connectivity().checkConnectivity();
    _updateConnectionStatus(result);
  }

  void _updateConnectionStatus(List<ConnectivityResult> results) {
    setState(() {
      _isConnected = results.any((result) =>
              result != ConnectivityResult.none &&
              result !=
                  ConnectivityResult
                      .bluetooth // Optional: exclude bluetooth if needed
          );
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DBService().getUid();
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
      },
      child: _isConnected
          ? Scaffold(
              key: BottomNavigation.scaffoldKey,
              body: BottomNavigation.currentScreen,
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: BottomNavigation.selectedIndex,
                backgroundColor: Colors.white,
                selectedItemColor: Color(0xff1B80F5),
                unselectedItemColor: Colors.grey,
                selectedFontSize: 14,
                unselectedFontSize: 14,
                onTap: (index) {
                  setState(() {
                    if (index == 0)
                      BottomNavigation.currentScreen = Reports();
                    else if (index == 1)
                      BottomNavigation.currentScreen = HomeScreen();
                    else if (index == 2)
                      BottomNavigation.currentScreen = Profile();
                    BottomNavigation.selectedIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    label: 'Report',
                    icon: Icon(Icons.bar_chart),
                  ),
                  BottomNavigationBarItem(
                    label: 'Home',
                    icon: Icon(Icons.home),
                  ),
                  BottomNavigationBarItem(
                    label: 'Profile',
                    icon: Icon(Icons.person),
                  ),
                ],
              ),
            )
          : NoInternet(),
    );
  }
}
