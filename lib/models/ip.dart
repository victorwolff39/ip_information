import 'package:flutter/cupertino.dart';

class Ip {
  final String address;
  final String type;
  final String countryName;
  final String cityName;
  final String continentName;
  final String flagUrl;

  Ip({
    @required this.address,
    @required this.type,
    @required this.countryName,
    @required this.cityName,
    @required this.continentName,
    @required this.flagUrl,
  });
}
