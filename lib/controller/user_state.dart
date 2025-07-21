import 'package:shared_preferences/shared_preferences.dart';

enum UserState { onBoarding, onReg, onHome }

//check for the state
//save the state
//get state

class States {
  static UserState _currentState = UserState.onBoarding;

  static UserState getState() {
    return _currentState;
  }

  static void updateState(UserState userState) {
    _currentState = userState;
    //store
    saveUserState();
  }

  static Future<void> saveUserState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('state', _currentState.index);
  }

  static Future<void> storeUserState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _currentState = UserState.values[prefs.getInt('state') ?? 0];
  }
}
