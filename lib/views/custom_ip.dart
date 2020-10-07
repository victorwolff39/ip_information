import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ip_information/models/ip.dart';
import 'package:ip_information/providers/geo_ip.dart';
import 'package:ip_information/widgets/ip_overview.dart';

class CustomIp extends StatefulWidget {
  @override
  _CustomIpState createState() => _CustomIpState();
}

class _CustomIpState extends State<CustomIp> {
  final _ipController = TextEditingController();
  final _form = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _searchedIp = false;
  Ip ip = Ip();

  _searchIp() async {
    if (_form.currentState.validate()) {
      GeoIp geoIp = GeoIp();
      setState(() {
        _isLoading = true;
      });
      Response response = await geoIp.requestIpInfo(_ipController.text);
      if (response != null) {
        ip = geoIp.parseResponse(response);
        _searchedIp = true;
      }
    }
    setState(() {
      _isLoading = false;
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final availableWidth = mediaQuery.size.width;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: availableWidth * 0.6,
                  child: Form(
                    key: _form,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'Informe o IP',
                        labelText: 'IP',
                      ),
                      controller: _ipController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.contains(",") || value.contains(" ")) {
                          return "IP inválido.";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Container(
                  width: availableWidth * 0.25,
                  child: _isLoading
                      ? Center(child: CircularProgressIndicator())
                      : FlatButton(
                    child: Text(
                      'Buscar',
                      style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () {
                      return _isLoading ? null : _searchIp();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            if(!_isLoading && _searchedIp)
              IpOverview(ip),
          ],
        ),
      ),
    );
  }
}
