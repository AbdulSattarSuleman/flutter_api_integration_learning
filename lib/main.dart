import 'package:api_explore/screens/auth_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const APIExplore());
}

class APIExplore extends StatelessWidget {
  const APIExplore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthUser(),
    );
  }
}
