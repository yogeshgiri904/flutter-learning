import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iMaz/pages/home.dart';
import 'package:iMaz/routes/routes.dart';

class AuthProvider with ChangeNotifier {
  bool _loading = false;
  bool _isLoggedIn = false;
  String _nameUser = '';
  String get nameUser => _nameUser;

  bool get isLoggedIn => _isLoggedIn;
  bool get loading => _loading;
  setLoading(bool val, bool val2) {
    _loading = val;
    _isLoggedIn = val2;
    notifyListeners();
  }

  Future<bool> login(String userName, String password) async {
    try {
      setLoading(true, false);
      var url = Uri.parse('http://13.126.90.63/auth/login/');
      var response =
          await http.post(url, body: {"email": userName, "password": password});
      var userDetails = response.body;
      var loginStatus = response.statusCode;
      // print(userDetails);
      if (loginStatus == 200) {
        setLoading(false, true);
        _nameUser = userName;
        return true;
      } else {
        setLoading(false, true);
        return false;
      }
    } catch (e) {
      return false;

      print(e.toString());
    }
  }

  // Future<bool> userData(String token) async {
  //   try {
  //     setLoading(true, false);
  //     var url = Uri.parse('http://13.126.90.63/auth/login/');
  //     var response =
  //         await http.post(url, body: {"email": userName, "password": password});
  //     var userDetails = response.body;
  //     var loginStatus = response.statusCode;
  //     print(userDetails);
  //     if (loginStatus == 200) {
  //       setLoading(false, true);
  //       _nameUser = userName;
  //       return true;
  //     } else {
  //       setLoading(false, true);
  //       return false;
  //     }
  //   } catch (e) {
  //     return false;

  //     print(e.toString());
  //   }
  // }
}
