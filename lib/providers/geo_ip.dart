import 'dart:convert';
import 'package:http/http.dart';
import 'package:ip_information/models/ip.dart';

class GeoIp {
  Future<Response> requestUserIpInfo() async {
    Response response = await requestIpInfo("remote");
    return response;
  }

  Future<Response> requestIpInfo(String ip) async {
    final response = await get(
        'https://api.hgbrasil.com/geoip?key=0d6051b9&address=$ip&precision=false');
    return response;
  }

  Ip parseResponse(Response response) {
    if (response == null) {
      return null;
    }
    Map<String, dynamic> data = json.decode(response.body);
    Map<String, dynamic> results = data["results"];
    Map<String, dynamic> country = results["country"];
    Map<String, dynamic> flag = country["flag"];

    final Ip ip = Ip(
      type: results["type"],
      address: results["address"],
      cityName: results["city"],
      continentName: results["continent"],
      countryName: country["name"],
      flagUrl: flag["svg"],
    );
    return ip;
  }
}
