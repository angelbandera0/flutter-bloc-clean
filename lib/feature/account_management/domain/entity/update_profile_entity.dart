import 'package:equatable/equatable.dart';

class UpdateProfileEntity extends Equatable {
  UpdateProfileEntity({this.country, this.number, this.name, this.email});
  final String? name;
  final String? email;
  final String? country;
  final String? number;

  @override
  List<Object?> get props => [];
}
