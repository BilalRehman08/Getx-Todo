import 'package:flutter/material.dart';

Widget drawerr() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          child: Column(
            children: [
              Center(
                child: Image(
                  image: AssetImage("assets/Logo.png"),
                  fit: BoxFit.contain,
                  height: 96,
                  width: 96,
                ),
              ),
              Text(
                "Vigisoft",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                "www.vigisoft.com.br",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          title: Text(
            'Service Orders',
          ),
        ),
        ListTile(
          title: Text(
            'Settings',
          ),
        ),
      ],
    ),
  );
}
