import 'package:flutter/material.dart';
import 'package:ip_information/utils/app_routes.dart';
import 'package:ip_information/views/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GeoIP',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.orange,
        fontFamily: 'Lato',
      ),
      //home: ProductOverviewScreen(),
      routes: {
        AppRoutes.HOME: (ctx) => HomePage(),
      },
    );
  }
}
