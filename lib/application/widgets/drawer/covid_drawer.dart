import 'package:flutter/material.dart';

class CovidDrawer extends StatelessWidget {
  const CovidDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          ListTile(title: Text('Covid stats'),),
          ListTile(title: Text('Vaccination stats')),
        ],
      ),
    );
  }
}