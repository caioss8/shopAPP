import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  Future<void> _athenticate(
      String email, String password, String urlFrag) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlFrag?key=AIzaSyBctQLeb65InrVPyBOZllOq3pILy7PYadc';
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );
    print(jsonDecode(response.body));
  }

  Future<void> signup(String email, String password) async {
    _athenticate(email, password, 'signUp');
  } 

  Future<void> login(String email, String password) async {
    _athenticate(email, password, 'signInWithPassword');
  }
}
