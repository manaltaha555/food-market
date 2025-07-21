
import 'package:shared_preferences/shared_preferences.dart';

enum UserState { onBoarding, onReg, onHome }

//check for the state
//save the state
//get state

class States {
    static UserState currentState = UserState.onBoarding;
    late final SharedPreferences prefs;


void checkState(){
  switch(currentState) {
    case UserState.onBoarding:
    //save 0
    saveState(0);
    case UserState.onReg:
    //save1
      saveState(1);
    case UserState.onHome:
      //save2
      saveState(2);
  }
}

void saveState(int i)async{
    await prefs.setInt('state', i);
    currentState = UserState.values[i];
}

Future<int?> getState() async{
  return prefs.getInt('state');
}
}
