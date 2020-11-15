import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_sign/screens/Loading_screen.dart';
import 'package:flutter_sign/screens/wrapper.dart';

class InternetChecker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        if (connectivity == ConnectivityResult.none) {
          
          return Loading_Screen();
        } else {
          return child;
        }
      },
      builder: (BuildContext context) {
        return Wrapper();
      },
    );
  }
}
