
import 'package:flutter_riverpod/legacy.dart';



class SignUpCheckBoxController1 extends StateNotifier<bool> {
  SignUpCheckBoxController1() : super(false);

  void toggele() {
    state = !state;
  }
  void defaultval(){
    state =false;
  }
}

class SignUpCheckBoxController2 extends StateNotifier<bool>{
  SignUpCheckBoxController2() : super(false);

  void toggle(){
    state= !state;
  }
  void defaultval(){
    state =false;
  }
}

class SignUpPasswordEye1 extends StateNotifier<bool>{
  SignUpPasswordEye1(): super(false);

  void eyeToggle (){
    state =!state;
  }
}

class SignUpPasswordEye2 extends StateNotifier<bool>{
  SignUpPasswordEye2(): super(false);

  void eyeToggle (){
    state =!state;
  }
}

final signUpEyeState2 = StateNotifierProvider<SignUpPasswordEye2,bool>((ref)=>SignUpPasswordEye2());
final signUpEyeState = StateNotifierProvider<SignUpPasswordEye1,bool>((ref)=>SignUpPasswordEye1());
final signUpCheckBox2 =StateNotifierProvider<SignUpCheckBoxController2,bool>((ref)=>SignUpCheckBoxController2());
final signUpCheckBox = StateNotifierProvider<SignUpCheckBoxController1, bool>(
      (ref) => SignUpCheckBoxController1(),
);
