import 'package:shared_preferences/shared_preferences.dart';

class Preferences{
 static  SharedPreferences? preferences;

 static Future<void> init() async{
   preferences = await SharedPreferences.getInstance();
 }
}