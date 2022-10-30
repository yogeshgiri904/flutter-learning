import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iMaz/models/login.dart';
import 'package:iMaz/models/users.dart';
import 'package:iMaz/pages/constants.dart';
import 'package:iMaz/provider/authProvider.dart';
import 'package:provider/provider.dart';

class UserListProvider with ChangeNotifier {
  double _userCount = 0;
  double get userCount => _userCount;
  setUserCount(double val) {
    _userCount = val;
    notifyListeners();
  }
}
