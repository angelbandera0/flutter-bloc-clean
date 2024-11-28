
import '../../domain/entity/recover_account_response_entity.dart';

class RecoverAccountResponseModel extends RecoverAccountResponseEntity {
  final String? phoneNumber;

  RecoverAccountResponseModel(
    this.phoneNumber,
  ) : super(
          phoneNumber,
        );

  factory RecoverAccountResponseModel.fromJson(Map<String, dynamic> json) {
    return RecoverAccountResponseModel((json["result"] as String?));
  }
}
