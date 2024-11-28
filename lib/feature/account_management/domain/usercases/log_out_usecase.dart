
import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/usercases/usercases.dart';
import '../repository/account_management_repository.dart';

class LogOutUseCase implements UserCase<bool, NoParams> {
  LogOutUseCase(this._repository);
  final AccountManagementRepository _repository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await _repository.logOut();
  }
}
