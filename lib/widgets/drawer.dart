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
          contentPadding: const EdgeInsets.only(left: 15),
          leading: Icon(
            Icons.add,
            size: 40,
            color: Colors.black,
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'New Task',
              style: TextStyle(fontSize: 17),
            ),
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.only(left: 25),
          leading: Icon(
            Icons.logout,
            size: 28,
            color: Colors.black,
          ),
          title: Text(
            'Logout',
            style: TextStyle(fontSize: 17),
          ),
        ),
      ],
    ),
  );
}
