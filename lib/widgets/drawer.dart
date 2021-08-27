import 'package:flutter/material.dart';

Widget drawerr(context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          color: Color(0xff6035D0),
          child: DrawerHeader(
            child: Column(
              children: [
                Center(
                    child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage("assets/Logo.png"),
                )),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Ishaq Hassan",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: Colors.white,
          child: Column(
            children: [
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
        )
      ],
    ),
  );
}
