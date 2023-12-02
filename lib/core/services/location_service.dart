import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

abstract class LocationService {
  Future<Either<String, Position>> askLocationPermission();
}

class LocationServiceImpl implements LocationService {
  @override
  Future<Either<String, Position>> askLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return const Left('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return const Left('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return const Left('Location permissions are denied');
    }

    return Right(await Geolocator.getCurrentPosition());
  }
}
