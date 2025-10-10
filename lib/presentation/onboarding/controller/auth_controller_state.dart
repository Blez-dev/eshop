
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  // Constants for keys
  static const String isLoggedInKey = "isLoggedIn";
  static const String isFirstTimeKey = "isFirstTime";
  static const String isVendorKey = "isVendor";
  static const String isBuyerKey = "isBuyer";

  //set Login State
  static void setLoginState( String isLoggedIn,bool value) async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    await prefs.setBool( isLoggedIn,value);
  }

  //set status
  static void setState( String isFirstTime,bool value) async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    await prefs.setBool(isFirstTime, value);
  }

  //set role
  static void setVendorRole( String isVendor,bool value) async {
    SharedPreferences prefs= await SharedPreferences.getInstance();
    await prefs.setBool(isVendor, value);
  }

  //set role
  static void setBuyerRole( String isBuyer,bool value) async {
    SharedPreferences prefs= await SharedPreferences.getInstance();
    await prefs.setBool(isBuyer, value);
  }

  //Get Login State
  static Future<bool> getLoginState ()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool(isLoggedInKey) ?? false;
    return isLoggedIn;
  }

  //Get Status State
  static Future<bool> getState ()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    bool? isState = prefs.getBool(isFirstTimeKey) ?? true;
    return isState;
  }

  //Get Role
  static Future<bool> getVendorRole ()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    bool? isRole = prefs.getBool(isVendorKey) ?? false;
    return isRole;
  }
  //Get Role
  static Future<bool> getBuyerRole ()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    bool? isRole = prefs.getBool(isBuyerKey) ?? false;
    return isRole;
  }

}
