import 'package:flutter/material.dart';
import 'package:food_app/models/user.dart';
import 'package:food_app/resources/auth_method.dart';

class UserProvider with ChangeNotifier {
  late User _user;
  final Authmethod _auth = Authmethod();

  User get getUser => _user;

  Future<void> updateUser() async {
    User user = await _auth.getUserdetails();
    _user = user;
    notifyListeners();
  }
}
