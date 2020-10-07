import 'package:flutter/material.dart';
import 'package:ip_information/models/ip.dart';
import 'package:ip_information/providers/geo_ip.dart';
import 'package:ip_information/widgets/ip_overview.dart';

class LocalIp extends StatelessWidget {
  GeoIp geoIp = GeoIp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: geoIp.requestUserIpInfo(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.error != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.signal_wifi_off,
                  color: Theme.of(context).errorColor,
                  size: 40,
                ),
                Text(
                  'Erro de rede',
                  style: TextStyle(
                      color: Theme.of(context).errorColor, fontSize: 20),
                )
              ],
            ),
          );
        } else {
          Ip ip;
          if (snapshot.data != null) {
            ip = geoIp.parseResponse(snapshot.data);
          }
          return LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [IpOverview(ip)],
              );
            },
          );
        }
      },
    );
  }
}
