import 'package:equatable/equatable.dart';

class CarEntity extends Equatable {
  final String brand;
  final String model;
  final String parkingSpotNumber;
  final String plateNumber;
  final String color;

  CarEntity(this.brand, this.model, this.parkingSpotNumber, this.plateNumber,
      this.color);

  @override
  List<Object> get props => [];
}
