import 'package:flutter/material.dart';
import 'package:flutter_sign/screens/wrapper.dart';
import 'package:flutter_sign/services/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(home: Wrapper(),
            ));
  }
}
