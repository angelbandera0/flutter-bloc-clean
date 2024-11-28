import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/usercases/usercases.dart';
import '../repository/account_management_repository.dart';

class LogInRememberUseCase implements UserCase<bool, NoParams> {
  LogInRememberUseCase(this.repository);
  final AccountManagementRepository repository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.logInCredential();
  }
}
