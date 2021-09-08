import 'package:flutter/cupertino.dart';

// ignore: camel_case_types
class JoinOrLogin extends ChangeNotifier {
  bool _isJoin = false;
  bool get isJoin => _isJoin;

  void toggle() {
    _isJoin = !_isJoin;
    notifyListeners();
  }
}
