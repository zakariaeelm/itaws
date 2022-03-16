import 'package:flutter/cupertino.dart';

// Manage loading state with the provider lib
class LoadingProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  setLoad(bool status) {
    _loading = status;
    notifyListeners();
  }
}