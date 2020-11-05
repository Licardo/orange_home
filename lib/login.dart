import 'package:flutter/material.dart';

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'),
      ),
      body: PageWidget(),
    );
  }
}

class PageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PageState();
  }
}

class PageState extends State {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                      labelText: 'name',
                      border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF56F5FF), width: 5), gapPadding: 10)
                  ),
                ),
              ),
            ),
            Padding (
              padding: EdgeInsets.all(15),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'password',
                    border: OutlineInputBorder()
                ),
              ),
            ),
            RaisedButton(
                onPressed:  (){
                  Navigator.of(context).pushNamed('home');
                  // Scaffold.of(context).showSnackBar(SnackBar(content: Text('login success')));
                },
                child: Text('登录'))
          ],
        ),
    );
  }
}