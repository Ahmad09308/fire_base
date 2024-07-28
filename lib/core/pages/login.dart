import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              'dfdf',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ),
          Container(
            height: 20,
            width: 520,
            child: TextField(
              decoration: InputDecoration(
                  labelText: 'dfdf',
                  border: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(45)))),
            ),
          )
        ],
      ),
    );
  }
}
