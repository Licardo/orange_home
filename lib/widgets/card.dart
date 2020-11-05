import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Card(
              color: Colors.amberAccent,
              elevation: 2,
              child: Container(
                width: 200,
                height: 100,
                child: Text('card'),
              ),
            )
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.amberAccent,
                child: Text('AB'),
              ),
              label: Text('Chip label'),
            ),
          )
        ],
      ),
    );
  }

}