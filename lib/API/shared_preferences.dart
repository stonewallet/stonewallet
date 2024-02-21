
import 'package:shared_preferences/shared_preferences.dart';

import '../UI/Constants/strings.dart';

class MySharedPreferences{
  void setCsrfToken(SharedPreferences prefs, String csrf){
    prefs.setString(csrfToken, csrf);
  }

  String getCsrfToken(SharedPreferences prefs){
    return prefs.getString(csrfToken) ?? "";
    
  }

  void setSessionId(SharedPreferences prefs, String sessionToken){
    prefs.setString(sessionId, sessionToken);
  }

  String getSessionId(SharedPreferences prefs){
    return prefs.getString(sessionId) ?? "";
  }

}