import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          height: 60,
          width: 110,
          child: Image.asset("assets/ThingsTOD.png"),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 16, bottom: 16),
          child: GestureDetector(
              onTap: () {
                scaffoldkey.currentState.openDrawer();
              },
              child: Image.asset(
                "assets/menubar.png",
              )),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 15, top: 16, bottom: 16),
            child: Image.asset("assets/addd.png"),
          ),
        ],
        bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 15, bottom: 10),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[300],
                    ),
                    hintText: 'Search Task',
                    suffixIcon: Icon(Icons.search, color: Color(0xff6035D0)),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10, top: 5),
                  ),
                ),
              ),
            ),
            preferredSize: Size.fromHeight(60.0)),
      ),
      drawer: Drawer(
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
      ),
      body: Center(child: Text("data")),
    );
  }
}
