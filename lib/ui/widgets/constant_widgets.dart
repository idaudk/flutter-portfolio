import 'package:flutter/material.dart';

var mobileDrawer = Drawer(
  backgroundColor: Colors.grey[300],
  child: const Column(children: [
    DrawerHeader(
      child: Center(child: Text('DAUD K\'S PORTFOLIO')),
    ),
    ListTile(
      leading: Icon(Icons.home),
      title: Text('HOME'),
    ),
    ListTile(
      leading: Icon(Icons.message),
      title: Text('ABOUT'),
    ),
    ListTile(
      leading: Icon(Icons.settings),
      title: Text('PORTFOLIO'),
    ),
    ListTile(
      leading: Icon(Icons.logout),
      title: Text('CONTACT'),
    ),
  ]),
);
