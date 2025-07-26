import 'package:shared_preferences/shared_preferences.dart';

enum UserState { onBoarding, onReg, onHome }

//check for the state
//save the state
//get state

class States {
  static UserState _currentState = UserState.onBoarding;

  static UserState getState() => _currentState;

  static Future<void> updateState(UserState userState) async {
    _currentState = userState;
    await _saveUserState();
  }

  static Future<void> _saveUserState() async =>
      await SharedPreferences.getInstance().then(
        (value) async => await value.setInt('state', _currentState.index),
      );

  static Future<void> storeUserState() async =>
      await SharedPreferences.getInstance().then(
        (value) => _currentState = UserState.values[value.getInt('state') ?? 0],
      );
}
