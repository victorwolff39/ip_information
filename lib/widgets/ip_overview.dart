import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ip_information/models/ip.dart';

class IpOverview extends StatelessWidget {
  final Ip ipInfo;

  IpOverview(this.ipInfo);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 6,
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(7),
                    topRight: Radius.circular(7),
                    bottomLeft: Radius.circular(7),
                    bottomRight: Radius.circular(7),
                  ),
                  child: Container(
                    width: 80,
                    height: 50,
                    child: SvgPicture.network(
                      ipInfo.flagUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                        Text("IP: ${ipInfo.address}", style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20),),
                        Text("Tipo: ${ipInfo.type}", style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20),),
                      ],
                    ),
                  ],
                ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Cidade:", style: TextStyle(fontSize: 20),),
                    Text("${ipInfo.cityName}", style: TextStyle(fontSize: 20), textAlign: TextAlign.right,),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("País:", style: TextStyle(fontSize: 20),),
                    Text("${ipInfo.countryName}", style: TextStyle(fontSize: 20), textAlign: TextAlign.right,),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Continente:", style: TextStyle(fontSize: 20),),
                    Text("${ipInfo.continentName}", style: TextStyle(fontSize: 20), textAlign: TextAlign.right,),
                  ],
                ),
              ],
            ),
          )
            ],
          ),
      );
  }
}
