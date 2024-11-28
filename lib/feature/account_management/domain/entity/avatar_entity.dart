import 'dart:typed_data';
import 'package:equatable/equatable.dart';

class AvatarEntity extends Equatable {
  AvatarEntity(this.avatar, this.fileLegth);
  final Stream<Uint8List> avatar;
  final int fileLegth;

  @override
  List<Object?> get props => [];
}
