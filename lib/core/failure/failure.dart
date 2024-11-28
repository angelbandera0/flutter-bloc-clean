import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]);

  get message => null;
}

class NotFoundLoginFailure extends Failure {
  @override
  List<Object> get props => [message];

  get message => "That user is not registered";
}

class UnauthorizedLoginFailure extends Failure {
  @override
  List<Object> get props => [message];

  get message => "Your password is not valid";
}

class ServerFailure extends Failure {
  ServerFailure(this.message);

  late final String message;

  @override
  List<Object> get props => [message];
}

class PublishAuctionFailure extends Failure {
  PublishAuctionFailure(this.message);

  late final String message;

  @override
  List<Object> get props => [message];
}

class NetworkFailure extends Failure {
  @override
  List<Object> get props => [message];

  get message => "No connection to internet";
}

class OtherFailure extends Failure {
  @override
  List<Object> get props => [message];

  get message => "Something went wrong on the server";
}

class TwilioFailure extends Failure {
  @override
  List<Object> get props => [message];

  get message => "The phone number is wrong";
}
