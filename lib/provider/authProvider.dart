import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iMaz/models/login.dart';
import 'package:iMaz/models/users.dart';
import 'package:iMaz/pages/constants.dart';

class AuthProvider with ChangeNotifier {
  bool _loading = false;
  bool _isLoggedIn = false;
  String? _authToken = '';
  User? userSession;
  String _navHeader = '';
  String? sessionError;
  int userCount = 0;
  List<User>? UsersList;

  String get navHeader => _navHeader;

  String? get authToken => _authToken;
  bool get isLoggedIn => _isLoggedIn;
  bool get loading => _loading;

  setLoading(bool val, bool val2, String? val3) {
    _loading = val;
    _isLoggedIn = val2;
    _authToken = val3;
    notifyListeners();
  }

  setNav(String val) {
    _navHeader = val;
    notifyListeners();
  }

  Future<bool> login(String userName, String password) async {
    try {
      final Map<String, dynamic> data;
      setLoading(true, false, '');
      var url = Uri.parse('$baseUrl/auth/login/');
      var res =
          await http.post(url, body: {"email": userName, "password": password});

      if (res.statusCode == 200) {
        data = json.decode(res.body);
        setLoading(false, true, Login.fromJson(data).token);
        return true;
      } else {
        setLoading(false, true, '');
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  // Future<void> userData() async {

  // };

  Future<void> userData() async {
    try {
      Map<String, dynamic> data;
      var url = Uri.parse('$baseUrl/users/me');
      var res = await http.get(url, headers: {
        'Authorization': 'Bearer $authToken',
      });
      if (res.statusCode == 200) {
        data = jsonDecode(res.body);
        // print(data);

        var resBody = User.fromJson(data);
        userSession = resBody;

        // print(resBody.firstName);
      } else {
        sessionError = 'User Data Not Found';
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getUsersData() async {
    try {
      var url = Uri.parse('$baseUrl/users/');
      var res = await http.get(url, headers: {
        'Authorization': 'Bearer $authToken',
      });
      // print(res.body);
      if (res.statusCode == 200) {
        List data = jsonDecode(res.body);
        userCount = data.length;
        List<User> userFromJson(List data) =>
            List<User>.from(data.map((x) => User.fromJson(x)));

        UsersList = userFromJson(data);

        // var resBody = User.fromJson(data);
        // userSession = resBody;

        // print(UsersList?[0].firstName);
      } else {
        sessionError = 'User Data Not Found';
        print(sessionError);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
