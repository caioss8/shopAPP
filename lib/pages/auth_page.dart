import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(111, 200, 16, 0.5),
              Color.fromRGBO(120, 188, 177, 0.9),
            ])),
          ),
          Container(
            width: double.infinity,
            child: Column(
              children: [],
            ),
          )
        ],
      ),
    );
  }
}
