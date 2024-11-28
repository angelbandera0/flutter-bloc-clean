import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/usercases/usercases.dart';
import '../entity/sign_up_entity.dart';
import '../repository/account_management_repository.dart';

class SignUpUserCase implements UserCase<bool, Params> {
  final AccountManagementRepository repository;

  SignUpUserCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await repository.singUp(params.signUpEntity);
  }
}

class Params extends Equatable {
  Params(this.signUpEntity);
  final SigUpEntity signUpEntity;

  @override
  List<Object> get props => [];
}
