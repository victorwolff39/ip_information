import 'package:flutter/material.dart';
import 'package:ip_information/views/custom_ip.dart';
import 'package:ip_information/views/local_ip.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedScreenIndex = 0;
  List<Map<String, Object>> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'IP Automático',
        'screen': LocalIp(),
      },
      {
        'title': 'IP Manual',
        'screen': CustomIp(),
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['title']),
        centerTitle: true,
      ),
      body: _screens[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        onTap: _selectScreen,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: _selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            title: Text('Automático'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            title: Text('Manual'),
          )
        ],
      ),
    );
  }
}
