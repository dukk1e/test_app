import 'package:flutter/material.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/profile_repo.dart';

class InputController extends ChangeNotifier{
  final ProfileRepository _repo;

  InputController( this._repo);

  UserProfile? data;
  String errorMessage = '';

  void submitData(String nameStr, String yearStr, String pointsStr, bool isVip) {
    errorMessage = "";
    data = null;

    if (nameStr.isEmpty) {
      errorMessage = "Name cannot be empty";
      notifyListeners();
      return;
    }

    int? year = int.tryParse(yearStr);
    if (year == null || year < 1926 || year > DateTime
        .now()
        .year) {
      errorMessage = "Invalid birth year";
      notifyListeners();
      return;
    }

    double? points = double.tryParse(pointsStr);
    if (points == null || points < 0 || points > 10) {
      errorMessage = "Points must be between 0 and 10";
      notifyListeners();
      return;
    }

    data = _repo.createProfile(nameStr, year, points, isVip);

    notifyListeners();
  }
}