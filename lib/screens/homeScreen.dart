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
          height: 50,
          width: 100,
          child: Image.asset("assets/ThingsTOD.png"),
        ),
        leading: Padding(
          padding:
              const EdgeInsets.only(left: 10.0, right: 10, top: 8, bottom: 6),
          child: GestureDetector(
              onTap: () {
                scaffoldkey.currentState.openDrawer();
              },
              child: Image.asset(
                "assets/menubar.png",
              )),
        ),
        bottom: PreferredSize(
            child: Icon(
              Icons.linear_scale,
              size: 60.0,
            ),
            preferredSize: Size.fromHeight(40.0)),
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
