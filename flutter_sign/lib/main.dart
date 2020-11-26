import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sign/screens/authenticate/category_selection.dart';
import 'package:flutter_sign/screens/authenticate/customer_type.dart';
import 'package:flutter_sign/screens/authenticate/register.dart';
import 'package:flutter_sign/screens/authenticate/registration_continued.dart';
import 'package:flutter_sign/screens/internet_Checker.dart';
import 'package:flutter_sign/screens/wrapper.dart';
import 'package:flutter_sign/services/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:connectivity/connectivity.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
 
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();

    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(home:SignUp_C()
       
            ));
  }
   Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        print("Connection - mobile",);
       
        break;
      case ConnectivityResult.none:
        print("Connection - none");
        break;
      default:
        print("Connection - Default");
        break;
    }
  }

}

