// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class LocationModel extends Equatable {
  const LocationModel({
    required this.longitude,
    required this.latitude,
  });

  final double longitude;
  final double latitude;

  @override
  List<Object?> get props => [longitude, latitude];

  LocationModel copyWith({
    double? longitude,
    double? latitude,
  }) {
    return LocationModel(
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
    );
  }
}
