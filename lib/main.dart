import 'package:flutter/material.dart';
import 'package:orange_home/widgets/banner.dart';
import 'package:orange_home/detail.dart';
import 'package:orange_home/home.dart';
import 'package:orange_home/login.dart';
import 'package:orange_home/tab_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'orange home',
      initialRoute: '/',
      routes: {
        // '/': (context)=>MyApp(),
        // 'login': (context)=> new LoginWidget(),
        // 'home': (context)=> new HomeWidget(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context){
          switch(settings.name) {
            case 'home':
              return HomeWidget();
            case 'login':
              return LoginWidget();
            case 'detail':
              return DetailWidget();
            case 'tab':
              return TabWidget();
            case 'banner':
              return BannerWidget();
          }
          return Center( child: Text("onGenerateRoute"));
        },
            settings: settings);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return Center(child: Text("onUnknownRoute"));
        },
            settings: settings);
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()async {
            await Navigator.of(context).pushNamed("login");
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
