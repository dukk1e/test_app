import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepository {

  @override
  UserProfile createProfile(
      String nameInput,
      int yearInput,
      double pointsInput,
      bool vipInput,
      ) {

    String finalName = nameInput.trim().toUpperCase();
    int currentAge = DateTime.now().year - yearInput;
    bool finalVIPStatus = vipInput;
    if (pointsInput > 9.0) {
      finalVIPStatus = true;
    }


    return UserProfile(
      name: finalName,
      age: currentAge,
      birthYear: yearInput,
      points: pointsInput,
      isVIP: finalVIPStatus,
    );
  }
}