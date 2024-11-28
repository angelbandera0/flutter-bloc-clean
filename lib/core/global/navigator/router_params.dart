

abstract class RouteParams {}

class ParamsFromSignUpPage extends RouteParams {
  ParamsFromSignUpPage(this.email, this.phoneNumber);
  final String email;
  final String phoneNumber;
}

class ParamsFromRecoveryAccountPage extends RouteParams {
  ParamsFromRecoveryAccountPage(this.email);
  final String email;
}

class ParamsFromValidatePhonePage extends RouteParams {
  ParamsFromValidatePhonePage(this.code);
  final String code;
}

class ParamsFromUpdateUserProfile extends RouteParams {
  ParamsFromUpdateUserProfile(
      {this.userName, this.email, this.country, this.number});
  final String? userName;
  final String? email;
  final String? country;
  final String? number;
}




