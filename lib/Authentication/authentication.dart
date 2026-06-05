import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:epcc/Screens/bottom_navigation.dart';
import 'package:epcc/Screens/login_screen.dart';
import 'package:epcc/Screens/noInternet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authenticate extends StatefulWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future sigout() async {
    try {
      await auth.signOut();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool _connectionStatus = false;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  late bool loginValue;
  late SharedPreferences _pref;

  @override
  void initState() {
    getLoginValue();
    super.initState();
    initConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      // Take the first result or handle multiple results as needed
      _updateConnectionStatus(
          results.isNotEmpty ? results.first : ConnectivityResult.none);
    });
  }

  getLoginValue() async {
    _pref = await SharedPreferences.getInstance();
    loginValue = _pref.getBool('login') ?? false;
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    List<ConnectivityResult> results = [ConnectivityResult.none];
    try {
      results = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }

    if (!mounted) {
      return;
    }

    return _updateConnectionStatus(
        results.isNotEmpty ? results.first : ConnectivityResult.none);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
      case ConnectivityResult.ethernet:
      case ConnectivityResult.vpn:
      case ConnectivityResult.bluetooth:
        setState(() => _connectionStatus = true);
        break;
      case ConnectivityResult.none:
        setState(() {
          _connectionStatus = false;
        });
        break;
      default:
        setState(() => _connectionStatus = false);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return _connectionStatus
        ? loginValue
            ? BottomNavigation()
            : LoginScreen()
        : NoInternet();
  }
}
