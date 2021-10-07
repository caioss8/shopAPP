import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    final sizePhone = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 8,
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 320,
        width: sizePhone.width * 0.75,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Senha'),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }
}
