// import 'package:test_1/tutorial/week1_basic/data_types/general_input/domain/entities/user_profile.dart';
import '../../domain/entities/user_profile.dart';

abstract class ProfileRepository {
  UserProfile createProfile(
      String name,

      int birthYear,
      double points,
      bool isVIP,
      );
}