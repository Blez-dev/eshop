
import 'package:flutter_riverpod/legacy.dart';



class CheckBoxController1 extends StateNotifier<bool> {
  CheckBoxController1() : super(false);

  void toggele() {
    state = !state;
  }
  void defaultval(){
    state =false;
}
}

class CheckBoxController2 extends StateNotifier<bool>{
  CheckBoxController2() : super(false);

  void toggle(){
    state= !state;
  }
  void defaultval(){
    state =false;
  }
}

class PasswordEye extends StateNotifier<bool>{
  PasswordEye(): super(false);

  void eyeToggle (){
    state =!state;
  }
}

final eyeState = StateNotifierProvider<PasswordEye,bool>((ref)=>PasswordEye());
final checkBox2 =StateNotifierProvider<CheckBoxController2,bool>((ref)=>CheckBoxController2());
final checkBox = StateNotifierProvider<CheckBoxController1, bool>(
  (ref) => CheckBoxController1(),
);
