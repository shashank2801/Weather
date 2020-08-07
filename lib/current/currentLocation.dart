import 'package:geolocator/geolocator.dart';

class Location{
  String longitude;
  String lattitude;
  
  // we can only await on methods that returns future. That's why we made the return type as Future.
  Future<void> getCurrentLocation() async {
    try{
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
      longitude = position.longitude.toStringAsFixed(2);
      lattitude = position.latitude.toStringAsFixed(2);
    }
    catch(e){
      print(e);
    }
    
  }
}