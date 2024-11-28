import 'package:shared_preferences/shared_preferences.dart';

import '../utils/enum_auth_type.dart';

class SharedPreferencesManager {
  final _accessToken = "access_token";
  final _accessTokenGoogle = "access_token_google";
  final _xGoogleAuthUser = "X-Goog-AuthUser";
  final _refreshToken = "refresh_token";
  final _userEmail = "user_email";
  final _password = "password";
  final _userId = "user_id";
  final _userIdentity = "user_identity";
  final _saveCredentials = "save_credentials";
  final _currentBuildNumber = 'currentBuildNumber';
  final _tokenType = "tokenType";
  final _tokenTime = "tokenTime";
  final _hasNotifications = "hasNotifications";
  final _isEmployee = "isEmployee";
  final _isRRHH = "isRRHH";
  final _authenticationType = "AUTHENTICATION-TYPE";
  final _walkthrough = "walkthrough";
  final _signFirstTime = "firstTime";
  final _contentDownloaded = "contentDownloaded";
  final _hr = "humanResourcesModal";
  final _rememberMe = "rememberme";

  Future<bool> cleanAll() async {
//    setUserEmail('');
    setAccessToken('');
    setRefreshToken('');
    setUserId(-1);
    setUserIdentity('');
    setPassword('');
    setSaveCredentials(false);
    return true;
  }

  Future<bool> getSaveCredentials() async {
    var value =
        (await SharedPreferences.getInstance()).getBool(_saveCredentials);
    if (value == null) {
      value = false;
      setSaveCredentials(value);
    }
    return value;
  }

  Future<bool> setSaveCredentials(bool newValue) async {
    var res = (await SharedPreferences.getInstance())
        .setBool(_saveCredentials, newValue);
    return res;
  }

  Future<String> getUserEmail() async {
    var value = (await SharedPreferences.getInstance()).getString(_userEmail);
    if (value == null) {
      value = '';
      setUserEmail(value);
    }
    return value;
  }

  Future<bool> setUserEmail(String newValue) async {
    var res =
        (await SharedPreferences.getInstance()).setString(_userEmail, newValue);
    return res;
  }

  Future<String> getPassword() async {
    var value = (await SharedPreferences.getInstance()).getString(_password);
    if (value == null) {
      value = '';
      setPassword(value);
    }
    return value;
  }

  Future<bool> setPassword(String newValue) async {
    var res =
        (await SharedPreferences.getInstance()).setString(_password, newValue);
    return res;
  }

  Future<String> getAccessToken() async {
    var value = (await SharedPreferences.getInstance()).getString(_accessToken);
    if (value == null) {
      value = '';
      setAccessToken(value);
    }
    return value;
  }

  Future<bool> setAccessToken(String newValue) async {
    var res = (await SharedPreferences.getInstance())
        .setString(_accessToken, newValue);
    return res;
  }

  Future<bool> setAccessTokenGoogle(String newValue) async {
    var res = (await SharedPreferences.getInstance())
        .setString(_accessTokenGoogle, newValue);
    return res;
  }

  Future<bool> setAccessTokenXGoogleAuth(String newValue) async {
    var res = (await SharedPreferences.getInstance())
        .setString(_xGoogleAuthUser, newValue);
    return res;
  }

  Future<String> getAccessTokenXGoogleAuth() async {
    var value =
        (await SharedPreferences.getInstance()).getString(_xGoogleAuthUser);
    if (value == null) {
      value = '';
    }
    return value;
  }

  Future<String> getAccessTokenGoogle() async {
    var value =
        (await SharedPreferences.getInstance()).getString(_accessTokenGoogle);
    if (value == null) {
      value = '';
      setAccessToken(value);
    }
    return value;
  }

  Future<bool> setTokenType(String newValue) async {
    var res =
        (await SharedPreferences.getInstance()).setString(_tokenType, newValue);
    return res;
  }

  Future<String> getTokenType() async {
    var value = (await SharedPreferences.getInstance()).getString(_tokenType);
    if (value == null) {
      value = '';
    }
    return value;
  }

  Future<bool> setTokenTime(int newValue) async {
    var res =
        (await SharedPreferences.getInstance()).setInt(_tokenTime, newValue);
    return res;
  }

  Future<int> getTokenTime() async {
    var value = (await SharedPreferences.getInstance()).getInt(_tokenTime);
    if (value == null) {
      value = 0;
    }
    return value;
  }

  Future<int> getUserId() async {
    var value = (await SharedPreferences.getInstance()).getInt(_userId);
    if (value == null) {
      value = -1;
      setUserId(value);
    }
    return value;
  }

  Future<bool> setUserId(int newValue) async {
    var res = (await SharedPreferences.getInstance()).setInt(_userId, newValue);
    return res;
  }

  Future<String> getUserIdentity() async {
    var value =
        (await SharedPreferences.getInstance()).getString(_userIdentity);
    if (value == null) {
      value = '';
      setUserIdentity(value);
    }
    return value;
  }

  Future<bool> setUserIdentity(String newValue) async {
    var res = (await SharedPreferences.getInstance())
        .setString(_userIdentity, newValue);
    return res;
  }

  Future<String> getRefreshToken() async {
    var value =
        (await SharedPreferences.getInstance()).getString(_refreshToken);
    if (value == null) {
      value = '';
      setAccessToken(value);
    }
    return value;
  }

  Future<bool> setRefreshToken(String newValue) async {
    var res = (await SharedPreferences.getInstance())
        .setString(_refreshToken, newValue);
    return res;
  }

  Future<bool> hasNotifications() async {
    return (await SharedPreferences.getInstance()).getBool(_hasNotifications) ??
        false;
  }

  Future<bool> setNotifications(bool newValue) async {
    return (await SharedPreferences.getInstance())
        .setBool(_hasNotifications, newValue);
  }

  /// 1   para authenticacion con google
  /// 2   para authenticacion con generic
  /// 3   para authenticacion con Apple
  Future<bool> setTypeAuthentication(AuthenticationType value) async {
    final result = await SharedPreferences.getInstance();
    int store = 0;
    switch (value) {
      case AuthenticationType.apple:
        store = 3;
        break;
      case AuthenticationType.generic:
        store = 2;
        break;
      default:
        store = 1;
    }
    return result.setInt(_authenticationType, store);
  }

  Future<AuthenticationType> getTypeAuthentication() async {
    final result = await SharedPreferences.getInstance();
    final value = result.getInt(_authenticationType);
    switch (value) {
      case 3:
        return AuthenticationType.apple;
      case 2:
        return AuthenticationType.generic;
      default:
        return AuthenticationType.google;
    }
  }

  Future<bool> getProfile() async {
    return (await SharedPreferences.getInstance()).getBool(_isEmployee) ??
        false;
  }

  Future<bool> setProfile(bool newValue) async {
    return (await SharedPreferences.getInstance())
        .setBool(_isEmployee, newValue);
  }

  Future<bool> getProfileRRHH() async {
    return (await SharedPreferences.getInstance()).getBool(_isRRHH) ?? false;
  }

  Future<bool> setRRHH(bool newValue) async {
    return (await SharedPreferences.getInstance()).setBool(_isRRHH, newValue);
  }

  Future<bool> getWalkthrough() async {
    return (await SharedPreferences.getInstance()).getBool(_walkthrough) ??
        false;
  }

  Future<bool> setwalkthrough(bool newValue) async {
    return (await SharedPreferences.getInstance())
        .setBool(_walkthrough, newValue);
  }

  Future<bool> getFirstTime() async {
    return (await SharedPreferences.getInstance()).getBool(_signFirstTime) ??
        true;
  }

  Future<bool> setFirstTime(bool newValue) async {
    return (await SharedPreferences.getInstance())
        .setBool(_signFirstTime, newValue);
  }

  Future<bool> getContentDownloaded() async {
    return (await SharedPreferences.getInstance())
            .getBool(_contentDownloaded) ??
        true;
  }

  Future<bool> setContentDownloaded(bool newValue) async {
    return (await SharedPreferences.getInstance())
        .setBool(_contentDownloaded, newValue);
  }

  Future<bool> getHR() async {
    return (await SharedPreferences.getInstance()).getBool(_hr) ?? true;
  }

  Future<bool> setHR(bool newValue) async {
    return (await SharedPreferences.getInstance()).setBool(_hr, newValue);
  }

  /// [convertToNumber] takes care of parsing the string of the current version
  /// of the application and converting it into a double.

  int convertToNumber(String buildNumber) {
    final int numberVersion = int.parse(buildNumber);
    return numberVersion is int ? numberVersion : 39;
  }

  Future<bool> getBuildNumber(String build) async {
    final int buildNumber = convertToNumber(build);
    final int currentBuildNumber =
        (await SharedPreferences.getInstance()).getInt(_currentBuildNumber) ??
            39;
    return buildNumber.compareTo(currentBuildNumber) > 0;
  }

  Future<bool> setBuildNumber(String newValue) async {
    final int buildNumber = convertToNumber(newValue);
    return (await SharedPreferences.getInstance())
        .setInt(_currentBuildNumber, buildNumber);
  }

  Future<bool> getRememberMe() async {
    return (await SharedPreferences.getInstance()).getBool(_rememberMe) ??
        false;
  }

  Future<bool> setRememberMe(bool remember) async {
    return (await SharedPreferences.getInstance())
        .setBool(_rememberMe, remember);
  }
}
