import 'package:equatable/equatable.dart';

class PhoneEntity extends Equatable {
  PhoneEntity(this.code, this.number);

  final String code;
  final String number;

  Map<String, dynamic> toJson() => {
        'code': code,
        'number': number,
      };

  factory PhoneEntity.fromJson(Map<String, dynamic> json) {
    return PhoneEntity(json['code'] as String, json['number'] as String);
  }

  @override
  List<Object?> get props => [];
}
