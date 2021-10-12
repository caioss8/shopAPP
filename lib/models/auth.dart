import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shop/exceptions/auth_exception.dart';

class Auth with ChangeNotifier {
  String? _token;
  String? _email;
  String? _userId;
  DateTime? _expiryDate;

  bool get isAuth {
    final isValid = _expiryDate?.isAfter(DateTime.now()) ?? false;
    return _token != null && isValid;
  }

  String? get token {
    return isAuth ? _token : null;
  }
  String? get email {
    return isAuth ? _email : null;
  }
  String? get userID {
    return isAuth ? _userId : null;
  }

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

    final  body = jsonDecode(response.body);

    if(body['error'] != null){
      throw AuthException(body['error']['message']);
    }else{
      _token = body['idToken'];
      _email = body['email'];
      _userId = body['localId'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(body['expiresIn']),
        ),
      );
      notifyListeners();
    }
  }

  Future<void> signup(String email, String password) async {
    return _athenticate(email, password, 'signUp');
  } 

  Future<void> login(String email, String password) async {
    return _athenticate(email, password, 'signInWithPassword');
  }
}
