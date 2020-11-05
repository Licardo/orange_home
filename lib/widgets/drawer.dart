import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Drawer(
        elevation: 8,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amberAccent
              ),
              child: Text('drawer',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15
                ),
              )
            ),
            ListTile(
              title: Text('抽屉1'),
              leading: Icon(Icons.satellite),
            )
          ],
        )
      ),
    );
  }

}